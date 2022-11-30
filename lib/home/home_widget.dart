import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  ApiCallResponse? apiResultd22;
  ApiCallResponse? apiResultqz6;
  ApiCallResponse? apiResulttx8;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.initDriverHome();
      if (FFAppState().isOnDuty) {
        await actions.startLocationService();
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
                apiResulttx8 = await DriverInfoGroup.getDriverCall.call(
                  apiToken: FFAppState().apiToken,
                  driverId: FFAppState().driverId,
                  apiEndpointTarget: FFAppState().apiEndpointTarget,
                );
                if ((apiResulttx8?.succeeded ?? true)) {
                  context.pushNamed(
                    'DriverProfile',
                    queryParams: {
                      'driverInfo': serializeParam(
                        (apiResulttx8?.jsonBody ?? ''),
                        ParamType.JSON,
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
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: Text('확인'),
                          ),
                        ],
                      );
                    },
                  );
                }

                setState(() {});
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
                  '운행내역',
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
                apiResultqz6 =
                    await DriverInfoGroup.getSettlementAccountCall.call(
                  driverId: FFAppState().driverId,
                  apiToken: FFAppState().apiToken,
                  apiEndpointTarget: FFAppState().apiEndpointTarget,
                );
                if ((apiResultqz6?.succeeded ?? true)) {
                  apiResultd22 =
                      await DriverInfoGroup.getExpectetedSettlementCall.call(
                    apiToken: FFAppState().apiToken,
                    driverId: FFAppState().driverId,
                    apiEndpointTarget: FFAppState().apiEndpointTarget,
                  );
                  if ((apiResultd22?.succeeded ?? true)) {
                    context.pushNamed(
                      'SettlementInfo',
                      queryParams: {
                        'accountNumber': serializeParam(
                          DriverInfoGroup.getSettlementAccountCall
                              .accountNumber(
                                (apiResultqz6?.jsonBody ?? ''),
                              )
                              .toString(),
                          ParamType.String,
                        ),
                        'expectedAmount': serializeParam(
                          DriverInfoGroup.getExpectetedSettlementCall
                              .expectedAmount(
                            (apiResultd22?.jsonBody ?? ''),
                          ),
                          ParamType.int,
                        ),
                        'bankCode': serializeParam(
                          DriverInfoGroup.getSettlementAccountCall
                              .bank(
                                (apiResultqz6?.jsonBody ?? ''),
                              )
                              .toString(),
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
                          title: Text('GetExpectedAmount'),
                          content: Text(getJsonField(
                            (apiResultd22?.jsonBody ?? ''),
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
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text('오류'),
                        content: Text('서버 오류가 발생하여 다시 시도해주세요'),
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
                        title: Text('GetSettment'),
                        content: Text(getJsonField(
                          (apiResultqz6?.jsonBody ?? ''),
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
                }

                setState(() {});
              },
              child: ListTile(
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
            InkWell(
              onTap: () async {
                context.pushNamed('SupportChat');
              },
              child: ListTile(
                title: Text(
                  '고객센터',
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  child: custom_widgets.DriverCallManager(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1,
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
