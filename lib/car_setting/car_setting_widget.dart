import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CarSettingWidget extends StatefulWidget {
  const CarSettingWidget({Key? key}) : super(key: key);

  @override
  _CarSettingWidgetState createState() => _CarSettingWidgetState();
}

class _CarSettingWidgetState extends State<CarSettingWidget> {
  ApiCallResponse? apiResult85m;
  Completer<ApiCallResponse>? _apiRequestCompleter;
  ApiCallResponse? apiResultnzz;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

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
            context.goNamed('Home');
          },
        ),
        title: Text(
          '차량 관리',
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: FutureBuilder<ApiCallResponse>(
                  future: (_apiRequestCompleter ??= Completer<ApiCallResponse>()
                        ..complete(DriverInfoGroup.listCarProfileCall.call(
                          apiToken: FFAppState().apiToken,
                          driverId: FFAppState().driverId,
                          apiEndpointTarget: FFAppState().apiEndpointTarget,
                        )))
                      .future,
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                      );
                    }
                    final listViewListCarProfileResponse = snapshot.data!;
                    return Builder(
                      builder: (context) {
                        final carList = getJsonField(
                          listViewListCarProfileResponse.jsonBody,
                          r'''$''',
                        ).toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: carList.length,
                          itemBuilder: (context, carListIndex) {
                            final carListItem = carList[carListIndex];
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 7,
                                      color: Color(0x2E000000),
                                      offset: Offset(0, 4),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 4, 4, 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 8, 8, 8),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Stack(
                                                children: [
                                                  if (!getJsonField(
                                                    carListItem,
                                                    r'''$.selected''',
                                                  ))
                                                    InkWell(
                                                      onTap: () async {
                                                        apiResult85m =
                                                            await DriverInfoGroup
                                                                .selectCarProfileCall
                                                                .call(
                                                          apiEndpointTarget:
                                                              FFAppState()
                                                                  .apiEndpointTarget,
                                                          driverId: FFAppState()
                                                              .driverId,
                                                          carProfileId:
                                                              getJsonField(
                                                            carListItem,
                                                            r'''$.id''',
                                                          ).toString(),
                                                          apiToken: FFAppState()
                                                              .apiToken,
                                                        );
                                                        if ((apiResult85m
                                                                ?.succeeded ??
                                                            true)) {
                                                          setState(() =>
                                                              _apiRequestCompleter =
                                                                  null);
                                                          await waitForApiRequestCompleter();
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState()
                                                                    .driverCarModel =
                                                                getJsonField(
                                                              carListItem,
                                                              r'''$.carModel''',
                                                            ).toString();
                                                            FFAppState()
                                                                    .driverCarNumber =
                                                                getJsonField(
                                                              carListItem,
                                                              r'''$.carNumber''',
                                                            ).toString();
                                                            FFAppState()
                                                                    .driverTaxiCategory =
                                                                getJsonField(
                                                              carListItem,
                                                              r'''$.taxiCategory''',
                                                            ).toString();
                                                          });
                                                        }

                                                        setState(() {});
                                                      },
                                                      child: Icon(
                                                        Icons
                                                            .check_box_outline_blank,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24,
                                                      ),
                                                    ),
                                                  if (getJsonField(
                                                    carListItem,
                                                    r'''$.selected''',
                                                  ))
                                                    Icon(
                                                      Icons.check_box,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      size: 24,
                                                    ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 8, 8, 8),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                getJsonField(
                                                  carListItem,
                                                  r'''$.carNumber''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 8, 0, 0),
                                                child: Text(
                                                  '${getJsonField(
                                                    carListItem,
                                                    r'''$.carModel''',
                                                  ).toString()} / ${getJsonField(
                                                    carListItem,
                                                    r'''$.taxiCategory''',
                                                  ).toString()}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                if (!getJsonField(
                                                  carListItem,
                                                  r'''$.selected''',
                                                ))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 0, 0, 0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        var confirmDialogResponse =
                                                            await showDialog<
                                                                    bool>(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: Text(
                                                                          '주의'),
                                                                      content: Text(
                                                                          '차량을 삭제하시겠습니까?'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              alertDialogContext,
                                                                              false),
                                                                          child:
                                                                              Text('취소'),
                                                                        ),
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              alertDialogContext,
                                                                              true),
                                                                          child:
                                                                              Text('삭제'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                ) ??
                                                                false;
                                                        if (confirmDialogResponse) {
                                                          apiResultnzz =
                                                              await DriverInfoGroup
                                                                  .deleteCarProfileCall
                                                                  .call(
                                                            apiEndpointTarget:
                                                                FFAppState()
                                                                    .apiEndpointTarget,
                                                            apiToken:
                                                                FFAppState()
                                                                    .apiToken,
                                                            carProfileId:
                                                                getJsonField(
                                                              carListItem,
                                                              r'''$.id''',
                                                            ).toString(),
                                                          );
                                                          if ((apiResultnzz
                                                                  ?.succeeded ??
                                                              true)) {
                                                            setState(() =>
                                                                _apiRequestCompleter =
                                                                    null);
                                                            await waitForApiRequestCompleter();
                                                          }
                                                        } else {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title:
                                                                    Text('오류'),
                                                                content: Text(
                                                                    '서버 오류가 발생하여 다시 시도해주세요'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        '확인'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        }

                                                        setState(() {});
                                                      },
                                                      text: '삭제',
                                                      options: FFButtonOptions(
                                                        width: 60,
                                                        height: 40,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  fontSize: 14,
                                                                ),
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed('AddCar');
                  },
                  text: '차량 추가하기',
                  options: FFButtonOptions(
                    width: 230,
                    height: 50,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 18,
                        ),
                    elevation: 3,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future waitForApiRequestCompleter({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
