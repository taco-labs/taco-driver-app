import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:taco_driver/flutter_flow/flutter_flow_theme.dart';
import 'package:taco_driver/flutter_flow/flutter_flow_widgets.dart';
import 'package:taco_driver/v2/models/taxi_call.dart';

class TaxiCallTicketDistributedWidget extends HookWidget {
  String _toHumanFriendlyDistanceFromMeters(int meters) {
    double distanceInKillometers = meters / 1000;

    return '$distanceInKillometers km';
  }

  String _toHumanFreindlyEtaFromNanoseconds(int nanoSeconds) {
    int minutes = nanoSeconds ~/ 1000000000 ~/ 60;

    return '${minutes.toString()} 분';
  }

  const TaxiCallTicketDistributedWidget({
    Key? key,
    required this.ticket,
    required this.onAccept,
    required this.onReject,
    required this.onEnd,
    required this.audioPlayer,
  }) : super(key: key);

  final TaxiCallTicket ticket;
  final Function()? onReject;
  final Function()? onAccept;
  final Function()? onEnd;
  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    final actionDispatched = useState(false);

    final closeExpiredFuture = useMemoized(() async {
      return Future.delayed(ticket.expireTime().difference(DateTime.now()),
          () async {
        if (actionDispatched.value) {
          return;
        }
        return await onEnd?.call();
      });
    }, [ticket.taxiCallRequestId, ticket.ticketId]);
    useFuture(closeExpiredFuture);

    useEffect(() {
      if (audioPlayer.playing) {
        audioPlayer.stop();
      }
      audioPlayer.setAsset('assets/audios/CallRequested.mp3');
      audioPlayer.load();
      audioPlayer.play();
      return () {};
    }, [ticket.taxiCallRequestId, ticket.ticketId]);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (ticket.tags != '')
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ticket.tags,
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        style: FlutterFlowTheme.of(context).title1.override(
                              fontFamily: 'Outfit',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ),
              if (ticket.userTag != '')
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ticket.userTag,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: FlutterFlowTheme.of(context).title1.override(
                              fontFamily: 'Outfit',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                        child: Text(
                          '출발지 약 ${_toHumanFriendlyDistanceFromMeters(ticket.toDepartureDistance)}',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).title1.override(
                                fontFamily: 'Outfit',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      Text(
                        '목적지 ${_toHumanFriendlyDistanceFromMeters(ticket.toArrivalDistance)} / ${_toHumanFreindlyEtaFromNanoseconds(ticket.toArrivalETA)}',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).title1.override(
                              fontFamily: 'Outfit',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (ticket.additionalPrice > 0)
                        Text(
                          '타코 ${ticket.additionalPrice.toString()}개',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).title1.override(
                                fontFamily: 'Outfit',
                                color: FlutterFlowTheme.of(context).alternate,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${ticket.departureAddressRegionDepth2}  ${ticket.departureAddressRegionDepth3}',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).title1.override(
                              fontFamily: 'Outfit',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                        child: Text(
                          ticket.departureName,
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).title1.override(
                                fontFamily: 'Outfit',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
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
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 30,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${ticket.arrivalAddressRegionDepth2}  ${ticket.arrivalAddressRegionDepth3}',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).title1.override(
                              fontFamily: 'Outfit',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                        child: Text(
                          ticket.arrivalName,
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).title1.override(
                                fontFamily: 'Outfit',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
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
                padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          actionDispatched.value = true;
                          await onReject?.call();
                          actionDispatched.value = false;
                        },
                        text: '거절',
                        options: FFButtonOptions(
                          width: 100,
                          height: 60,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 18,
                                  ),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          actionDispatched.value = true;
                          await onAccept?.call();
                          actionDispatched.value = false;
                        },
                        text: '콜 수락',
                        options: FFButtonOptions(
                          width: 140,
                          height: 60,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                          borderSide: const BorderSide(
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
    );
  }
}
