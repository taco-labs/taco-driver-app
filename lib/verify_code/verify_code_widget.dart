import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_timer.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
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
  ApiCallResponse? apiResultGetAccount;
  ApiCallResponse? apiResultf8v;
  String? fcmToken;
  ApiCallResponse? apiResultUpdateDriver;
  ApiCallResponse? apiResultLatestCall;
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
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: TextFormField(
                      controller: textController,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: '숫자 6자리 입력',
                        hintStyle:
                            FlutterFlowTheme.of(context).bodyText2.override(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
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
                        apiEndpointTarget: FFAppState().apiEndpointTarget,
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
                        setState(() => FFAppState().driverLastName =
                            SigninFlowGroup.sMSVerificationAndSigninCall
                                .driverLastName(
                                  (apiResultf8v?.jsonBody ?? ''),
                                )
                                .toString());
                        setState(() => FFAppState().serviceRegion =
                            SigninFlowGroup.sMSVerificationAndSigninCall
                                .driverServiceRegion(
                                  (apiResultf8v?.jsonBody ?? ''),
                                )
                                .toString());
                        setState(() => FFAppState().carNumber =
                            SigninFlowGroup.sMSVerificationAndSigninCall
                                .driverCarNumber(
                                  (apiResultf8v?.jsonBody ?? ''),
                                )
                                .toString());
                        setState(() => FFAppState().isActive = SigninFlowGroup
                                .sMSVerificationAndSigninCall
                                .driverIsActive(
                              (apiResultf8v?.jsonBody ?? ''),
                            ));
                        setState(() => FFAppState().driverLicenseNumber =
                            SigninFlowGroup.sMSVerificationAndSigninCall
                                .driverLicenseId(
                                  (apiResultf8v?.jsonBody ?? ''),
                                )
                                .toString());
                        if (SigninFlowGroup.sMSVerificationAndSigninCall
                                .isProfileImageUploaded(
                              (apiResultf8v?.jsonBody ?? ''),
                            ) &&
                            SigninFlowGroup.sMSVerificationAndSigninCall
                                .isLicenseImageUploaded(
                              (apiResultf8v?.jsonBody ?? ''),
                            )) {
                          apiResultGetAccount = await DriverInfoGroup
                              .getSettlementAccountCall
                              .call(
                            driverId: FFAppState().driverId,
                            apiToken: FFAppState().apiToken,
                            apiEndpointTarget: FFAppState().apiEndpointTarget,
                          );
                          if ((apiResultGetAccount?.succeeded ?? true)) {
                            if (isAndroid ? true : false) {
                              setState(() => FFAppState().appOs = 'AOS');
                            } else {
                              if (isiOS ? true : false) {
                                setState(() => FFAppState().appOs = 'IOS');
                              } else {
                                if (isWeb ? true : false) {
                                  setState(() => FFAppState().appOs = 'WEB');
                                } else {
                                  setState(
                                      () => FFAppState().appOs = 'UNKNOWN');
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
                              profileImageUploaded: SigninFlowGroup
                                  .sMSVerificationAndSigninCall
                                  .isProfileImageUploaded(
                                (apiResultf8v?.jsonBody ?? ''),
                              ),
                              licenseImageUploaded: SigninFlowGroup
                                  .sMSVerificationAndSigninCall
                                  .isLicenseImageUploaded(
                                (apiResultf8v?.jsonBody ?? ''),
                              ),
                              carNumber:
                                  SigninFlowGroup.sMSVerificationAndSigninCall
                                      .driverCarNumber(
                                        (apiResultf8v?.jsonBody ?? ''),
                                      )
                                      .toString(),
                              apiEndpointTarget: FFAppState().apiEndpointTarget,
                            );
                            if ((apiResultUpdateDriver?.succeeded ?? true)) {
                              if (SigninFlowGroup.sMSVerificationAndSigninCall
                                  .driverIsOnDuty(
                                (apiResultf8v?.jsonBody ?? ''),
                              )) {
                                apiResultLatestCall = await TaxiCallGroup
                                    .getLatestTaxiCallCall
                                    .call(
                                  driverId: FFAppState().driverId,
                                  apiToken: FFAppState().apiToken,
                                  apiEndpointTarget:
                                      FFAppState().apiEndpointTarget,
                                );
                                if ((apiResultLatestCall?.succeeded ?? true)) {
                                  setState(() => FFAppState().callRequest =
                                      functions.toCallRequestFromApiResponse(
                                          (apiResultLatestCall?.jsonBody ??
                                              '')));
                                  if (TaxiCallGroup.getLatestTaxiCallCall
                                          .callCurrentState(
                                            (apiResultLatestCall?.jsonBody ??
                                                ''),
                                          )
                                          .toString() ==
                                      'DRIVER_TO_DEPARTURE') {
                                    setState(() => FFAppState()
                                        .isOnDrivingToDeparture = true);
                                  } else {
                                    if (TaxiCallGroup.getLatestTaxiCallCall
                                            .callCurrentState(
                                              (apiResultLatestCall?.jsonBody ??
                                                  ''),
                                            )
                                            .toString() ==
                                        'DRIVER_TO_ARRIVAL') {
                                      setState(() => FFAppState()
                                          .isOnDrivingToArrival = true);
                                    } else {
                                      setState(() =>
                                          FFAppState().isOnCallWaiting = true);
                                    }
                                  }

                                  context.goNamed('Home');
                                } else {
                                  if ((apiResultLatestCall?.statusCode ??
                                          200) ==
                                      404) {
                                    setState(() =>
                                        FFAppState().isOnCallWaiting = true);

                                    context.goNamed('Home');
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
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Get Latest Call'),
                                          content: Text(getJsonField(
                                            (apiResultLatestCall?.jsonBody ??
                                                ''),
                                            r'''$.message''',
                                          ).toString()),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                }
                              } else {
                                context.goNamed('Home');
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
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Update Driver'),
                                    content: Text(getJsonField(
                                      (apiResultUpdateDriver?.jsonBody ?? ''),
                                      r'''$.message''',
                                    ).toString()),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          } else {
                            if ((apiResultGetAccount?.statusCode ?? 200) ==
                                404) {
                              context.goNamed('RegisterInstallment');
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
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Get Settlement Account'),
                                    content: Text(getJsonField(
                                      (apiResultGetAccount?.jsonBody ?? ''),
                                      r'''$.message''',
                                    ).toString()),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          }
                        } else {
                          context.goNamed('RegisterImages');
                        }
                      } else {
                        if ((apiResultf8v?.statusCode ?? 200) == 404) {
                          context.goNamed(
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
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('SMS signin'),
                                content: Text(getJsonField(
                                  (apiResultf8v?.jsonBody ?? ''),
                                  r'''$.message''',
                                ).toString()),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
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
                      width: 230,
                      height: 50,
                      color: FlutterFlowTheme.of(context).primaryColor,
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
                          fontSize: 18,
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
