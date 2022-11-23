import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class EntryWidget extends StatefulWidget {
  const EntryWidget({Key? key}) : super(key: key);

  @override
  _EntryWidgetState createState() => _EntryWidgetState();
}

class _EntryWidgetState extends State<EntryWidget> {
  ApiCallResponse? apiResultGetAccount;
  ApiCallResponse? apiResultyb1;
  ApiCallResponse? apiResultLatestCall;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      apiResultyb1 = await DriverInfoGroup.getDriverCall.call(
        apiToken: FFAppState().apiToken,
        driverId: FFAppState().driverId,
      );
      if ((apiResultyb1?.succeeded ?? true)) {
        setState(() =>
            FFAppState().isOnDuty = DriverInfoGroup.getDriverCall.isOnDuty(
              (apiResultyb1?.jsonBody ?? ''),
            ));
        setState(
            () => FFAppState().driverFirstName = DriverInfoGroup.getDriverCall
                .firstName(
                  (apiResultyb1?.jsonBody ?? ''),
                )
                .toString());
        if (DriverInfoGroup.getDriverCall.isProfileImageUploaded(
              (apiResultyb1?.jsonBody ?? ''),
            ) &&
            DriverInfoGroup.getDriverCall.isLicenseImageUploaded(
              (apiResultyb1?.jsonBody ?? ''),
            )) {
          apiResultGetAccount =
              await DriverInfoGroup.getSettlementAccountCall.call(
            driverId: FFAppState().driverId,
            apiToken: FFAppState().apiToken,
          );
          if ((apiResultGetAccount?.succeeded ?? true)) {
            if (FFAppState().isOnDuty) {
              apiResultLatestCall =
                  await TaxiCallGroup.getLatestTaxiCallCall.call(
                driverId: FFAppState().driverId,
                apiToken: FFAppState().apiToken,
              );
              if ((apiResultLatestCall?.succeeded ?? true)) {
                setState(() => FFAppState().latestCallState =
                    TaxiCallGroup.getLatestTaxiCallCall
                        .callCurrentState(
                          (apiResultLatestCall?.jsonBody ?? ''),
                        )
                        .toString());
                setState(() => FFAppState().callRequest =
                    (apiResultLatestCall?.jsonBody ?? ''));
                if (FFAppState().latestCallState == 'DRIVER_TO_DEPARTURE') {
                  setState(() => FFAppState().isOnDrivingToDeparture = true);
                } else {
                  if (FFAppState().latestCallState == 'DRIVER_TO_ARRIVAL') {
                    setState(() => FFAppState().isOnDrivingToArrival = true);
                  } else {
                    setState(() => FFAppState().isOnCallWaiting = true);
                  }
                }

                context.goNamed('Home');
              } else {
                if ((apiResultLatestCall?.statusCode ?? 200) == 404) {
                  setState(() => FFAppState().isOnCallWaiting = true);

                  context.pushNamed('Home');
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
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text('GetLatestCall'),
                        content: Text(getJsonField(
                          (apiResultLatestCall?.jsonBody ?? ''),
                          r'''$.message''',
                        ).toString()),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: Text('Ok'),
                          ),
                        ],
                      );
                    },
                  );
                  return;
                }
              }
            } else {
              context.pushNamed('Home');
            }
          } else {
            if ((apiResultGetAccount?.statusCode ?? 200) == 404) {
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
              await showDialog(
                context: context,
                builder: (alertDialogContext) {
                  return AlertDialog(
                    title: Text('GetSettlementAccount'),
                    content: Text(getJsonField(
                      (apiResultGetAccount?.jsonBody ?? ''),
                      r'''$.message''',
                    ).toString()),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(alertDialogContext),
                        child: Text('Ok'),
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
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFFFEB62),
    );
  }
}
