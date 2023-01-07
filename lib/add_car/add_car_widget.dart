import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddCarWidget extends StatefulWidget {
  const AddCarWidget({Key? key}) : super(key: key);

  @override
  _AddCarWidgetState createState() => _AddCarWidgetState();
}

class _AddCarWidgetState extends State<AddCarWidget> {
  ApiCallResponse? apiResultAddCar;
  String? carKeyDropDownValue;
  String? carRegionDropDownValue;
  TextEditingController? carFirstNumberController;
  TextEditingController? carLastNumberController;
  String? taxiCategoryDropDownValue;
  String? carModelDropDownValue;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    carFirstNumberController = TextEditingController();
    carLastNumberController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    carFirstNumberController?.dispose();
    carLastNumberController?.dispose();
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
          '차량 추가',
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-0.95, 0),
                                child: Text(
                                  '택시종류',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 16,
                                      ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                child: FlutterFlowDropDown<String>(
                                  initialOption: taxiCategoryDropDownValue ??=
                                      '중형',
                                  options: ['중형'],
                                  onChanged: (val) => setState(
                                      () => taxiCategoryDropDownValue = val),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 16,
                                      ),
                                  hintText: '택시종류 선택',
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  elevation: 2,
                                  borderColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderWidth: 2,
                                  borderRadius: 8,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      20, 4, 20, 4),
                                  hidesUnderline: true,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.95, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: Text(
                                    '차량번호',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 16,
                                        ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 5),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowDropDown<String>(
                                          initialOption:
                                              carRegionDropDownValue ??= '경기',
                                          options: ['경기', '서울', '인천'],
                                          onChanged: (val) => setState(() =>
                                              carRegionDropDownValue = val),
                                          width: 100,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 16,
                                              ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          elevation: 2,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          borderWidth: 2,
                                          borderRadius: 8,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 4, 20, 4),
                                          hidesUnderline: true,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 0, 0, 0),
                                            child: TextFormField(
                                              controller:
                                                  carFirstNumberController,
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText: '00',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 16,
                                                        ),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
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
                                                      BorderRadius.circular(8),
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
                                                      BorderRadius.circular(8),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(20, 4, 20, 4),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16,
                                                      ),
                                              textAlign: TextAlign.center,
                                              keyboardType:
                                                  TextInputType.number,
                                              validator: (val) {
                                                if (val == null ||
                                                    val.isEmpty) {
                                                  return '차량번호를 정확히 입력해주세요';
                                                }

                                                if (val.length < 2) {
                                                  return '차량번호를 정확히 입력해주세요';
                                                }
                                                if (val.length > 2) {
                                                  return '차량번호를 정확히 입력해주세요';
                                                }
                                                if (!RegExp('^[0-9]\$')
                                                    .hasMatch(val)) {
                                                  return '차량번호를 정확히 입력해주세요';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 0, 0, 0),
                                          child: FlutterFlowDropDown<String>(
                                            initialOption:
                                                carKeyDropDownValue ??= '바',
                                            options: ['바', '아', '사', '자'],
                                            onChanged: (val) => setState(() =>
                                                carKeyDropDownValue = val),
                                            width: 100,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 16,
                                                    ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            elevation: 2,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            borderWidth: 2,
                                            borderRadius: 8,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 4, 20, 4),
                                            hidesUnderline: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          controller: carLastNumberController,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: '0000',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText2
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 16,
                                                    ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 4, 20, 4),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 16,
                                              ),
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          validator: (val) {
                                            if (val == null || val.isEmpty) {
                                              return '차량번호를 정확히 입력해주세요';
                                            }

                                            if (val.length < 4) {
                                              return '차량번호를 정확히 입력해주세요';
                                            }
                                            if (val.length > 4) {
                                              return '차량번호를 정확히 입력해주세요';
                                            }
                                            if (!RegExp('^[0-9]\$')
                                                .hasMatch(val)) {
                                              return '차량번호를 정확히 입력해주세요';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.95, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: Text(
                                    '차량모델',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 16,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                child: FlutterFlowDropDown<String>(
                                  options: [
                                    '소나타',
                                    '그랜저',
                                    'K5',
                                    'K7',
                                    'SM5',
                                    '그랜드 스타렉스',
                                    '그랜드보이저',
                                    '스타리아',
                                    '니로',
                                    '다이너스티',
                                    '렉스턴',
                                    '로체',
                                    '링컨MKS',
                                    '말리부',
                                    '매그너스',
                                    '맥스크루즈',
                                    '모하비',
                                    '벤츠',
                                    '스타렉스',
                                    '스타크래프트',
                                    '스포티지',
                                    '싼타페',
                                    '쏘렌토',
                                    '쏘울',
                                    '쏠라티',
                                    '아반떼',
                                    '아이오닉',
                                    '에쿠스',
                                    '오피러스',
                                    '올란도',
                                    '옵티마',
                                    '옵티마리갈',
                                    '제네시스',
                                    '제네시스(EQ900)',
                                    '체어맨',
                                    '카니발',
                                    '카렌스',
                                    '코나',
                                    '코란도 C',
                                    '크루즈',
                                    '토러스',
                                    '토스카',
                                    '투싼',
                                    '프리우스',
                                    'BMW',
                                    'i40',
                                    'K3',
                                    'K9',
                                    'QM5',
                                    'QM6',
                                    'SM3',
                                    'SM6',
                                    'SM7',
                                    '넥소',
                                    '캠리',
                                    '펠리세이드',
                                    'K8',
                                    '아이오닉5',
                                    '포드 트랜짓',
                                    'EV6',
                                    '아우디 Q7'
                                  ],
                                  onChanged: (val) => setState(
                                      () => carModelDropDownValue = val),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 16,
                                      ),
                                  hintText: '차량모델 선택',
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  elevation: 2,
                                  borderColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderWidth: 2,
                                  borderRadius: 8,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      20, 4, 20, 4),
                                  hidesUnderline: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (formKey.currentState == null ||
                            !formKey.currentState!.validate()) {
                          return;
                        }

                        if (carModelDropDownValue == null) {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                content: Text('차량모델을 선택해주세요'),
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
                          return;
                        }

                        apiResultAddCar =
                            await DriverInfoGroup.addCarProfileCall.call(
                          apiEndpointTarget: FFAppState().apiEndpointTarget,
                          apiToken: FFAppState().apiToken,
                          carNumber:
                              '${carRegionDropDownValue}${carFirstNumberController!.text}${carKeyDropDownValue}${carLastNumberController!.text}',
                          carModel: carModelDropDownValue,
                          selectAsProfile:
                              FFAppState().driverCarNumber == null ||
                                      FFAppState().driverCarNumber == ''
                                  ? true
                                  : false,
                          taxiCategory: taxiCategoryDropDownValue,
                        );
                        if ((apiResultAddCar?.succeeded ?? true)) {
                          FFAppState().update(() {
                            FFAppState().driverCarModel =
                                carModelDropDownValue!;
                            FFAppState().driverCarNumber =
                                '${carRegionDropDownValue}${carFirstNumberController!.text}${carKeyDropDownValue}${carLastNumberController!.text}';
                            FFAppState().driverTaxiCategory =
                                taxiCategoryDropDownValue!;
                          });
                          context.pop();
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
                      text: '확인',
                      options: FFButtonOptions(
                        width: 230,
                        height: 50,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle: FlutterFlowTheme.of(context)
                            .subtitle1
                            .override(
                              fontFamily: 'Poppins',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
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
      ),
    );
  }
}
