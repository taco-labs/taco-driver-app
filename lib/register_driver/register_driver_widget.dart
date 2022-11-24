import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterDriverWidget extends StatefulWidget {
  const RegisterDriverWidget({
    Key? key,
    this.phoneNumber,
    this.authSmsStateKey,
  }) : super(key: key);

  final String? phoneNumber;
  final String? authSmsStateKey;

  @override
  _RegisterDriverWidgetState createState() => _RegisterDriverWidgetState();
}

class _RegisterDriverWidgetState extends State<RegisterDriverWidget> {
  ApiCallResponse? apiResultbos;
  String? getFcmTokenResult;
  String? dropDownValue;
  String? radioButtonValue;
  TextEditingController? birthDateController;
  TextEditingController? genderCodeController;
  TextEditingController? firstNameController;
  TextEditingController? lastNameController;
  TextEditingController? phoneNumberController;
  TextEditingController? carNumberController;
  TextEditingController? licenseNumberController;
  TextEditingController? businessRegistrationNumberController;
  bool? termsofUseValue;
  bool? privacyPolicyValue;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    birthDateController = TextEditingController();
    genderCodeController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneNumberController = TextEditingController(text: widget.phoneNumber);
    carNumberController = TextEditingController();
    licenseNumberController = TextEditingController();
    businessRegistrationNumberController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    birthDateController?.dispose();
    genderCodeController?.dispose();
    firstNameController?.dispose();
    lastNameController?.dispose();
    phoneNumberController?.dispose();
    carNumberController?.dispose();
    licenseNumberController?.dispose();
    businessRegistrationNumberController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          '기사 회원 가입',
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 5),
                            child: TextFormField(
                              controller: phoneNumberController,
                              readOnly: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: '휴대폰번호',
                                labelStyle:
                                    FlutterFlowTheme.of(context).bodyText2,
                                hintStyle:
                                    FlutterFlowTheme.of(context).bodyText2,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    20, 24, 20, 24),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 17,
                                  ),
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 5),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 5, 0),
                                    child: TextFormField(
                                      controller: lastNameController,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: '성',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 18,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText2,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20, 24, 20, 24),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 18,
                                          ),
                                      keyboardType: TextInputType.name,
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return '성을 정확히 입력해주세요';
                                        }

                                        if (val.length < 1) {
                                          return '성을 정확히 입력해주세요';
                                        }

                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 0, 0),
                                    child: TextFormField(
                                      controller: firstNameController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: '이름',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 18,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText2,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20, 24, 20, 24),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 18,
                                          ),
                                      keyboardType: TextInputType.name,
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return '이름을 정확히 입력해주세요';
                                        }

                                        if (val.length < 1) {
                                          return '이름을 정확히 입력해주세요';
                                        }

                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: TextFormField(
                                    controller: birthDateController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: '주민등록번호',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 18,
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20, 24, 20, 24),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 18,
                                        ),
                                    keyboardType: TextInputType.number,
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return '앞 6자리를 정확히 입력해주세요';
                                      }

                                      if (val.length < 6) {
                                        return '앞 6자리를 정확히 입력해주세요';
                                      }
                                      if (val.length > 6) {
                                        return '앞 6자리를 정확히 입력해주세요';
                                      }
                                      if (!RegExp(
                                              r"^\d{2}[0-1]\d{1}[0-3]\d{1}$")
                                          .hasMatch(val)) {
                                        return '앞 6자리를 정확히 입력해주세요';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '-',
                                    textAlign: TextAlign.center,
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: TextFormField(
                                    controller: genderCodeController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 18,
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              10, 24, 10, 24),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 18,
                                        ),
                                    keyboardType: TextInputType.number,
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return '뒤 1자리를 정확히 입력해주세요';
                                      }

                                      if (val.length < 1) {
                                        return '뒤 1자리를 정확히 입력해주세요';
                                      }
                                      if (val.length > 1) {
                                        return '뒤 1자리를 정확히 입력해주세요';
                                      }
                                      if (!RegExp(r"[1-4]").hasMatch(val)) {
                                        return '뒤 1자리를 정확히 입력해주세요';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Text(
                                      '* * * * * *',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                            child: FlutterFlowRadioButton(
                              options: ['개인 택시', '법인 택시'].toList(),
                              onChanged: (val) =>
                                  setState(() => radioButtonValue = val),
                              optionHeight: 30,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                              buttonPosition: RadioButtonPosition.left,
                              direction: Axis.horizontal,
                              radioButtonColor: Colors.blue,
                              inactiveRadioButtonColor: Color(0x8A000000),
                              toggleable: false,
                              horizontalAlignment: WrapAlignment.start,
                              verticalAlignment: WrapCrossAlignment.start,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 5),
                            child: FlutterFlowDropDown<String>(
                              options:
                                  functions.getSupportedServiceArea().toList(),
                              onChanged: (val) =>
                                  setState(() => dropDownValue = val),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 18,
                                  ),
                              hintText: '운행지역',
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2,
                              borderColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderWidth: 2,
                              borderRadius: 8,
                              margin:
                                  EdgeInsetsDirectional.fromSTEB(20, 4, 20, 4),
                              hidesUnderline: true,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 5),
                            child: TextFormField(
                              controller: carNumberController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: '차량번호',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                    ),
                                hintStyle:
                                    FlutterFlowTheme.of(context).bodyText2,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    20, 24, 20, 24),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                  ),
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return '차량번호를 정확히 입력해주세요';
                                }

                                if (val.length < 1) {
                                  return '차량번호를 정확히 입력해주세요';
                                }
                                if (val.length > 8) {
                                  return '차량번호를 정확히 입력해주세요';
                                }
                                if (!RegExp(r"^\d{2,3}[가-힣]\d{4}$")
                                    .hasMatch(val)) {
                                  return '차량번호를 정확히 입력해주세요';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 5),
                            child: TextFormField(
                              controller: licenseNumberController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: '택시운전 자격증번호',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                    ),
                                hintStyle:
                                    FlutterFlowTheme.of(context).bodyText2,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    20, 24, 20, 24),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                  ),
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return '택시 자격증 번호를 정확히 입력해주세요';
                                }

                                if (val.length < 11) {
                                  return '택시 자격증 번호를 정확히 입력해주세요';
                                }
                                if (val.length > 11) {
                                  return '택시 자격증 번호를 정확히 입력해주세요';
                                }
                                if (!RegExp(r"^\d{2}-[가-힣][가-힣]-\d{5}$")
                                    .hasMatch(val)) {
                                  return '택시 자격증 번호를 정확히 입력해주세요';
                                }
                                return null;
                              },
                            ),
                          ),
                          if (radioButtonValue != '법인 택시')
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 20, 10),
                              child: TextFormField(
                                controller:
                                    businessRegistrationNumberController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: '사업자등록번호 10자리',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 18,
                                      ),
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          20, 24, 20, 24),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                    ),
                                keyboardType: TextInputType.number,
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return '사업자등록번호를 정확히 입력해주세요';
                                  }

                                  if (val.length < 10) {
                                    return '사업자등록번호를 정확히 입력해주세요';
                                  }
                                  if (val.length > 10) {
                                    return '사업자등록번호를 정확히 입력해주세요';
                                  }
                                  if (!RegExp(r"^\d{10}$").hasMatch(val)) {
                                    return '사업자등록번호를 정확히 입력해주세요';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 10),
                            child: Theme(
                              data: ThemeData(
                                unselectedWidgetColor: Color(0xFF95A1AC),
                              ),
                              child: CheckboxListTile(
                                value: termsofUseValue ??= true,
                                onChanged: (newValue) async {
                                  setState(() => termsofUseValue = newValue!);
                                },
                                title: Text(
                                  '이용약관 동의 (필수)',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                                tileColor: Color(0xFFF5F5F5),
                                activeColor:
                                    FlutterFlowTheme.of(context).primaryColor,
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                            child: Theme(
                              data: ThemeData(
                                unselectedWidgetColor: Color(0xFF95A1AC),
                              ),
                              child: CheckboxListTile(
                                value: privacyPolicyValue ??= true,
                                onChanged: (newValue) async {
                                  setState(
                                      () => privacyPolicyValue = newValue!);
                                },
                                title: Text(
                                  '개인정보처리방침 동의 (필수)',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                                tileColor: Color(0xFFF5F5F5),
                                activeColor:
                                    FlutterFlowTheme.of(context).primaryColor,
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (formKey.currentState == null ||
                          !formKey.currentState!.validate()) {
                        return;
                      }

                      if (dropDownValue == null) {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('오류'),
                              content: Text('운행지역을 선택해주세요'),
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

                      if (termsofUseValue!) {
                        if (privacyPolicyValue!) {
                          getFcmTokenResult = await actions.getFcmToken();
                          apiResultbos = await SignupGroup.signupCall.call(
                            firstName: firstNameController!.text,
                            lastName: lastNameController!.text,
                            birthday: birthDateController!.text,
                            gender: genderCodeController!.text,
                            phone: phoneNumberController!.text,
                            appOs: FFAppState().appOs,
                            appVersion: FFAppState().appVersion,
                            appFcmToken: getFcmTokenResult,
                            smsVerificationStateKey: widget.authSmsStateKey,
                            driverType:
                                functions.toDriverType(radioButtonValue!),
                            driverLicenseId: licenseNumberController!.text,
                            carNumber: carNumberController!.text,
                            companyRegistrationNumber:
                                businessRegistrationNumberController!.text,
                            serviceRegion: dropDownValue,
                          );
                          if ((apiResultbos?.succeeded ?? true)) {
                            await requestPermission(locationPermission);
                            await requestPermission(notificationsPermission);
                            await requestPermission(photoLibraryPermission);
                            setState(() =>
                                FFAppState().apiToken = SignupGroup.signupCall
                                    .apiToken(
                                      (apiResultbos?.jsonBody ?? ''),
                                    )
                                    .toString());
                            setState(() =>
                                FFAppState().driverId = SignupGroup.signupCall
                                    .driverId(
                                      (apiResultbos?.jsonBody ?? ''),
                                    )
                                    .toString());

                            context.goNamed('RegisterImages');
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
                                  title: Text('Signup'),
                                  content: Text(getJsonField(
                                    (apiResultbos?.jsonBody ?? ''),
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
                                content: Text('개인정보처리 방침에 동의해주세요'),
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
                      } else {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('오류'),
                              content: Text('이용약관에 동의해주세요'),
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
                            color: FlutterFlowTheme.of(context).primaryBtnText,
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
    );
  }
}
