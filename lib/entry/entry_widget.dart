import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:upgrader/upgrader.dart';

class EntryWidget extends StatefulWidget {
  const EntryWidget({Key? key}) : super(key: key);

  @override
  _EntryWidgetState createState() => _EntryWidgetState();
}

class _EntryWidgetState extends State<EntryWidget> {
  ApiCallResponse? apiResultGetAccount;
  ApiCallResponse? apiResultyb1;
  ApiCallResponse? apiResultLatestCall;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    debugPrint('driverId ${FFAppState().driverId} apiToken ${FFAppState().apiToken}');
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setDarkModeSetting(
        context,
        FFAppState().darkModeSetting ? ThemeMode.dark : ThemeMode.light,
      );
      apiResultyb1 = await DriverInfoGroup.getDriverCall.call(
        apiToken: FFAppState().apiToken,
        driverId: FFAppState().driverId,
        apiEndpointTarget: FFAppState().apiEndpointTarget,
      );
      if ((apiResultyb1?.succeeded ?? true)) {
        await actions.fromDriverGetApiResponse(
          (apiResultyb1?.jsonBody ?? ''),
        );
        if (FFAppState().driverProfileImageUploaded &&
            FFAppState().driverLicenseImageUploaded) {
          apiResultGetAccount =
              await DriverInfoGroup.getSettlementAccountCall.call(
            driverId: FFAppState().driverId,
            apiToken: FFAppState().apiToken,
            apiEndpointTarget: FFAppState().apiEndpointTarget,
          );
          if ((apiResultGetAccount?.succeeded ?? true)) {
            await actions.fromGetSettlementAccountApiResponse(
              (apiResultGetAccount?.jsonBody ?? ''),
            );
            if (FFAppState().driverIsOnDuty) {
              apiResultLatestCall =
                  await TaxiCallGroup.getLatestTaxiCallCall.call(
                driverId: FFAppState().driverId,
                apiToken: FFAppState().apiToken,
                apiEndpointTarget: FFAppState().apiEndpointTarget,
              );
              if ((apiResultLatestCall?.succeeded ?? true)) {
                await actions.fromGetLatestCallApiResponse(
                  (apiResultLatestCall?.jsonBody ?? ''),
                );
                if (FFAppState().callState == 'DRIVER_TO_DEPARTURE') {
                  await actions.setCallState(
                    'DRIVER_TO_DEPARTURE',
                  );
                } else {
                  if (FFAppState().callState == 'DRIVER_TO_ARRIVAL') {
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
                  ).toString().toString();
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
                        content: Text('서버 오류가 발생하여 다시 실행해주세요'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: Text('확인'),
                          ),
                        ],
                      );
                    },
                  );
                  return;
                }
              }
            } else {
              context.goNamed('Home');
            }
          } else {
            FFAppState().update(() {
              FFAppState().errCode = getJsonField(
                (apiResultGetAccount?.jsonBody ?? ''),
                r'''$.errCode''',
              ).toString().toString();
            });
            if (FFAppState().errCode == 'ERR_NOT_FOUND') {
              context.goNamed('RegisterInstallment');
            } else {
              await showDialog(
                context: context,
                builder: (alertDialogContext) {
                  return AlertDialog(
                    title: Text('오류'),
                    content: Text('서버 오류가 발생하여 다시 실행해주세요'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(alertDialogContext),
                        child: Text('확인'),
                      ),
                    ],
                  );
                },
              );
              return;
            }
          }
        } else {
          context.goNamed('RegisterImages');
        }
      } else {
        context.goNamed('Login');
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return UpgradeAlert(
      upgrader: Upgrader(
        durationUntilAlertAgain: const Duration(days: 1),
      ),
      child: Container(
      color: Color(0xFFFFEB62),
      child: Center(
        child: Image.asset(
          'assets/images/Original_on_Transparent.png',
          width: 100,
          fit: BoxFit.cover,
        ),
      ),
      ),
    );
  }
}
