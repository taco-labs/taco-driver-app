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
import 'package:provider/provider.dart';

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
  int timerMilliseconds = 180000;
  String timerValue = StopWatchTimer.getDisplayTime(180000, milliSecond: false);
  StopWatchTimer timerController =
      StopWatchTimer(mode: StopWatchMode.countDown);

  ApiCallResponse? apiResultGetAccount;
  ApiCallResponse? apiResultf8v;
  String? fcmToken;
  String? osType;
  String? appVersion;
  ApiCallResponse? apiResultUpdateDriver;
  ApiCallResponse? apiResultLatestCall;
  ApiCallResponse? apiResultucs;
  TextEditingController? textController;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      timerController.onExecute.add(StopWatchExecute.start);
    });

    textController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    textController?.dispose();
    timerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
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
                        await actions.fromDriverSignApiResponse(
                          (apiResultf8v?.jsonBody ?? ''),
                        );
                        if (FFAppState().driverProfileImageUploaded &&
                            FFAppState().driverLicenseImageUploaded) {
                          apiResultGetAccount = await DriverInfoGroup
                              .getSettlementAccountCall
                              .call(
                            driverId: FFAppState().driverId,
                            apiToken: FFAppState().apiToken,
                            apiEndpointTarget: FFAppState().apiEndpointTarget,
                          );
                          if ((apiResultGetAccount?.succeeded ?? true)) {
                            await actions.fromGetSettlementAccountApiResponse(
                              (apiResultGetAccount?.jsonBody ?? ''),
                            );
                            fcmToken = await actions.getFcmToken();
                            osType = await actions.getPlatformCode();
                            appVersion = await actions.getAppVersion();
                            apiResultUpdateDriver =
                                await DriverInfoGroup.updateDriverCall.call(
                              driverId: FFAppState().driverId,
                              apiToken: FFAppState().apiToken,
                              appOs: osType,
                              appVersion: appVersion,
                              appFcmToken: fcmToken,
                              profileImageUploaded:
                                  FFAppState().driverProfileImageUploaded,
                              licenseImageUploaded:
                                  FFAppState().driverLicenseImageUploaded,
                              carNumber: FFAppState().driverCarNumber,
                              apiEndpointTarget: FFAppState().apiEndpointTarget,
                            );
                            if ((apiResultUpdateDriver?.succeeded ?? true)) {
                              if (FFAppState().driverIsOnDuty) {
                                apiResultLatestCall = await TaxiCallGroup
                                    .getLatestTaxiCallCall
                                    .call(
                                  driverId: FFAppState().driverId,
                                  apiToken: FFAppState().apiToken,
                                  apiEndpointTarget:
                                      FFAppState().apiEndpointTarget,
                                );
                                if ((apiResultLatestCall?.succeeded ?? true)) {
                                  await actions.fromGetLatestCallApiResponse(
                                    (apiResultLatestCall?.jsonBody ?? ''),
                                  );
                                  if (FFAppState().callState ==
                                      'DRIVER_TO_DEPARTURE') {
                                    await actions.setCallState(
                                      'DRIVER_TO_DEPARTURE',
                                    );
                                  } else {
                                    if (FFAppState().callState ==
                                        'DRIVER_TO_ARRIVAL') {
                                      await actions.setCallState(
                                        'DRIVER_TO_ARRIVAL',
                                      );
                                    } else {
                                      await actions.setCallState(
                                        'TAXI_CALL_WAITING',
                                      );
                                    }
                                  }

                                  context.goNamed('Home');
                                } else {
                                  FFAppState().update(() {
                                    FFAppState().errCode = getJsonField(
                                      (apiResultLatestCall?.jsonBody ?? ''),
                                      r'''$.errCode''',
                                    ).toString();
                                  });
                                  if (FFAppState().errCode == 'ERR_NOT_FOUND') {
                                    await actions.setCallState(
                                      'TAXI_CALL_WAITING',
                                    );

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
                            }
                          }
                        } else {
                          context.goNamed('RegisterImages');
                        }
                      } else {
                        FFAppState().update(() {
                          FFAppState().errCode = getJsonField(
                            (apiResultf8v?.jsonBody ?? ''),
                            r'''$.errCode''',
                          ).toString();
                        });
                        if (FFAppState().errCode == 'ERR_NOT_FOUND') {
                          apiResultucs = await MiscGroup
                              .getAvailableServiceRegionsCall
                              .call(
                            apiEndpointTarget: FFAppState().apiEndpointTarget,
                          );
                          if ((apiResultucs?.succeeded ?? true)) {
                            await actions.fromGetAvailableServiceRegions(
                              (apiResultucs?.jsonBody ?? ''),
                            );

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
                    initialTime: timerMilliseconds,
                    getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                        value,
                        milliSecond: false),
                    timer: timerController,
                    onChanged: (value, displayTime, shouldUpdate) {
                      timerMilliseconds = value;
                      timerValue = displayTime;
                      if (shouldUpdate) setState(() {});
                    },
                    onEnded: () async {
                      timerController.onExecute.add(StopWatchExecute.start);
                    },
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 18,
                        ),
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
