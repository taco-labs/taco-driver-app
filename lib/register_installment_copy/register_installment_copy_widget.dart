import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterInstallmentCopyWidget extends StatefulWidget {
  const RegisterInstallmentCopyWidget({
    Key? key,
    this.phoneNumber,
    this.authSmsStateKey,
  }) : super(key: key);

  final String? phoneNumber;
  final String? authSmsStateKey;

  @override
  _RegisterInstallmentCopyWidgetState createState() =>
      _RegisterInstallmentCopyWidgetState();
}

class _RegisterInstallmentCopyWidgetState
    extends State<RegisterInstallmentCopyWidget> {
  ApiCallResponse? apiResultRegisterAccount;
  String? dropDownValue;
  TextEditingController? accountNumberController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    accountNumberController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    accountNumberController?.dispose();
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
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: FlutterFlowDropDown<String>(
                              initialOption: dropDownValue ??= '',
                              options: [
                                '002',
                                '003',
                                '004',
                                '007',
                                '011',
                                '020',
                                '023',
                                '027',
                                '031',
                                '032',
                                '034',
                                '035',
                                '037',
                                '039',
                                '081',
                                '088',
                                '089',
                                '090',
                                '092',
                                '007',
                                '012',
                                '045',
                                '048',
                                '050',
                                '064',
                                '071',
                                '218',
                                '238',
                                '240',
                                '243',
                                '247',
                                '261',
                                '262',
                                '263',
                                '264',
                                '265',
                                '266',
                                '267',
                                '269',
                                '271',
                                '278',
                                '279',
                                '280',
                                '287'
                              ],
                              optionLabels: [
                                'KDB산업은행',
                                'IBK기업은행',
                                'KB국민은행',
                                '수협은행(수협중앙회)',
                                'NH농협은행',
                                '우리은행',
                                'SC제일은행',
                                '한국씨티은행',
                                '대구은행',
                                '부산은행',
                                '광주은행',
                                '제주은행',
                                '전북은행',
                                '경남은행',
                                '하나은행',
                                '신한은행',
                                '케이뱅크',
                                '카카오뱅크',
                                '토스뱅크',
                                '수협중앙회',
                                '농협중앙회(단위농축협)',
                                '새마을금고중앙회',
                                '신협중앙회',
                                '저축은행중앙회',
                                '산림조합중앙회',
                                '우정사업본부(우체국)',
                                'KB증권',
                                '미래에셋대우',
                                '삼성증권',
                                '한국투자증권',
                                'NH투자증권',
                                '교보증권',
                                '하이투자증권',
                                '현대차증권',
                                '키움증권',
                                '이베스트투자증권',
                                'SK증권',
                                '대신증권',
                                '한화투자증권',
                                '토스증권',
                                '신한금융투자',
                                'DB금융투자',
                                '유진투자증권',
                                '메리츠증권'
                              ],
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
                              hintText: '은행',
                              fillColor: Colors.white,
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
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
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
                                    ),
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
                                    fontSize: 18,
                                  ),
                              keyboardType: TextInputType.number,
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
                        bank: dropDownValue,
                        accountNumber: accountNumberController!.text,
                      );
                      if ((apiResultRegisterAccount?.succeeded ?? true)) {
                        context.pushNamed('Home');
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
                              title: Text('RegisterSettlementAccount'),
                              content: Text(getJsonField(
                                (apiResultRegisterAccount?.jsonBody ?? ''),
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
