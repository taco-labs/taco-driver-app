import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_timer.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/permissions_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  StopWatchTimer? timerController;
  String? timerValue;
  int? timerMilliseconds;
  ApiCallResponse? apiResultd76;
  ApiCallResponse? apiResult438;
  ApiCallResponse? apiResultkg1;
  LatLng? currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.initGeolocatorStream();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    timerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      drawer: Drawer(
        elevation: 16,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 30, 15, 30),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    FFAppState().driverFirstName,
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                        ),
                  ),
                  Text(
                    '님 안녕하세요',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                        ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () async {
                context.pushNamed('DriverProfile');
              },
              child: ListTile(
                title: Text(
                  '내 정보',
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                      ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF303030),
                  size: 20,
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: false,
              ),
            ),
            InkWell(
              onTap: () async {
                context.pushNamed('RideHistory');
              },
              child: ListTile(
                title: Text(
                  '이용내역',
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                      ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF303030),
                  size: 20,
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: false,
              ),
            ),
            ListTile(
              title: Text(
                '정산관리',
                style: FlutterFlowTheme.of(context).title3.override(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                    ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF303030),
                size: 20,
              ),
              tileColor: Color(0xFFF5F5F5),
              dense: false,
            ),
            InkWell(
              onTap: () async {
                context.pushNamed('Setting');
              },
              child: ListTile(
                title: Text(
                  '설정',
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                      ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF303030),
                  size: 20,
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: false,
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.drag_handle,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            scaffoldKey.currentState!.openDrawer();
          },
        ),
        title: Text(
          '운행',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                if (FFAppState().isOnDuty)
                  Align(
                    alignment: AlignmentDirectional(0, -0.2),
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x33000000),
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 40, 0),
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
                              color: FlutterFlowTheme.of(context).primaryColor,
                              strokeWidth: 2.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (!FFAppState().isOnDuty)
                  Align(
                    alignment: AlignmentDirectional(0, 0.15),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await requestPermission(locationPermission);
                        apiResult438 =
                            await DriverInfoGroup.updateOnDutyCall.call(
                          apiToken: FFAppState().apiToken,
                          driverId: FFAppState().driverId,
                          onDuty: true,
                        );
                        if ((apiResult438?.succeeded ?? true)) {
                          setState(() => FFAppState().isOnDuty = true);
                          await actions.startStreamCurrentLocation();
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
                      text: '콜 받기',
                      options: FFButtonOptions(
                        width: 130,
                        height: 40,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                if (FFAppState().isOnDuty)
                  Align(
                    alignment: AlignmentDirectional(0, 0.15),
                    child: FFButtonWidget(
                      onPressed: () async {
                        apiResultkg1 =
                            await DriverInfoGroup.updateOnDutyCall.call(
                          apiToken: FFAppState().apiToken,
                          driverId: FFAppState().driverId,
                          onDuty: false,
                        );
                        if ((apiResultkg1?.succeeded ?? true)) {
                          setState(() => FFAppState().isOnDuty = false);
                          await actions.cancelStreamCurrentLocation();
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
                        width: 130,
                        height: 40,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                FlutterFlowTimer(
                  timerValue: timerValue ??= StopWatchTimer.getDisplayTime(
                    timerMilliseconds ??= 10000,
                    hours: true,
                    minute: true,
                    second: true,
                    milliSecond: false,
                  ),
                  timer: timerController ??= StopWatchTimer(
                    mode: StopWatchMode.countDown,
                    presetMillisecond: timerMilliseconds ??= 10000,
                    onChange: (value) {
                      setState(() {
                        timerMilliseconds = value;
                        timerValue = StopWatchTimer.getDisplayTime(
                          value,
                          hours: true,
                          minute: true,
                          second: true,
                          milliSecond: false,
                        );
                      });
                    },
                  ),
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                  onEnded: () async {
                    currentUserLocationValue = await getCurrentUserLocation(
                        defaultLocation: LatLng(0.0, 0.0));
                    apiResultd76 =
                        await DriverInfoGroup.updateDriverLocationCall.call(
                      driverId: FFAppState().driverId,
                      apiToken: FFAppState().apiToken,
                      latitude: functions
                          .toLatitudeFromLatLng(currentUserLocationValue!),
                      longitude: functions
                          .toLongitudeFromLatLng(currentUserLocationValue!),
                    );
                    if (!(apiResultd76?.succeeded ?? true)) {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('위치 갱신 실패'),
                            content: Text(
                                (apiResultd76?.statusCode ?? 200).toString()),
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
                    timerController?.onExecute.add(
                      StopWatchExecute.start,
                    );

                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
