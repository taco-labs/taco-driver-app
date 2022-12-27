// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '../actions/index.dart' as actions;
import '../widgets/index.dart' as custom_widgets;
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../backend/api_requests/api_calls.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';
import '../../flutter_flow/custom_functions.dart'
    as functions; // Imports custom functions
import 'package:url_launcher/url_launcher.dart';
import '../../flutter_flow/permissions_util.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:isolate';
import 'dart:ui';

const String NotificationCategory_Taxicall = "Taxicall";
const String NotificationCategory_Payment = "Payment";
const String NotificationCategory_Driver = "Driver";

const String TaxiCallStateRequested = "TAXI_CALL_REQUESTED";
const String TaxiCallStateUserCancelled = "USER_CANCELLED";

const FOREGROUND_ISOLATE_PORT_NAME = 'foreground_port';
@pragma('vm:entry-point')
Future<void> _fcmMessageHandlerBackground(RemoteMessage message) async {
  debugPrint(
      "_fcmMessageHandlerBackground received ${message.data.toString()}");
  final foreground =
      IsolateNameServer.lookupPortByName(FOREGROUND_ISOLATE_PORT_NAME);
  if (foreground != null) {
    foreground.send(message);
  } else {
    // ... handle message in background ...
    debugPrint('foreground is null');
  }
}

class LocalNotification {
  LocalNotification._();

  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static initialize() async {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('mipmap/ic_launcher');

    InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);

    const AndroidNotificationChannel androidNotificationChannel =
        AndroidNotificationChannel(
      'taco_driver_channel_id', // 임의의 id
      'Taco Driver Channel', // 설정에 보일 채널명
      description: 'Taco Driver Channel', // 설정에 보일 채널 설명
      importance: Importance.max,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidNotificationChannel);
  }
}

class DriverCallManager extends StatefulWidget {
  const DriverCallManager({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _DriverCallManagerState createState() => _DriverCallManagerState();
}

class _DriverCallManagerState extends State<DriverCallManager> {
  ApiCallResponse? apiResult438;
  ApiCallResponse? apiResult439;
  ApiCallResponse? apiResultkg1;
  ApiCallResponse? apiResultCancelCall2;
  ApiCallResponse? apiResultCancelCall;
  ApiCallResponse? apiResultDriverToArrival;
  ApiCallResponse? apiResultj1q;
  ApiCallResponse? apiResultw8d;
  ApiCallResponse? apiResultDoneTaxiCall;
  ApiCallResponse? apiResultyb9;
  TextEditingController? taxiFareController;
  TextEditingController? tollFareController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  ReceivePort? _foregroundReceivePort;
  StreamSubscription<RemoteMessage>? _foregroundMessageSubscription;

  Future setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleInitialMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    //FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundMessage);

    // foreground handler
    _foregroundMessageSubscription =
        FirebaseMessaging.onMessage.listen(_handleMessage);

    FirebaseMessaging.onBackgroundMessage(_fcmMessageHandlerBackground);

    _foregroundReceivePort = ReceivePort();
    if (!(IsolateNameServer.registerPortWithName(
      _foregroundReceivePort!.sendPort,
      FOREGROUND_ISOLATE_PORT_NAME,
    ))) {
      print('registerPortWithName failed in call manager');
    }
    _foregroundReceivePort!.listen(_handleBackgroundMessage);
  }

  void cleanupInteractedMessage() {
    _foregroundMessageSubscription?.cancel();
  }

  void _handleMessage(RemoteMessage message) async {
    dynamic data = message.data;
    debugPrint('Message received in foreground  ${data.toString()}');

    switch (data['category']) {
      case NotificationCategory_Driver:
        setState(() {
          FFAppState().driverIsActivated = true;
        });
        break;
      case NotificationCategory_Taxicall:
        if (data['taxiCallState'] == TaxiCallStateRequested) {
          setState(() {
            actions.fromCallRequestedMessagePayload(message.data);
            actions.setCallState('TAXI_CALL_REQUESTED');
          });
        } else if (data['taxiCallState'] == TaxiCallStateUserCancelled) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                content: Text('승객의 요청으로 배차가 취소되었습니다'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('확인'),
                  ),
                ],
              );
            },
          );

          setState(() {
            actions.setCallState('TAXI_CALL_WAITING');
          });
        }
        break;
    }
  }

  void _handleInitialMessage(RemoteMessage message) async {
    dynamic data = message.data;
    debugPrint('Initial data received ${data.toString()}');

    switch (data['category']) {
      case NotificationCategory_Driver:
        setState(() {
          FFAppState().driverIsActivated = true;
        });
        break;
      case NotificationCategory_Taxicall:
        if (data['taxiCallState'] == TaxiCallStateRequested) {
          if (FFAppState().driverIsOnDuty) {
            apiResultyb9 = await TaxiCallGroup.getLatestTaxiCallTicketCall.call(
              apiToken: FFAppState().apiToken,
              driverId: FFAppState().driverId,
              apiEndpointTarget: FFAppState().apiEndpointTarget,
            );
            if ((apiResultyb9?.succeeded ?? true)) {
              setState(() {
                actions.fromGetLatestCallTicketlApiResponse(
                  (apiResultyb9?.jsonBody ?? ''),
                );
                actions.setCallState('TAXI_CALL_REQUESTED');
              });
            } else {
              setState(() {
                actions.setCallState('TAXI_CALL_WAITING');
              });
            }
          }
        } else if (data['taxiCallState'] == TaxiCallStateUserCancelled) {
          if (FFAppState().isOnDrivingToDeparture) {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return AlertDialog(
                  content: Text('승객의 요청으로 배차가 취소되었습니다'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: Text('확인'),
                    ),
                  ],
                );
              },
            );

            setState(() {
              actions.setCallState('TAXI_CALL_WAITING');
            });
          }
        }
        break;
    }
  }

  void _handleBackgroundMessage(dynamic message) async {
    if (message is! RemoteMessage) {
      print('got wrong data type for handling in foreground');
      return;
    }

    dynamic data = message.data;
    debugPrint('Data received in background ${data.toString()}');

    switch (data['category']) {
      case NotificationCategory_Driver:
        setState(() {
          FFAppState().driverIsActivated = true;
        });
        break;
      case NotificationCategory_Taxicall:
        if (data['taxiCallState'] == TaxiCallStateRequested) {
          setState(() {
            actions.fromCallRequestedMessagePayload(data);
            actions.setCallState('TAXI_CALL_REQUESTED');
          });
        } else if (data['taxiCallState'] == TaxiCallStateUserCancelled) {
          setState(() {
            actions.setCallState('TAXI_CALL_WAITING');
          });
        }
        break;
    }
  }

  @override
  void initState() {
    super.initState();

    IsolateNameServer.removePortNameMapping(FOREGROUND_ISOLATE_PORT_NAME);
    setupInteractedMessage();
    LocalNotification.initialize();

    taxiFareController = TextEditingController();
    tollFareController = TextEditingController(text: '0');
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
    debugPrint(
        'driverId ${FFAppState().driverId} apiToken ${FFAppState().apiToken}');
  }

  @override
  void dispose() {
    cleanupInteractedMessage();
    taxiFareController?.dispose();
    tollFareController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 60, 10, 0),
            child: Stack(
              children: [
                if (!FFAppState().isOnCallViewing &&
                    !FFAppState().isOnDrivingToDeparture &&
                    !FFAppState().isOnDrivingToArrival &&
                    !FFAppState().isArrived)
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x33000000),
                          offset: Offset(0, 2),
                        )
                      ],
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        width: 2,
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${FFAppState().driverLastName}${FFAppState().driverFirstName}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 16,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 0, 0),
                                  child: Text(
                                    '기사님 안녕하세요',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 16,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '기사님의 행복한 운행을 위한 플랫폼 타코입니다!',
                                    maxLines: 2,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 16,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  FFAppState().driverLicenseNumber,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  FFAppState().driverServiceRegion,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 18,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 0, 0),
                                  child: Text(
                                    FFAppState().driverCarNumber,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 18,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (FFAppState().isOnCallWaiting)
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 40, 0),
                                    child: Text(
                                      '콜 대기중입니다...',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 18,
                                          ),
                                    ),
                                  ),
                                  Container(
                                    width: 40,
                                    height: 40,
                                    child: custom_widgets.CallWaitingIndicator(
                                      width: 40,
                                      height: 40,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      strokeWidth: 2.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                if (FFAppState().isOnCallViewing)
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x33000000),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        width: 2,
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (FFAppState().callTagsConcat != null &&
                              FFAppState().callTagsConcat != '')
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      FFAppState().callTagsConcat,
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          if (FFAppState().callUserTag != null &&
                              FFAppState().callUserTag != '')
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    FFAppState().callUserTag,
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 5, 0),
                                    child: Text(
                                      '출발지 약 ${functions.toHumanFriendlyDistanceFromMeters(FFAppState().callToDepartureDistance.toString())}',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    '목적지 ${functions.toHumanFriendlyDistanceFromMeters(FFAppState().callToArrivalDistance.toString())} / ${functions.toHumanFreindlyEtaFromNanoseconds(FFAppState().callToArrivalEtaNanoSec.toString())}',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (FFAppState().callAdditionalPrice > 0)
                                    Text(
                                      '타코 ${FFAppState().callAdditionalPrice.toString()}개',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${FFAppState().callDepartureAddressRegionDepth2}  ${FFAppState().callDepartureAddressRegionDepth3} ',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2, 0, 0, 0),
                                    child: Text(
                                      FFAppState().callDepartureName != null &&
                                              FFAppState().callDepartureName !=
                                                  ''
                                          ? '${FFAppState().callDepartureName}'
                                          : '',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xFF101213),
                            size: 30,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${FFAppState().callArrivalAddressRegionDepth2}  ${FFAppState().callArrivalAddressRegionDepth3} ',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2, 0, 0, 0),
                                    child: Text(
                                      FFAppState().callArrivalName != null &&
                                              FFAppState().callArrivalName != ''
                                          ? '${FFAppState().callArrivalName}'
                                          : '',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 40, 0, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      apiResultw8d = await TaxiCallGroup
                                          .rejectTaxiCallTicketCall
                                          .call(
                                        ticketId: FFAppState().callTicketId,
                                        apiToken: FFAppState().apiToken,
                                        apiEndpointTarget:
                                            FFAppState().apiEndpointTarget,
                                      );
                                      if ((apiResultw8d?.succeeded ?? true)) {
                                        await actions.setCallState(
                                          'TAXI_CALL_WAITING',
                                        );
                                      } else {
                                        FFAppState().update(() {
                                          FFAppState().errCode = getJsonField(
                                            (apiResultw8d?.jsonBody ?? ''),
                                            r'''$.errCode''',
                                          ).toString();
                                        });
                                        if ((FFAppState().errCode ==
                                                'ERR_NOT_FOUND') ||
                                            (FFAppState().errCode ==
                                                'ERR_INVALID')) {
                                          await actions.setCallState(
                                            'TAXI_CALL_WAITING',
                                          );
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('오류'),
                                                content: Text(
                                                    '서버 오류가 발생하여 다시 시도해주세요'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('확인'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      }

                                      setState(() {});
                                    },
                                    text: '거절',
                                    options: FFButtonOptions(
                                      width: 100,
                                      height: 60,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      apiResultj1q = await TaxiCallGroup
                                          .acceptTaxiCallTicketCall
                                          .call(
                                        ticketId: FFAppState().callTicketId,
                                        apiToken: FFAppState().apiToken,
                                        apiEndpointTarget:
                                            FFAppState().apiEndpointTarget,
                                      );
                                      if ((apiResultj1q?.succeeded ?? true)) {
                                        await actions
                                            .fromGetLatestCallApiResponse(
                                          (apiResultj1q?.jsonBody ?? ''),
                                        );
                                        await actions.setCallState(
                                          'DRIVER_TO_DEPARTURE',
                                        );
                                      } else {
                                        FFAppState().update(() {
                                          FFAppState().errCode = getJsonField(
                                            (apiResultj1q?.jsonBody ?? ''),
                                            r'''$.errCode''',
                                          ).toString();
                                        });
                                        if ((FFAppState().errCode ==
                                                'ERR_NOT_FOUND') ||
                                            (FFAppState().errCode ==
                                                'ERR_INVALID')) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('오류'),
                                                content: Text('만료된 콜 요청입니다'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('확인'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          await actions.setCallState(
                                            'TAXI_CALL_WAITING',
                                          );
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('오류'),
                                                content: Text(
                                                    '서버 오류가 발생하여 다시 시도해주세요'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('확인'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      }

                                      setState(() {});
                                    },
                                    text: '콜 수락',
                                    options: FFButtonOptions(
                                      width: 140,
                                      height: 60,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (FFAppState().isOnDrivingToDeparture)
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x33000000),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        width: 2,
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 10, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        apiResultCancelCall =
                                            await TaxiCallGroup
                                                .cancelTaxiCallRequestCall
                                                .call(
                                          taxiCallRequestId:
                                              FFAppState().callId,
                                          apiToken: FFAppState().apiToken,
                                          apiEndpointTarget:
                                              FFAppState().apiEndpointTarget,
                                          confirmCancel: false,
                                        );
                                        if ((apiResultCancelCall?.succeeded ??
                                            true)) {
                                          await actions.setCallState(
                                            'TAXI_CALL_WAITING',
                                          );
                                        } else {
                                          FFAppState().update(() {
                                            FFAppState().errCode = getJsonField(
                                              (apiResultCancelCall?.jsonBody ??
                                                  ''),
                                              r'''$.errCode''',
                                            ).toString();
                                          });
                                          if (FFAppState().errCode ==
                                              'ERR_NEED_CONFIRMATION') {
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('주의'),
                                                          content: Text(
                                                              '콜 수락을 취소하시겠습니까? 정당한 사유없이 취소하는 경우 페널티가 부과됩니다'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text('유지'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child: Text('취소'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (confirmDialogResponse) {
                                              apiResultCancelCall2 =
                                                  await TaxiCallGroup
                                                      .cancelTaxiCallRequestCall
                                                      .call(
                                                taxiCallRequestId:
                                                    FFAppState().callId,
                                                apiToken: FFAppState().apiToken,
                                                apiEndpointTarget: FFAppState()
                                                    .apiEndpointTarget,
                                                confirmCancel: true,
                                              );
                                              if ((apiResultCancelCall2
                                                      ?.succeeded ??
                                                  true)) {
                                                await actions.setCallState(
                                                  'TAXI_CALL_WAITING',
                                                );
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text('오류'),
                                                      content: Text(
                                                          '서버 오류가 발생하여 다시 시도해주세요'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: Text('확인'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              }
                                            }
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('오류'),
                                                  content: Text(
                                                      '서버 오류가 발생하여 다시 시도해주세요'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('확인'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }
                                        }

                                        setState(() {});
                                      },
                                      text: '취소',
                                      options: FFButtonOptions(
                                        width: 80,
                                        height: 60,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 10, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await launchUrl(Uri(
                                          scheme: 'tel',
                                          path: FFAppState().callUserPhone,
                                        ));
                                      },
                                      text: '',
                                      icon: Icon(
                                        Icons.phone,
                                        size: 25,
                                      ),
                                      options: FFButtonOptions(
                                        width: 60,
                                        height: 60,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 10, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await launchUrl(Uri(
                                          scheme: 'sms',
                                          path: FFAppState().callUserPhone,
                                        ));
                                      },
                                      text: '',
                                      icon: Icon(
                                        Icons.message,
                                        size: 25,
                                      ),
                                      options: FFButtonOptions(
                                        width: 60,
                                        height: 60,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      await actions.launchKakaoNavi(
                                        functions.toLatitudeFromLatLng(
                                            FFAppState()
                                                .callDepartureCoordinate!),
                                        functions.toLongitudeFromLatLng(
                                            FFAppState()
                                                .callDepartureCoordinate!),
                                        '출발지',
                                      );
                                    },
                                    text: '길안내',
                                    options: FFButtonOptions(
                                      width: 100,
                                      height: 60,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (FFAppState().callTagsConcat != null &&
                              FFAppState().callTagsConcat != '')
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      FFAppState().callTagsConcat,
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          if (FFAppState().callUserTag != null &&
                              FFAppState().callUserTag != '')
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    FFAppState().callUserTag,
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${FFAppState().callDepartureAddressRegionDepth2}  ${FFAppState().callDepartureAddressRegionDepth3} ',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Text(
                                    functions.toAddressNo(
                                        FFAppState().callDepartureAddressSubNo,
                                        FFAppState()
                                            .callDepartureAddressMainNo),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Text(
                                    FFAppState().callDepartureName != null &&
                                            FFAppState().callDepartureName != ''
                                        ? '(${FFAppState().callDepartureName})'
                                        : '',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xFF101213),
                            size: 30,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${FFAppState().callArrivalAddressRegionDepth2}  ${FFAppState().callArrivalAddressRegionDepth3} ',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Text(
                                    functions.toAddressNo(
                                        FFAppState().callArrivalAddressSubNo,
                                        FFAppState().callArrivalAddressMainNo),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Text(
                                    FFAppState().callArrivalName != null &&
                                            FFAppState().callArrivalName != ''
                                        ? '(${FFAppState().callArrivalName})'
                                        : '',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 40, 0, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    apiResultDriverToArrival =
                                        await TaxiCallGroup
                                            .taxiCallDriverToArrivalCall
                                            .call(
                                      taxiCallRequestId: FFAppState().callId,
                                      apiToken: FFAppState().apiToken,
                                      apiEndpointTarget:
                                          FFAppState().apiEndpointTarget,
                                    );
                                    if ((apiResultDriverToArrival?.succeeded ??
                                        true)) {
                                      await actions.setCallState(
                                        'DRIVER_TO_ARRIVAL',
                                      );
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('오류'),
                                            content:
                                                Text('서버 오류가 발생하여 다시 시도해주세요'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('확인'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }

                                    setState(() {});
                                  },
                                  text: '손님 탐승 완료',
                                  options: FFButtonOptions(
                                    width: 300,
                                    height: 60,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (FFAppState().isOnDrivingToArrival)
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x33000000),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        width: 2,
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      await actions.launchKakaoNavi(
                                        functions.toLatitudeFromLatLng(
                                            FFAppState()
                                                .callArrivalCoordinate!),
                                        functions.toLongitudeFromLatLng(
                                            FFAppState()
                                                .callArrivalCoordinate!),
                                        '목적지',
                                      );
                                    },
                                    text: '길안내',
                                    options: FFButtonOptions(
                                      width: 100,
                                      height: 60,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (FFAppState().callTagsConcat != null &&
                              FFAppState().callTagsConcat != '')
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      FFAppState().callTagsConcat,
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          if (FFAppState().callUserTag != null &&
                              FFAppState().callUserTag != '')
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    FFAppState().callUserTag,
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${FFAppState().callDepartureAddressRegionDepth2}  ${FFAppState().callDepartureAddressRegionDepth3} ',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Text(
                                    functions.toAddressNo(
                                        FFAppState().callDepartureAddressSubNo,
                                        FFAppState()
                                            .callDepartureAddressMainNo),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Text(
                                    FFAppState().callDepartureName != null &&
                                            FFAppState().callDepartureName != ''
                                        ? '(${FFAppState().callDepartureName})'
                                        : '',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xFF101213),
                            size: 30,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${FFAppState().callArrivalAddressRegionDepth2}  ${FFAppState().callArrivalAddressRegionDepth3} ',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Text(
                                    functions.toAddressNo(
                                        FFAppState().callArrivalAddressSubNo,
                                        FFAppState().callArrivalAddressMainNo),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Text(
                                    FFAppState().callArrivalName != null &&
                                            FFAppState().callArrivalName != ''
                                        ? '(${FFAppState().callArrivalName})'
                                        : '',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 40, 0, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    await actions.setCallState(
                                      'ARRIVED',
                                    );
                                  },
                                  text: '목적지 도착',
                                  options: FFButtonOptions(
                                    width: 300,
                                    height: 60,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (FFAppState().isArrived)
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x33000000),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (FFAppState().callAdditionalPrice > 0)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 10),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 5, 0),
                                        child: Text(
                                          '적립 타코 ${FFAppState().callAdditionalPrice.toString()}개',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .title1
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                      if (FFAppState()
                                              .driverAdditionalRewardPrice >
                                          0)
                                        Text(
                                          '(추천인 추가 적립 ${FFAppState().driverAdditionalRewardPrice.toString()}개)',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .title1
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Form(
                                key: formKey,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    TextFormField(
                                      controller: taxiFareController,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: '운임',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 18,
                                            ),
                                        hintText: '최종 미터기 실 운임 입력',
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 20,
                                          ),
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return '운임을 정확히 입력해주세요';
                                        }

                                        if (val.length < 1) {
                                          return '운임을 정확히 입력해주세요';
                                        }

                                        return null;
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 5, 0, 10),
                                      child: TextFormField(
                                        controller: tollFareController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: '통행료',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 18,
                                                  ),
                                          hintText: '통행료 및 추가금액 입력',
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 20,
                                            ),
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 31, 0, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (formKey.currentState == null ||
                                      !formKey.currentState!.validate()) {
                                    return;
                                  }

                                  apiResultDoneTaxiCall =
                                      await TaxiCallGroup.doneTaxiCallCall.call(
                                    taxiCallRequestId: FFAppState().callId,
                                    basePrice:
                                        int.tryParse(taxiFareController!.text),
                                    apiToken: FFAppState().apiToken,
                                    tollFee: tollFareController!.text != null &&
                                            tollFareController!.text != ''
                                        ? int.tryParse(tollFareController!.text)
                                        : 0,
                                    apiEndpointTarget:
                                        FFAppState().apiEndpointTarget,
                                  );
                                  if ((apiResultDoneTaxiCall?.succeeded ??
                                      true)) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('운행 종료'),
                                          content: Text('승객에게 운임을 결제 받으세요'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('확인'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    setState(() {
                                      tollFareController?.clear();
                                      taxiFareController?.clear();
                                    });
                                    await actions.setCallState(
                                      'TAXI_CALL_WAITING',
                                    );
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('오류'),
                                          content:
                                              Text('서버 오류가 발생하여 다시 시도해주세요'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('확인'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }

                                  setState(() {});
                                },
                                text: '운행 종료',
                                options: FFButtonOptions(
                                  width: 300,
                                  height: 60,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
            child: Stack(
              children: [
                if (FFAppState().driverIsActivated &&
                    !FFAppState().driverIsOnDuty)
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (await getPermissionStatus(locationPermission)) {
                          apiResult438 =
                              await DriverInfoGroup.updateOnDutyCall.call(
                            apiToken: FFAppState().apiToken,
                            driverId: FFAppState().driverId,
                            onDuty: true,
                            apiEndpointTarget: FFAppState().apiEndpointTarget,
                          );
                          if ((apiResult438?.succeeded ?? true)) {
                            FFAppState().update(() {
                              FFAppState().driverIsOnDuty = true;
                            });
                            await actions.setCallState(
                              'TAXI_CALL_WAITING',
                            );
                            await actions.startLocationService();
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('오류'),
                                  content: Text('서버 오류가 발생하여 다시 시도해주세요'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('확인'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        } else {
                          var confirmDialogResponse = await showDialog<bool>(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('위치 정보 사용'),
                                    content: Text(
                                        '타코 기사용 앱은 앱이 종료되었거나 사용중이 아닐 때도 위치 데이터를 수집하여 승객과의 거리를 고려한 정확한 배차 기능을 지원합니다'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, false),
                                        child: Text('거부'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, true),
                                        child: Text('승인'),
                                      ),
                                    ],
                                  );
                                },
                              ) ??
                              false;
                          if (confirmDialogResponse) {
                            await requestPermission(locationPermission);
                            if (await getPermissionStatus(locationPermission)) {
                              apiResult439 =
                                  await DriverInfoGroup.updateOnDutyCall.call(
                                apiToken: FFAppState().apiToken,
                                driverId: FFAppState().driverId,
                                onDuty: true,
                                apiEndpointTarget:
                                    FFAppState().apiEndpointTarget,
                              );
                              if ((apiResult439?.succeeded ?? true)) {
                                FFAppState().update(() {
                                  FFAppState().driverIsOnDuty = true;
                                });
                                await actions.setCallState(
                                  'TAXI_CALL_WAITING',
                                );
                                await actions.startLocationService();
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('오류'),
                                      content: Text('서버 오류가 발생하여 다시 시도해주세요'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('확인'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            } else {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    content: Text(
                                        '정확한 배차 기능 제공을 위해서 위치 정보 접근을 허용해주세요'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('확인'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  content: Text(
                                      '정확한 배차 기능 제공을 위해서 위치 정보 접근을 허용해주세요'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('확인'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        }

                        setState(() {});
                      },
                      text: '콜 받기',
                      options: FFButtonOptions(
                        width: 150,
                        height: 60,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                if (FFAppState().driverIsOnDuty &&
                    !FFAppState().isOnDrivingToDeparture &&
                    !FFAppState().isOnDrivingToArrival &&
                    !FFAppState().isArrived &&
                    FFAppState().driverIsActivated)
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        apiResultkg1 =
                            await DriverInfoGroup.updateOnDutyCall.call(
                          apiToken: FFAppState().apiToken,
                          driverId: FFAppState().driverId,
                          onDuty: false,
                          apiEndpointTarget: FFAppState().apiEndpointTarget,
                        );
                        if ((apiResultkg1?.succeeded ?? true)) {
                          FFAppState().update(() {
                            FFAppState().driverIsOnDuty = false;
                          });
                          await actions.setCallState(
                            'NONE',
                          );
                          await actions.cancelLocationService();
                        } else {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('오류'),
                                content: Text('서버 오류가 발생하여 다시 시도해주세요'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('확인'),
                                  ),
                                ],
                              );
                            },
                          );
                        }

                        setState(() {});
                      },
                      text: '콜 멈추기',
                      options: FFButtonOptions(
                        width: 150,
                        height: 60,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                if (!FFAppState().driverIsActivated)
                  Material(
                    color: Colors.transparent,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x33000000),
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          width: 2,
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                          child: Text(
                            '등록해주신 정보로 승인 심사중입니다',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
