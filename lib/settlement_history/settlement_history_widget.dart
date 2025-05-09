import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class SettlementHistoryWidget extends StatefulWidget {
  const SettlementHistoryWidget({Key? key}) : super(key: key);

  @override
  _SettlementHistoryWidgetState createState() =>
      _SettlementHistoryWidgetState();
}

class _SettlementHistoryWidgetState extends State<SettlementHistoryWidget> {
  PagingController<ApiPagingParams, dynamic>? _pagingController;
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
          '정산 내역',
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
                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      '최근 정산내역',
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
              RefreshIndicator(
                onRefresh: () async {
                  setState(() => _pagingController?.refresh());
                  await waitForOnePage();
                },
                child: PagedListView<ApiPagingParams, dynamic>(
                  pagingController: () {
                    if (_pagingController != null) {
                      return _pagingController!;
                    }

                    _pagingController = PagingController(
                      firstPageKey: ApiPagingParams(
                        nextPageNumber: 0,
                        numItems: 0,
                        lastResponse: null,
                      ),
                    );
                    _pagingController!.addPageRequestListener((nextPageMarker) {
                      DriverInfoGroup.listDriverSettlementHistoryCall
                          .call(
                        driverId: FFAppState().driverId,
                        apiToken: FFAppState().apiToken,
                        count: 10,
                        apiEndpointTarget: FFAppState().apiEndpointTarget,
                        pageToken: getJsonField(
                                  (nextPageMarker.lastResponse ??
                                          ApiCallResponse({}, {}, 200))
                                      .jsonBody,
                                  r'''$.pageToken''',
                                ) !=
                                null
                            ? getJsonField(
                                (nextPageMarker.lastResponse ??
                                        ApiCallResponse({}, {}, 200))
                                    .jsonBody,
                                r'''$.pageToken''',
                              ).toString()
                            : functions.getEmptyString(),
                      )
                          .then((listViewListDriverSettlementHistoryResponse) {
                        final pageItems =
                            DriverInfoGroup.listDriverSettlementHistoryCall
                                .histories(
                                  listViewListDriverSettlementHistoryResponse
                                      .jsonBody,
                                )
                                .toList() as List;
                        final newNumItems =
                            nextPageMarker.numItems + pageItems.length;
                        _pagingController!.appendPage(
                          pageItems,
                          (pageItems.length > 0)
                              ? ApiPagingParams(
                                  nextPageNumber:
                                      nextPageMarker.nextPageNumber + 1,
                                  numItems: newNumItems,
                                  lastResponse:
                                      listViewListDriverSettlementHistoryResponse,
                                )
                              : null,
                        );
                      });
                    });
                    return _pagingController!;
                  }(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  builderDelegate: PagedChildBuilderDelegate<dynamic>(
                    // Customize what your widget looks like when it's loading the first page.
                    firstPageProgressIndicatorBuilder: (_) => Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                      ),
                    ),

                    itemBuilder: (context, _, settlementHistoryIndex) {
                      final settlementHistoryItem =
                          _pagingController!.itemList![settlementHistoryIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 7,
                                color: Color(0x2E000000),
                                offset: Offset(0, 4),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 5, 0),
                                      child: Text(
                                        '입금일시',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      functions.toTimeSeconds(getJsonField(
                                        settlementHistoryItem,
                                        r'''$.createTime''',
                                      ).toString()),
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 5, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        '${functions.toBankNameFromCode(getJsonField(
                                          settlementHistoryItem,
                                          r'''$.bank''',
                                        ).toString())} ${getJsonField(
                                          settlementHistoryItem,
                                          r'''$.accountNumber''',
                                        ).toString()}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 5, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        getJsonField(
                                          settlementHistoryItem,
                                          r'''$.amount''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Text(
                                        '원',
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future waitForOnePage({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (_pagingController?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
