import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  ApiCallResponse? apiResultd22;
  ApiCallResponse? apiResultqz6;
  String? appVersion;
  bool? isInstalled;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.initDriverHome();
      if (FFAppState().driverIsOnDuty) {
        await actions.startLocationService();
      }
      isInstalled = await actions.isKakaoNaviInstalled();
      if (isInstalled!) {
        var confirmDialogResponse = await showDialog<bool>(
              context: context,
              builder: (alertDialogContext) {
                return AlertDialog(
                  content: Text(
                      '지금 동료 기사님을 초대하면 3천원 적립 혜택을 드려요! 초대하면 할수록 적립 혜택은 계속 누적되요'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext, false),
                      child: Text('나중에'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext, true),
                      child: Text('지금 초대하러가기'),
                    ),
                  ],
                );
              },
            ) ??
            false;
        if (confirmDialogResponse) {
          context.pushNamed('DriverProfile');
        }
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text('길찾기 기능 사용을 위해서 네비게이션 앱을 설치해주세요'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('확인'),
                ),
              ],
            );
          },
        );
        await actions.installKakaoNavi();
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 20,
                ),
                dense: false,
              ),
            ),
            InkWell(
              onTap: () async {
                context.pushNamed('DriveHistory');
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
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 20,
                ),
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
                        'bankCode': serializeParam(
                          DriverInfoGroup.getSettlementAccountCall
                              .bank(
                                (apiResultqz6?.jsonBody ?? ''),
                              )
                              .toString(),
                          ParamType.String,
                        ),
                        'totalAmount': serializeParam(
                          DriverInfoGroup.getExpectetedSettlementCall
                              .totalAmount(
                            (apiResultd22?.jsonBody ?? ''),
                          ),
                          ParamType.int,
                        ),
                        'requestableAmount': serializeParam(
                          DriverInfoGroup.getExpectetedSettlementCall
                              .requestableAmount(
                            (apiResultd22?.jsonBody ?? ''),
                          ),
                          ParamType.int,
                        ),
                      }.withoutNulls,
                    );
                  } else {
                    FFAppState().errCode = getJsonField(
                      (apiResultd22?.jsonBody ?? ''),
                      r'''$.errCode''',
                    ).toString();
                    if (FFAppState().errCode == 'ERR_NOT_FOUND') {
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
                          'bankCode': serializeParam(
                            DriverInfoGroup.getSettlementAccountCall
                                .bank(
                                  (apiResultqz6?.jsonBody ?? ''),
                                )
                                .toString(),
                            ParamType.String,
                          ),
                          'totalAmount': serializeParam(
                            0,
                            ParamType.int,
                          ),
                          'requestableAmount': serializeParam(
                            0,
                            ParamType.int,
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
                  '정산관리',
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                      ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 20,
                ),
                dense: false,
              ),
            ),
            InkWell(
              onTap: () async {
                appVersion = await actions.getAppVersion();

                context.pushNamed(
                  'Setting',
                  queryParams: {
                    'appVersion': serializeParam(
                      appVersion,
                      ParamType.String,
                    ),
                  }.withoutNulls,
                );

                setState(() {});
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
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 20,
                ),
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
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 20,
                ),
                dense: false,
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: InkWell(
          onTap: () async {
            scaffoldKey.currentState!.openDrawer();
          },
          child: Text(
            '메뉴',
            style: FlutterFlowTheme.of(context).title2.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22,
                  decoration: TextDecoration.underline,
                ),
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
