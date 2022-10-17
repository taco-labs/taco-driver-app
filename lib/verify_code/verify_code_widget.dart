import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_timer.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyCodeWidget extends StatefulWidget {
  const VerifyCodeWidget({
    Key? key,
    this.phoneNumber,
    this.authSmsStateKey,
  }) : super(key: key);

  final String? phoneNumber;
  final String? authSmsStateKey;

  @override
  _VerifyCodeWidgetState createState() => _VerifyCodeWidgetState();
}

class _VerifyCodeWidgetState extends State<VerifyCodeWidget> {
  StopWatchTimer? timerController;
  String? timerValue;
  int? timerMilliseconds;
  ApiCallResponse? apiResultLatestCall;
  ApiCallResponse? apiResultUpdateDriver;
  ApiCallResponse? apiResultf8v;
  String? fcmToken;
  TextEditingController? textController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      timerController?.onExecute.add(
        StopWatchExecute.start,
      );
    });

    textController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    textController?.dispose();
    timerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          '휴대폰 번호 인증',
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: TextFormField(
                      controller: textController,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: '숫자 6자리 입력',
                        hintStyle: FlutterFlowTheme.of(context).bodyText2,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (formKey.currentState == null ||
                          !formKey.currentState!.validate()) {
                        return;
                      }

                      apiResultf8v = await SigninFlowGroup
                          .sMSVerificationAndSigninCall
                          .call(
                        stateKey: widget.authSmsStateKey,
                        verificationCode: textController!.text,
                      );
                      if ((apiResultf8v?.succeeded ?? true)) {
                        setState(() => FFAppState().apiToken =
                            SigninFlowGroup.sMSVerificationAndSigninCall
                                .apiToken(
                                  (apiResultf8v?.jsonBody ?? ''),
                                )
                                .toString());
                        setState(() => FFAppState().driverId =
                            SigninFlowGroup.sMSVerificationAndSigninCall
                                .driverId(
                                  (apiResultf8v?.jsonBody ?? ''),
                                )
                                .toString());
                        setState(() => FFAppState().isOnDuty = SigninFlowGroup
                                .sMSVerificationAndSigninCall
                                .driverIsOnDuty(
                              (apiResultf8v?.jsonBody ?? ''),
                            ));
                        setState(() => FFAppState().driverFirstName =
                            SigninFlowGroup.sMSVerificationAndSigninCall
                                .driverFirstName(
                                  (apiResultf8v?.jsonBody ?? ''),
                                )
                                .toString());
                        if (isAndroid ? true : false) {
                          setState(() => FFAppState().appOs = 'AOS');
                        } else {
                          if (isiOS ? true : false) {
                            setState(() => FFAppState().appOs = 'IOS');
                          } else {
                            if (isWeb ? true : false) {
                              setState(() => FFAppState().appOs = 'WEB');
                            } else {
                              setState(() => FFAppState().appOs = 'UNKNOWN');
                            }
                          }
                        }

                        fcmToken = await actions.getFcmToken();
                        apiResultUpdateDriver =
                            await DriverInfoGroup.updateDriverCall.call(
                          driverId: FFAppState().driverId,
                          apiToken: FFAppState().apiToken,
                          appOs: FFAppState().appOs,
                          appVersion: FFAppState().appVersion,
                          appFcmToken: fcmToken,
                        );
                        if ((apiResultUpdateDriver?.succeeded ?? true)) {
                          apiResultLatestCall =
                              await TaxiCallGroup.getLatestTaxiCallCall.call(
                            driverId: FFAppState().driverId,
                            apiToken: FFAppState().apiToken,
                          );
                          if ((apiResultLatestCall?.succeeded ?? true) ||
                              ((apiResultLatestCall?.statusCode ?? 200) ==
                                  404)) {
                            setState(() => FFAppState().latestCallState =
                                TaxiCallGroup.getLatestTaxiCallCall
                                    .callCurrentState(
                                      (apiResultLatestCall?.jsonBody ?? ''),
                                    )
                                    .toString());
                            setState(() => FFAppState().callRequest =
                                (apiResultLatestCall?.jsonBody ?? ''));
                            if (FFAppState().latestCallState ==
                                'DRIVER_TO_DEPARTURE') {
                              context.pushNamed('OnDrivingToDeparture');
                            } else {
                              if (FFAppState().latestCallState ==
                                  'DRIVER_TO_ARRIVAL') {
                                context.pushNamed('OnDrivingToArrival');
                              } else {
                                context.goNamed('Home');
                              }
                            }
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
                        if ((apiResultf8v?.statusCode ?? 200) == 404) {
                          context.pushNamed(
                            'RegisterDriver',
                            queryParams: {
                              'phoneNumber': serializeParam(
                                widget.phoneNumber,
                                ParamType.String,
                              ),
                              'authSmsStateKey': serializeParam(
                                widget.authSmsStateKey,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
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
                      }

                      setState(() {});
                    },
                    text: '확인',
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: FlutterFlowTimer(
                    timerValue: timerValue ??= StopWatchTimer.getDisplayTime(
                      timerMilliseconds ??= 180000,
                      hours: true,
                      minute: true,
                      second: true,
                      milliSecond: false,
                    ),
                    timer: timerController ??= StopWatchTimer(
                      mode: StopWatchMode.countDown,
                      presetMillisecond: timerMilliseconds ??= 180000,
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
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                    onEnded: () async {
                      timerController?.onExecute.add(
                        StopWatchExecute.start,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
