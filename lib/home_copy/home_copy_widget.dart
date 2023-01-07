import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeCopyWidget extends StatefulWidget {
  const HomeCopyWidget({Key? key}) : super(key: key);

  @override
  _HomeCopyWidgetState createState() => _HomeCopyWidgetState();
}

class _HomeCopyWidgetState extends State<HomeCopyWidget>
    with TickerProviderStateMixin {
  ApiCallResponse? apiResult438;
  ApiCallResponse? apiResult439;
  ApiCallResponse? apiResultkg1;
  ApiCallResponse? apiResultCancelCall2;
  ApiCallResponse? apiResultCancelCall;
  ApiCallResponse? apiResultDriverToArrival;
  ApiCallResponse? apiResultj1q;
  ApiCallResponse? apiResultw8d;
  ApiCallResponse? apiResultDoneTaxiCall;
  TextEditingController? taxiFareController;
  TextEditingController? tollFareController;
  bool? switchValue;
  ApiCallResponse? apiResult550;
  ApiCallResponse? apiResult560;
  ApiCallResponse? apiResultkz1;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.initDriverHome();
    });

    taxiFareController = TextEditingController();
    tollFareController = TextEditingController(text: '0');
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    taxiFareController?.dispose();
    tollFareController?.dispose();
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
                  color: Color(0xFF303030),
                  size: 20,
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: false,
              ),
            ),
            InkWell(
              onTap: () async {
                context.pushNamed('DriveHistory');
              },
              child: ListTile(
                title: Text(
                  '이용내역',
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
            ListTile(
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 5, 0),
                        child: Text(
                          '야간주행모드',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                  ),
                        ),
                      ),
                      Switch.adaptive(
                        value: switchValue ??= FFAppState().darkModeSetting,
                        onChanged: (newValue) async {
                          setState(() => switchValue = newValue!);
                          if (newValue!) {
                            setDarkModeSetting(context, ThemeMode.dark);
                            FFAppState().darkModeSetting = true;
                          } else {
                            setDarkModeSetting(context, ThemeMode.light);
                            FFAppState().darkModeSetting = false;
                          }
                        },
                        activeColor: Colors.white,
                        activeTrackColor:
                            FlutterFlowTheme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 40, 10, 0),
                  child: Stack(
                    children: [
                      if (!FFAppState().isOnCallViewing &&
                          !FFAppState().isOnDrivingToDeparture &&
                          !FFAppState().isOnDrivingToArrival &&
                          !FFAppState().isArrived)
                        Container(
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${FFAppState().driverLastName}${FFAppState().driverFirstName}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 16,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 0, 0, 0),
                                          child: Text(
                                            '기사님 안녕하세요',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 16,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '매일 4시간 콜대기하고 3만원 적립의 혜택을 받아가세요!',
                                            maxLines: 2,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 16,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Divider(),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 20),
                                    child: Stack(
                                      children: [
                                        if (FFAppState().driverCarNumber !=
                                                null &&
                                            FFAppState().driverCarNumber != '')
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    FFAppState()
                                                        .driverCarNumber,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 18,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 10, 0, 10),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      '${FFAppState().driverCarModel} / ${FFAppState().driverTaxiCategory}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 16,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              if (!FFAppState().driverIsAtWork)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      context.pushNamed(
                                                          'CarSetting');
                                                    },
                                                    text: '차량 변경',
                                                    options: FFButtonOptions(
                                                      width: 100,
                                                      height: 40,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                              ),
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        if (FFAppState().driverCarNumber ==
                                                null ||
                                            FFAppState().driverCarNumber == '')
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    context.pushNamed(
                                                        'CarSetting');
                                                  },
                                                  text: '차량 추가',
                                                  options: FFButtonOptions(
                                                    width: 120,
                                                    height: 50,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                        ),
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
                                  ),
                                  if (FFAppState().isOnCallWaiting)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 10),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 40, 0),
                                            child: Text(
                                              '콜 대기중입니다...',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 18,
                                                      ),
                                            ),
                                          ),
                                          Container(
                                            width: 40,
                                            height: 40,
                                            child: custom_widgets
                                                .CallWaitingIndicator(
                                              width: 40,
                                              height: 40,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              strokeWidth: 2.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if (FFAppState().isOnCallViewing)
                        Container(
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (FFAppState().callTagsConcat != null &&
                                      FFAppState().callTagsConcat != '')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              FFAppState().callTagsConcat,
                                              textAlign: TextAlign.center,
                                              maxLines: 3,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .title1
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  if (FFAppState().callUserTag != null &&
                                      FFAppState().callUserTag != '')
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFAppState().callUserTag,
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: FlutterFlowTheme.of(context)
                                                .title1
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 5, 0),
                                            child: Text(
                                              '출발지 약 ${functions.toHumanFriendlyDistanceFromMeters(FFAppState().callToDepartureDistance.toString())}',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .title1
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                          Text(
                                            '목적지 ${functions.toHumanFriendlyDistanceFromMeters(FFAppState().callToArrivalDistance.toString())} / ${functions.toHumanFreindlyEtaFromNanoseconds(FFAppState().callToArrivalEtaNanoSec.toString())}',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .title1
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (FFAppState().callAdditionalPrice >
                                              0)
                                            Text(
                                              '타코 ${FFAppState().callAdditionalPrice.toString()}개',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .title1
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${FFAppState().callDepartureAddressRegionDepth2}  ${FFAppState().callDepartureAddressRegionDepth3} ',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .title1
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2, 0, 0, 0),
                                            child: Text(
                                              FFAppState().callDepartureName !=
                                                          null &&
                                                      FFAppState()
                                                              .callDepartureName !=
                                                          ''
                                                  ? '${FFAppState().callDepartureName}'
                                                  : '',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .title1
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 30,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${FFAppState().callArrivalAddressRegionDepth2}  ${FFAppState().callArrivalAddressRegionDepth3} ',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .title1
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2, 0, 0, 0),
                                            child: Text(
                                              FFAppState().callArrivalName !=
                                                          null &&
                                                      FFAppState()
                                                              .callArrivalName !=
                                                          ''
                                                  ? '${FFAppState().callArrivalName}'
                                                  : '',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .title1
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 40, 0, 10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 10, 0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              apiResultw8d = await TaxiCallGroup
                                                  .rejectTaxiCallTicketCall
                                                  .call(
                                                ticketId:
                                                    FFAppState().callTicketId,
                                                apiToken: FFAppState().apiToken,
                                                apiEndpointTarget: FFAppState()
                                                    .apiEndpointTarget,
                                              );
                                              if ((apiResultw8d?.succeeded ??
                                                  true)) {
                                                await actions.setCallState(
                                                  'TAXI_CALL_WAITING',
                                                );
                                              } else {
                                                FFAppState().update(() {
                                                  FFAppState().errCode =
                                                      getJsonField(
                                                    (apiResultw8d?.jsonBody ??
                                                        ''),
                                                    r'''$.errCode''',
                                                  ).toString();
                                                });
                                                if ((FFAppState().errCode ==
                                                        'ERR_NOT_FOUND') ||
                                                    (FFAppState().errCode ==
                                                        'ERR_INVALID')) {
                                                  await actions.setCallState(
                                                    'TAXI_CALL_WAITING',
                                                  );
                                                } else {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('오류'),
                                                        content: Text(
                                                            '서버 오류가 발생하여 다시 시도해주세요'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
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
                                            text: '거절',
                                            options: FFButtonOptions(
                                              width: 100,
                                              height: 60,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        fontSize: 18,
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              apiResultj1q = await TaxiCallGroup
                                                  .acceptTaxiCallTicketCall
                                                  .call(
                                                ticketId:
                                                    FFAppState().callTicketId,
                                                apiToken: FFAppState().apiToken,
                                                apiEndpointTarget: FFAppState()
                                                    .apiEndpointTarget,
                                              );
                                              if ((apiResultj1q?.succeeded ??
                                                  true)) {
                                                await actions
                                                    .fromGetLatestCallApiResponse(
                                                  (apiResultj1q?.jsonBody ??
                                                      ''),
                                                );
                                                await actions.setCallState(
                                                  'DRIVER_TO_DEPARTURE',
                                                );
                                              } else {
                                                FFAppState().update(() {
                                                  FFAppState().errCode =
                                                      getJsonField(
                                                    (apiResultj1q?.jsonBody ??
                                                        ''),
                                                    r'''$.errCode''',
                                                  ).toString();
                                                });
                                                if ((FFAppState().errCode ==
                                                        'ERR_NOT_FOUND') ||
                                                    (FFAppState().errCode ==
                                                        'ERR_INVALID')) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('오류'),
                                                        content:
                                                            Text('만료된 콜 요청입니다'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('확인'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                  await actions.setCallState(
                                                    'TAXI_CALL_WAITING',
                                                  );
                                                } else {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('오류'),
                                                        content: Text(
                                                            '서버 오류가 발생하여 다시 시도해주세요'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
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
                                            text: '콜 수락',
                                            options: FFButtonOptions(
                                              width: 140,
                                              height: 60,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if (FFAppState().isOnDrivingToDeparture)
                        Container(
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 10, 0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                apiResultCancelCall =
                                                    await TaxiCallGroup
                                                        .cancelTaxiCallRequestCall
                                                        .call(
                                                  taxiCallRequestId:
                                                      FFAppState().callId,
                                                  apiToken:
                                                      FFAppState().apiToken,
                                                  apiEndpointTarget:
                                                      FFAppState()
                                                          .apiEndpointTarget,
                                                  confirmCancel: false,
                                                );
                                                if ((apiResultCancelCall
                                                        ?.succeeded ??
                                                    true)) {
                                                  await actions.setCallState(
                                                    'TAXI_CALL_WAITING',
                                                  );
                                                } else {
                                                  FFAppState().update(() {
                                                    FFAppState().errCode =
                                                        getJsonField(
                                                      (apiResultCancelCall
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.errCode''',
                                                    ).toString();
                                                  });
                                                  if (FFAppState().errCode ==
                                                      'ERR_NEED_CONFIRMATION') {
                                                    var confirmDialogResponse =
                                                        await showDialog<bool>(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      '주의'),
                                                                  content: Text(
                                                                      '콜 수락을 취소하시겠습니까? 정당한 사유없이 취소하는 경우 페널티가 부과됩니다'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                      child: Text(
                                                                          '유지'),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                      child: Text(
                                                                          '취소'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ) ??
                                                            false;
                                                    if (confirmDialogResponse) {
                                                      apiResultCancelCall2 =
                                                          await TaxiCallGroup
                                                              .cancelTaxiCallRequestCall
                                                              .call(
                                                        taxiCallRequestId:
                                                            FFAppState().callId,
                                                        apiToken: FFAppState()
                                                            .apiToken,
                                                        apiEndpointTarget:
                                                            FFAppState()
                                                                .apiEndpointTarget,
                                                        confirmCancel: true,
                                                      );
                                                      if ((apiResultCancelCall2
                                                              ?.succeeded ??
                                                          true)) {
                                                        await actions
                                                            .setCallState(
                                                          'TAXI_CALL_WAITING',
                                                        );
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text('오류'),
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
                                                    }
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('오류'),
                                                          content: Text(
                                                              '서버 오류가 발생하여 다시 시도해주세요'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
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
                                              text: '취소',
                                              options: FFButtonOptions(
                                                width: 80,
                                                height: 60,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 18,
                                                        ),
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 10, 0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                await launchUrl(Uri(
                                                  scheme: 'tel',
                                                  path: FFAppState()
                                                      .callUserPhone,
                                                ));
                                              },
                                              text: '',
                                              icon: Icon(
                                                Icons.phone,
                                                size: 25,
                                              ),
                                              options: FFButtonOptions(
                                                width: 60,
                                                height: 60,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                        ),
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 10, 0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                await launchUrl(Uri(
                                                  scheme: 'sms',
                                                  path: FFAppState()
                                                      .callUserPhone,
                                                ));
                                              },
                                              text: '',
                                              icon: Icon(
                                                Icons.message,
                                                size: 25,
                                              ),
                                              options: FFButtonOptions(
                                                width: 60,
                                                height: 60,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                        ),
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await actions.launchKakaoNavi(
                                                functions.toLatitudeFromLatLng(
                                                    FFAppState()
                                                        .callDepartureCoordinate!),
                                                functions.toLongitudeFromLatLng(
                                                    FFAppState()
                                                        .callDepartureCoordinate!),
                                                '출발지',
                                              );
                                            },
                                            text: '길안내',
                                            options: FFButtonOptions(
                                              width: 100,
                                              height: 60,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (FFAppState().callTagsConcat != null &&
                                      FFAppState().callTagsConcat != '')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              FFAppState().callTagsConcat,
                                              textAlign: TextAlign.center,
                                              maxLines: 3,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .title1
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  if (FFAppState().callUserTag != null &&
                                      FFAppState().callUserTag != '')
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFAppState().callUserTag,
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: FlutterFlowTheme.of(context)
                                                .title1
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${FFAppState().callDepartureAddressRegionDepth2}  ${FFAppState().callDepartureAddressRegionDepth3} ',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .title1
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2, 0, 0, 0),
                                            child: Text(
                                              FFAppState().callDepartureName !=
                                                          null &&
                                                      FFAppState()
                                                              .callDepartureName !=
                                                          ''
                                                  ? '${FFAppState().callDepartureName}'
                                                  : '',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .title1
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 30,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${FFAppState().callArrivalAddressRegionDepth2}  ${FFAppState().callArrivalAddressRegionDepth3} ',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .title1
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2, 0, 0, 0),
                                            child: Text(
                                              FFAppState().callArrivalName !=
                                                          null &&
                                                      FFAppState()
                                                              .callArrivalName !=
                                                          ''
                                                  ? '${FFAppState().callArrivalName}'
                                                  : '',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .title1
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 40, 0, 10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            apiResultDriverToArrival =
                                                await TaxiCallGroup
                                                    .taxiCallDriverToArrivalCall
                                                    .call(
                                              taxiCallRequestId:
                                                  FFAppState().callId,
                                              apiToken: FFAppState().apiToken,
                                              apiEndpointTarget: FFAppState()
                                                  .apiEndpointTarget,
                                            );
                                            if ((apiResultDriverToArrival
                                                    ?.succeeded ??
                                                true)) {
                                              await actions.setCallState(
                                                'DRIVER_TO_ARRIVAL',
                                              );
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('오류'),
                                                    content: Text(
                                                        '서버 오류가 발생하여 다시 시도해주세요'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('확인'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            }

                                            setState(() {});
                                          },
                                          text: '손님 탐승 완료',
                                          options: FFButtonOptions(
                                            width: 300,
                                            height: 60,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                    ),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if (FFAppState().isOnDrivingToArrival)
                        Container(
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await actions.launchKakaoNavi(
                                                functions.toLatitudeFromLatLng(
                                                    FFAppState()
                                                        .callArrivalCoordinate!),
                                                functions.toLongitudeFromLatLng(
                                                    FFAppState()
                                                        .callArrivalCoordinate!),
                                                '목적지',
                                              );
                                            },
                                            text: '길안내',
                                            options: FFButtonOptions(
                                              width: 100,
                                              height: 60,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (FFAppState().callTagsConcat != null &&
                                      FFAppState().callTagsConcat != '')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              FFAppState().callTagsConcat,
                                              textAlign: TextAlign.center,
                                              maxLines: 3,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .title1
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  if (FFAppState().callUserTag != null &&
                                      FFAppState().callUserTag != '')
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFAppState().callUserTag,
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: FlutterFlowTheme.of(context)
                                                .title1
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${FFAppState().callDepartureAddressRegionDepth2}  ${FFAppState().callDepartureAddressRegionDepth3} ',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .title1
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2, 0, 0, 0),
                                            child: Text(
                                              FFAppState().callDepartureName !=
                                                          null &&
                                                      FFAppState()
                                                              .callDepartureName !=
                                                          ''
                                                  ? '${FFAppState().callDepartureName}'
                                                  : '',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .title1
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 30,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${FFAppState().callArrivalAddressRegionDepth2}  ${FFAppState().callArrivalAddressRegionDepth3} ',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .title1
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2, 0, 0, 0),
                                            child: Text(
                                              FFAppState().callArrivalName !=
                                                          null &&
                                                      FFAppState()
                                                              .callArrivalName !=
                                                          ''
                                                  ? '${FFAppState().callArrivalName}'
                                                  : '',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .title1
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 10),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '승객 하차시 호출료 제외 실운임을 직접 결제 받으세요',
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: FlutterFlowTheme.of(context)
                                                .title1
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 40, 0, 10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            await actions.setCallState(
                                              'ARRIVED',
                                            );
                                          },
                                          text: '목적지 도착',
                                          options: FFButtonOptions(
                                            width: 300,
                                            height: 60,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                    ),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if (FFAppState().isArrived)
                        Container(
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x33000000),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (FFAppState().callAdditionalPrice > 0)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 10),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 5, 0),
                                              child: Text(
                                                '적립 타코 ${FFAppState().callAdditionalPrice.toString()}개',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title1
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Form(
                                      key: formKey,
                                      autovalidateMode:
                                          AutovalidateMode.disabled,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          TextFormField(
                                            controller: taxiFareController,
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: '운임',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 18,
                                                      ),
                                              hintText: '최종 미터기 실 운임 입력',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 20,
                                                      ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 20,
                                                ),
                                            textAlign: TextAlign.center,
                                            keyboardType: TextInputType.number,
                                            validator: (val) {
                                              if (val == null || val.isEmpty) {
                                                return '운임을 정확히 입력해주세요';
                                              }

                                              if (val.length < 1) {
                                                return '운임을 정확히 입력해주세요';
                                              }

                                              return null;
                                            },
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 10),
                                            child: TextFormField(
                                              controller: tollFareController,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: '통행료',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 18,
                                                        ),
                                                hintText: '통행료 및 추가금액 입력',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 20,
                                                        ),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                errorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedErrorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 20,
                                                      ),
                                              textAlign: TextAlign.center,
                                              keyboardType:
                                                  TextInputType.number,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 31, 0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if (formKey.currentState == null ||
                                            !formKey.currentState!.validate()) {
                                          return;
                                        }

                                        apiResultDoneTaxiCall =
                                            await TaxiCallGroup.doneTaxiCallCall
                                                .call(
                                          taxiCallRequestId:
                                              FFAppState().callId,
                                          basePrice: int.tryParse(
                                              taxiFareController!.text),
                                          apiToken: FFAppState().apiToken,
                                          tollFee: tollFareController!.text !=
                                                      null &&
                                                  tollFareController!.text != ''
                                              ? int.tryParse(
                                                  tollFareController!.text)
                                              : 0,
                                          apiEndpointTarget:
                                              FFAppState().apiEndpointTarget,
                                        );
                                        if ((apiResultDoneTaxiCall?.succeeded ??
                                            true)) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('운행 종료'),
                                                content:
                                                    Text('승객에게 운임을 결제 받으세요'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('확인'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          setState(() {
                                            tollFareController?.clear();
                                            taxiFareController?.clear();
                                          });
                                          await actions.setCallState(
                                            'TAXI_CALL_WAITING',
                                          );
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('오류'),
                                                content: Text(
                                                    '서버 오류가 발생하여 다시 시도해주세요'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('확인'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }

                                        setState(() {});
                                      },
                                      text: '운행 종료',
                                      options: FFButtonOptions(
                                        width: 300,
                                        height: 60,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
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
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 50, 10, 0),
                  child: Stack(
                    children: [
                      if (FFAppState().driverIsActivated &&
                          !FFAppState().driverIsOnDuty &&
                          FFAppState().driverIsAtWork)
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (await getPermissionStatus(
                                  locationPermission)) {
                                apiResult438 =
                                    await DriverInfoGroup.updateOnDutyCall.call(
                                  apiToken: FFAppState().apiToken,
                                  driverId: FFAppState().driverId,
                                  onDuty: true,
                                  apiEndpointTarget:
                                      FFAppState().apiEndpointTarget,
                                );
                                if ((apiResult438?.succeeded ?? true)) {
                                  FFAppState().update(() {
                                    FFAppState().driverIsOnDuty = true;
                                  });
                                  await actions.setCallState(
                                    'TAXI_CALL_WAITING',
                                  );
                                  await actions.startLocationService();
                                } else {
                                  FFAppState().update(() {
                                    FFAppState().errCode = getJsonField(
                                      (apiResult438?.jsonBody ?? ''),
                                      r'''$.errCode''',
                                    ).toString();
                                  });
                                  if (FFAppState().errCode ==
                                      'ERR_UNSUPPORTED') {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('오류'),
                                          content: Text(
                                              '현재 미지원 지역입니다 순차적으로 오픈될 예정이니 조금만 기다려주세요'),
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
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('위치 정보 사용'),
                                              content: Text(
                                                  '타코 기사용 앱은 앱이 종료되었거나 사용중이 아닐 때도 위치 데이터를 수집하여 승객과의 거리를 고려한 정확한 배차 기능을 지원합니다'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('거부'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('승인'),
                                                ),
                                              ],
                                            );
                                          },
                                        ) ??
                                        false;
                                if (confirmDialogResponse) {
                                  await requestPermission(locationPermission);
                                  if (await getPermissionStatus(
                                      locationPermission)) {
                                    apiResult439 = await DriverInfoGroup
                                        .updateOnDutyCall
                                        .call(
                                      apiToken: FFAppState().apiToken,
                                      driverId: FFAppState().driverId,
                                      onDuty: true,
                                      apiEndpointTarget:
                                          FFAppState().apiEndpointTarget,
                                    );
                                    if ((apiResult439?.succeeded ?? true)) {
                                      FFAppState().update(() {
                                        FFAppState().driverIsOnDuty = true;
                                      });
                                      await actions.setCallState(
                                        'TAXI_CALL_WAITING',
                                      );
                                      await actions.startLocationService();
                                    } else {
                                      FFAppState().update(() {
                                        FFAppState().errCode = getJsonField(
                                          (apiResult439?.jsonBody ?? ''),
                                          r'''$.errCode''',
                                        ).toString();
                                      });
                                      if (FFAppState().errCode ==
                                          'ERR_UNSUPPORTED') {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('오류'),
                                              content: Text(
                                                  '현재 미지원 지역입니다 순차적으로 오픈될 예정이니 조금만 기다려주세요'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('확인'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
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
                                                  onPressed: () =>
                                                      Navigator.pop(
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
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          content: Text(
                                              '정확한 배차 기능 제공을 위해서 위치 정보 접근을 허용해주세요'),
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
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        content: Text(
                                            '정확한 배차 기능 제공을 위해서 위치 정보 접근을 허용해주세요'),
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

                              setState(() {});
                            },
                            text: '콜 받기',
                            options: FFButtonOptions(
                              width: 150,
                              height: 60,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      if (FFAppState().driverIsOnDuty &&
                          !FFAppState().isOnDrivingToDeparture &&
                          !FFAppState().isOnDrivingToArrival &&
                          !FFAppState().isArrived &&
                          FFAppState().driverIsActivated &&
                          FFAppState().driverIsAtWork)
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              apiResultkg1 =
                                  await DriverInfoGroup.updateOnDutyCall.call(
                                apiToken: FFAppState().apiToken,
                                driverId: FFAppState().driverId,
                                onDuty: false,
                                apiEndpointTarget:
                                    FFAppState().apiEndpointTarget,
                              );
                              if ((apiResultkg1?.succeeded ?? true)) {
                                FFAppState().update(() {
                                  FFAppState().driverIsOnDuty = false;
                                });
                                await actions.setCallState(
                                  'NONE',
                                );
                                await actions.cancelLocationService();
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

                              setState(() {});
                            },
                            text: '콜 멈추기',
                            options: FFButtonOptions(
                              width: 150,
                              height: 60,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
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
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 50, 10, 0),
                  child: Stack(
                    children: [
                      if (FFAppState().driverIsActivated &&
                          !FFAppState().driverIsAtWork)
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (await getPermissionStatus(
                                  locationPermission)) {
                                apiResult550 =
                                    await DriverInfoGroup.updateOnDutyCall.call(
                                  apiToken: FFAppState().apiToken,
                                  driverId: FFAppState().driverId,
                                  onDuty: true,
                                  apiEndpointTarget:
                                      FFAppState().apiEndpointTarget,
                                );
                                if ((apiResult550?.succeeded ?? true)) {
                                  FFAppState().update(() {
                                    FFAppState().driverIsOnDuty = true;
                                    FFAppState().driverIsAtWork = true;
                                  });
                                  await actions.setCallState(
                                    'TAXI_CALL_WAITING',
                                  );
                                  await actions.startLocationService();
                                } else {
                                  FFAppState().update(() {
                                    FFAppState().errCode = getJsonField(
                                      (apiResult550?.jsonBody ?? ''),
                                      r'''$.errCode''',
                                    ).toString();
                                  });
                                  if (FFAppState().errCode ==
                                      'ERR_UNSUPPORTED') {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('오류'),
                                          content: Text(
                                              '현재 미지원 지역입니다 순차적으로 오픈될 예정이니 조금만 기다려주세요'),
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
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('위치 정보 사용'),
                                              content: Text(
                                                  '타코 기사용 앱은 앱이 종료되었거나 사용중이 아닐 때도 위치 데이터를 수집하여 승객과의 거리를 고려한 정확한 배차 기능을 지원합니다'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('거부'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('승인'),
                                                ),
                                              ],
                                            );
                                          },
                                        ) ??
                                        false;
                                if (confirmDialogResponse) {
                                  await requestPermission(locationPermission);
                                  if (await getPermissionStatus(
                                      locationPermission)) {
                                    apiResult560 = await DriverInfoGroup
                                        .updateOnDutyCall
                                        .call(
                                      apiToken: FFAppState().apiToken,
                                      driverId: FFAppState().driverId,
                                      onDuty: true,
                                      apiEndpointTarget:
                                          FFAppState().apiEndpointTarget,
                                    );
                                    if ((apiResult560?.succeeded ?? true)) {
                                      FFAppState().update(() {
                                        FFAppState().driverIsOnDuty = true;
                                        FFAppState().driverIsAtWork = true;
                                      });
                                      await actions.setCallState(
                                        'TAXI_CALL_WAITING',
                                      );
                                      await actions.startLocationService();
                                    } else {
                                      FFAppState().update(() {
                                        FFAppState().errCode = getJsonField(
                                          (apiResult560?.jsonBody ?? ''),
                                          r'''$.errCode''',
                                        ).toString();
                                      });
                                      if (FFAppState().errCode ==
                                          'ERR_UNSUPPORTED') {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('오류'),
                                              content: Text(
                                                  '현재 미지원 지역입니다 순차적으로 오픈될 예정이니 조금만 기다려주세요'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('확인'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
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
                                                  onPressed: () =>
                                                      Navigator.pop(
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
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          content: Text(
                                              '정확한 배차 기능 제공을 위해서 위치 정보 접근을 허용해주세요'),
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
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        content: Text(
                                            '정확한 배차 기능 제공을 위해서 위치 정보 접근을 허용해주세요'),
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

                              setState(() {});
                            },
                            text: '출근하기',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 60,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      if (FFAppState().driverIsActivated &&
                          FFAppState().driverIsAtWork &&
                          !FFAppState().isOnDrivingToDeparture &&
                          !FFAppState().isOnDrivingToArrival &&
                          !FFAppState().isArrived)
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: InkWell(
                            onLongPress: () async {
                              if (FFAppState().driverIsOnDuty) {
                                apiResultkz1 =
                                    await DriverInfoGroup.updateOnDutyCall.call(
                                  apiToken: FFAppState().apiToken,
                                  driverId: FFAppState().driverId,
                                  onDuty: false,
                                  apiEndpointTarget:
                                      FFAppState().apiEndpointTarget,
                                );
                                if ((apiResultkz1?.succeeded ?? true)) {
                                  FFAppState().update(() {
                                    FFAppState().driverIsOnDuty = false;
                                    FFAppState().driverIsAtWork = false;
                                  });
                                  await actions.setCallState(
                                    'NONE',
                                  );
                                  await actions.cancelLocationService();
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('오류'),
                                        content: Text('서버 오류가 발생하여 다시 시도해주세요'),
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
                              } else {
                                FFAppState().update(() {
                                  FFAppState().driverIsAtWork = false;
                                });
                              }

                              setState(() {});
                            },
                            child: FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: '길게눌러 퇴근하기',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 60,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      fontSize: 20,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      if (!FFAppState().driverIsActivated)
                        Material(
                          color: Colors.transparent,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x33000000),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 15, 10, 15),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 5),
                                      child: Text(
                                        '등록해주신 정보로 승인 심사중입니다',
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 16,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Text(
                                      '매일 일괄 처리해드리고 있으니 조금만 기다려 주세요',
                                      maxLines: 3,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 16,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
  }
}
