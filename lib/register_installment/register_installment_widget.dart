import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterInstallmentWidget extends StatefulWidget {
  const RegisterInstallmentWidget({
    Key? key,
    this.phoneNumber,
    this.authSmsStateKey,
  }) : super(key: key);

  final String? phoneNumber;
  final String? authSmsStateKey;

  @override
  _RegisterInstallmentWidgetState createState() =>
      _RegisterInstallmentWidgetState();
}

class _RegisterInstallmentWidgetState extends State<RegisterInstallmentWidget> {
  ApiCallResponse? apiResultRegisterAccount;
  String? bankCodeValue;
  TextEditingController? accountNumberController;
  TextEditingController? accountHolderBirthdayController;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    accountHolderBirthdayController = TextEditingController();
    accountNumberController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    accountHolderBirthdayController?.dispose();
    accountNumberController?.dispose();
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
        title: Text(
          '정산 계좌 정보',
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: FlutterFlowDropDown<String>(
                              initialOption: bankCodeValue ??= '',
                              options:
                                  functions.getBankCodesOrNames(true).toList(),
                              optionLabels:
                                  functions.getBankCodesOrNames(false).toList(),
                              onChanged: (val) =>
                                  setState(() => bankCodeValue = val),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                              hintText: '은행',
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              elevation: 2,
                              borderColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderWidth: 2,
                              borderRadius: 8,
                              margin:
                                  EdgeInsetsDirectional.fromSTEB(20, 4, 20, 4),
                              hidesUnderline: true,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: TextFormField(
                              controller: accountNumberController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: '계좌번호',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                hintText: '- 를 제외한 계좌번호를 입력해주세요',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
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
                                    .primaryBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    20, 24, 20, 24),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                              keyboardType: TextInputType.number,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return '계좌번호를 정확히 입력해주세요';
                                }

                                if (val.length < 11) {
                                  return '계좌번호를 정확히 입력해주세요';
                                }
                                if (val.length > 14) {
                                  return '계좌번호를 정확히 입력해주세요';
                                }
                                if (!RegExp('^[0-9]*\$').hasMatch(val)) {
                                  return '계좌번호를 정확히 입력해주세요';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                            child: TextFormField(
                              controller: accountHolderBirthdayController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: '계좌주 생년월일',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                hintText: '계좌주의 주민번호 앞 6자리를 입력해주세요',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
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
                                    .primaryBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    20, 24, 20, 24),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                              keyboardType: TextInputType.number,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return '계좌주의 주민번호 앞 6자리를 정확히 입력해주세요';
                                }

                                if (val.length < 6) {
                                  return '계좌주의 주민번호 앞 6자리를 정확히 입력해주세요';
                                }
                                if (val.length > 6) {
                                  return '계좌주의 주민번호 앞 6자리를 정확히 입력해주세요';
                                }
                                if (!RegExp('^\\d{2}[0-1]\\d{1}[0-3]\\d{1}\$')
                                    .hasMatch(val)) {
                                  return '계좌주의 주민번호 앞 6자리를 정확히 입력해주세요';
                                }
                                return null;
                              },
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

                      if (bankCodeValue == null) {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('오류'),
                              content: Text('은행을 선택해주세요'),
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

                      apiResultRegisterAccount = await DriverInfoGroup
                          .registerSettlementAccountCall
                          .call(
                        driverId: FFAppState().driverId,
                        apiToken: FFAppState().apiToken,
                        bank: bankCodeValue,
                        accountNumber: accountNumberController!.text,
                        apiEndpointTarget: FFAppState().apiEndpointTarget,
                        accountHolderBirthday:
                            accountHolderBirthdayController!.text,
                      );
                      if ((apiResultRegisterAccount?.succeeded ?? true)) {
                        context.goNamed('Home');
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
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            fontWeight: FontWeight.bold,
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
