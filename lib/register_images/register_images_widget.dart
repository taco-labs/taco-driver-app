import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class RegisterImagesWidget extends StatefulWidget {
  const RegisterImagesWidget({
    Key? key,
    this.phoneNumber,
    this.authSmsStateKey,
  }) : super(key: key);

  final String? phoneNumber;
  final String? authSmsStateKey;

  @override
  _RegisterImagesWidgetState createState() => _RegisterImagesWidgetState();
}

class _RegisterImagesWidgetState extends State<RegisterImagesWidget> {
  ApiCallResponse? apiResulttx0;
  bool? profileUploadSucceeded;
  ApiCallResponse? apiResulttx1;
  bool? licenseUploadSucceeded;
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
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          '사진 등록',
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
                Align(
                  alignment: AlignmentDirectional(0, -1),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFFDBE2E7),
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: FlutterFlowExpandedImageView(
                                        image: Image.network(
                                          FFAppState().profileImagePath,
                                          fit: BoxFit.contain,
                                        ),
                                        allowRotation: false,
                                        tag: FFAppState().profileImagePath,
                                        useHeroAnimation: true,
                                      ),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: FFAppState().profileImagePath,
                                  transitionOnUserGestures: true,
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      FFAppState().profileImagePath,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              apiResulttx0 =
                                  await DriverInfoGroup.getDriverCall.call(
                                apiToken: FFAppState().apiToken,
                                driverId: FFAppState().driverId,
                              );
                              if ((apiResulttx0?.succeeded ?? true)) {
                                profileUploadSucceeded =
                                    await actions.uploadImage(
                                  DriverInfoGroup.getDriverCall
                                      .profileImageUploadUrl(
                                        (apiResulttx0?.jsonBody ?? ''),
                                      )
                                      .toString(),
                                );
                                if (profileUploadSucceeded!) {
                                  setState(() => FFAppState().profileImagePath =
                                          DriverInfoGroup.getDriverCall
                                              .profileImageDownloadUrl(
                                        (apiResulttx0?.jsonBody ?? ''),
                                      ));
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
                                      title: Text('GetDriverImageUrl'),
                                      content: Text(
                                          (apiResulttx0?.statusCode ?? 200)
                                              .toString()),
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
                            text: '프로필 사진 등록',
                            options: FFButtonOptions(
                              height: 60,
                              color: FlutterFlowTheme.of(context).primaryColor,
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFDBE2E7),
                              shape: BoxShape.rectangle,
                            ),
                            child: InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    child: FlutterFlowExpandedImageView(
                                      image: Image.network(
                                        FFAppState().licenseImagePath,
                                        fit: BoxFit.contain,
                                      ),
                                      allowRotation: false,
                                      tag: FFAppState().licenseImagePath,
                                      useHeroAnimation: true,
                                    ),
                                  ),
                                );
                              },
                              child: Hero(
                                tag: FFAppState().licenseImagePath,
                                transitionOnUserGestures: true,
                                child: Image.network(
                                  FFAppState().licenseImagePath,
                                  width: 240,
                                  height: 130,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              apiResulttx1 =
                                  await DriverInfoGroup.getDriverCall.call(
                                apiToken: FFAppState().apiToken,
                                driverId: FFAppState().driverId,
                              );
                              if ((apiResulttx1?.succeeded ?? true)) {
                                licenseUploadSucceeded =
                                    await actions.uploadImage(
                                  DriverInfoGroup.getDriverCall
                                      .licenseImageUploadUrl(
                                        (apiResulttx1?.jsonBody ?? ''),
                                      )
                                      .toString(),
                                );
                                if (profileUploadSucceeded!) {
                                  setState(() => FFAppState().licenseImagePath =
                                          DriverInfoGroup.getDriverCall
                                              .licenseImageDownloadUrl(
                                        (apiResulttx0?.jsonBody ?? ''),
                                      ));
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
                                      title: Text('GetDriverImageUrls'),
                                      content: Text(
                                          (apiResulttx1?.statusCode ?? 200)
                                              .toString()),
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
                            text: '택시 등록증 사진 등록',
                            options: FFButtonOptions(
                              height: 60,
                              color: FlutterFlowTheme.of(context).primaryColor,
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (profileUploadSucceeded! && licenseUploadSucceeded!) {
                        context.goNamed('RegisterInstallment');
                      } else {
                        if (profileUploadSucceeded!) {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('오류'),
                                content: Text('택시 면허증 사진을 업로드해주세요'),
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
                        } else {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('오류'),
                                content: Text('프로필 사진을 업로드해주세요'),
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
                    },
                    text: '확인',
                    options: FFButtonOptions(
                      width: 270,
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
                      borderRadius: BorderRadius.circular(50),
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
