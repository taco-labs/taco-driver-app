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
  ApiCallResponse? apiResultLatestCall;
  ApiCallResponse? apiResultyb1;
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
        if (FFAppState().isOnDuty) {
          apiResultLatestCall = await TaxiCallGroup.getLatestTaxiCallCall.call(
            driverId: FFAppState().driverId,
            apiToken: FFAppState().apiToken,
          );
          if ((apiResultLatestCall?.succeeded ?? true)) {
            setState(() => FFAppState().latestCallState = getJsonField(
                  (apiResultLatestCall?.jsonBody ?? ''),
                  r'''$.currentState''',
                ).toString());
            setState(() => FFAppState().callRequest =
                (apiResultLatestCall?.jsonBody ?? ''));
            if (FFAppState().latestCallState == 'DRIVER_TO_DEPARTURE') {
              context.pushNamed('OnDrivingToDeparture');
            } else {
              if (FFAppState().latestCallState == 'DRIVER_TO_ARRIVAL') {
                context.pushNamed('OnDrivingToArrival');
              } else {
                context.goNamed('Home');
              }
            }
          } else {
            if ((apiResultLatestCall?.statusCode ?? 200) == 404) {
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
              return;
            }
          }
        } else {
          context.pushNamed('Home');
        }
      } else {
        if ((apiResultyb1?.statusCode ?? 200) == 404) {
          context.goNamed('Login');
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
