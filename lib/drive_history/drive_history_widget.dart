import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class DriveHistoryWidget extends StatefulWidget {
  const DriveHistoryWidget({Key? key}) : super(key: key);

  @override
  _DriveHistoryWidgetState createState() => _DriveHistoryWidgetState();
}

class _DriveHistoryWidgetState extends State<DriveHistoryWidget> {
  PagingController<ApiPagingParams, dynamic>? _pagingController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
          '운행내역',
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      '최근 운행내역',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: RefreshIndicator(
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
                      _pagingController!
                          .addPageRequestListener((nextPageMarker) {
                        TaxiCallGroup.listTaxiCallCall
                            .call(
                          driverId: FFAppState().driverId,
                          apiToken: FFAppState().apiToken,
                          count: 10,
                          apiEndpointTarget: FFAppState().apiEndpointTarget,
                          pageToken: (nextPageMarker.lastResponse ??
                                          ApiCallResponse({}, {}, 200))
                                      .jsonBody !=
                                  null
                              ? getJsonField(
                                  (nextPageMarker.lastResponse ??
                                          ApiCallResponse({}, {}, 200))
                                      .jsonBody,
                                  r'''$.pageToken''',
                                ).toString()
                              : ' ',
                        )
                            .then((listViewListTaxiCallResponse) {
                          final pageItems = TaxiCallGroup.listTaxiCallCall
                              .callList(
                                listViewListTaxiCallResponse.jsonBody,
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
                                    lastResponse: listViewListTaxiCallResponse,
                                  )
                                : null,
                          );
                        });
                      });
                      return _pagingController!;
                    }(),
                    padding: EdgeInsets.zero,
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

                      itemBuilder: (context, _, rideHistoriesIndex) {
                        final rideHistoriesItem =
                            _pagingController!.itemList![rideHistoriesIndex];
                        return Visibility(
                          visible:
                              functions.isCompletedCallRequest(getJsonField(
                            rideHistoriesItem,
                            r'''$.currentState''',
                          ).toString()),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                            child: Container(
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 7,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 8, 8),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              functions
                                                  .toTimeSeconds(getJsonField(
                                                rideHistoriesItem,
                                                r'''$.createTime''',
                                              ).toString()),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 14,
                                                      ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 5, 0, 0),
                                              child: Text(
                                                getJsonField(
                                                  rideHistoriesItem,
                                                  r'''$.departure.address.addressName''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(50, 0, 0, 0),
                                              child: Icon(
                                                Icons.keyboard_arrow_down,
                                                color: Colors.black,
                                                size: 24,
                                              ),
                                            ),
                                            Text(
                                              getJsonField(
                                                rideHistoriesItem,
                                                r'''$.arrival.address.addressName''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            functions.toHumanFreindlyCallState(
                                                getJsonField(
                                              rideHistoriesItem,
                                              r'''$.currentState''',
                                            ).toString()),
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 14,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 5),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 5, 0),
                                                  child: Text(
                                                    '운임 ${getJsonField(
                                                      rideHistoriesItem,
                                                      r'''$.basePrice''',
                                                    ).toString()}원',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 14,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 5),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  '통행료 ${getJsonField(
                                                    rideHistoriesItem,
                                                    r'''$.tollFee''',
                                                  ).toString()}원',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 14,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 5, 0),
                                                child: Text(
                                                  '적립타코 ${getJsonField(
                                                    rideHistoriesItem,
                                                    r'''$.additionalPrice''',
                                                  ).toString()}개',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 14,
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
                          ),
                        );
                      },
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
