import 'dart:ui';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:taco_driver/custom_code/widgets/driver_call_manager.dart';
import 'package:taco_driver/flutter_flow/flutter_flow_theme.dart';
import 'package:taco_driver/v2/api/driver_api_wrapper.dart';
import 'package:taco_driver/v2/providers/client.dart';
import 'package:taco_driver/v2/providers/overlay_service_listener.dart';
import 'package:taco_driver/v2/widget/taxi_call_ticket_distribution.dart';

class TaxiCallTicketOverlayPage extends HookConsumerWidget {
  TaxiCallTicketOverlayPage({Key? key, required this.title}) : super(key: key);

  final String title;
  final audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apiClient = ref.watch(apiClientProvider);
    final taxiCallTicket = ref.watch(overlayTaxiCallStreamProvider);

    // TODO (taekyeom) 별도 서비스로 분리해서 갱신 해야 할듯
    ref.listen(overlayApiTokenStreamProvider, (previous, next) {
      next.whenData((value) => ref
          .read(apiClientProvider.notifier)
          .setHeader("Authorization", "Bearer ${value.token}"));
    });

    ref.listen(overlayTaxiCallStreamProvider, (previous, next) {});

    void _closeOverlay() {
      FlutterOverlayWindow.closeOverlay();
    }

    final body = taxiCallTicket.when(
        data: (ticket) => TaxiCallTicketDistributedWidget(
            ticket: ticket,
            onAccept: () async {
              try {
                final value = await apiClient
                    .invoke((client) => client.acceptTicket(ticket.ticketId));
                // TODO (taekyeom) 나중에는 Remotemessage가 없어야 함
                final remoteMessageData = value.toJson();
                remoteMessageData["category"] = NotificationCategory_Taxicall;
                remoteMessageData["taxiCallState"] = value.currentState;
                final remoteMessage = RemoteMessage(data: remoteMessageData);
                final foreground = IsolateNameServer.lookupPortByName(
                    FOREGROUND_ISOLATE_PORT_NAME);
                foreground?.send(remoteMessage);
                FlutterForegroundTask.launchApp();
              } on ApiError catch (error) {
                String errorMessage;
                if (error.errorCode == 'ERR_NOT_FOUND' &&
                    error.errorMessage == 'ERR_INVALID') {
                  errorMessage = "만료된 콜 요청입니다";
                } else {
                  errorMessage = '서버 오류가 발생했습니다';
                }
                await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text('오류'),
                        content: Text(errorMessage),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: Text('확인'),
                          ),
                        ],
                      );
                    });
              } finally {
                _closeOverlay();
              }
            },
            onReject: () async {
              try {
                await apiClient
                    .invoke((client) => client.rejectTicket(ticket.ticketId));
                final remoteMessage = RemoteMessage(data: {
                  'taxiCallState': ExtTaxiCallStateDriverRejected,
                });
                final foreground = IsolateNameServer.lookupPortByName(
                    FOREGROUND_ISOLATE_PORT_NAME);
                foreground?.send(remoteMessage);
              } on ApiError catch (_) {
              } finally {
                _closeOverlay();
              }
            },
            onEnd: () {
              // _closeOverlay();
            },
            audioPlayer: audioPlayer),
        error: (err, _) {
          // TODO (taekyeom) error handling
        },
        loading: () {
          return Center(child: CircularProgressIndicator());
        });

    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
      ),
      body: body,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _closeOverlay();
        },
        tooltip: 'Increment',
        backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
        child: const Icon(Icons.close),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
