import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
  bool isMediaUploading1 = false;
  FFLocalFile uploadedLocalFile1 = FFLocalFile(bytes: Uint8List.fromList([]));

  ApiCallResponse? apiResulttx0;
  bool? profileUploadSucceeded;
  String? fcmToken2;
  ApiCallResponse? apiResultUpdateDriver2;
  bool isMediaUploading2 = false;
  FFLocalFile uploadedLocalFile2 = FFLocalFile(bytes: Uint8List.fromList([]));

  ApiCallResponse? apiResulttx1;
  bool? licenseUploadSucceeded;
  String? fcmToken;
  ApiCallResponse? apiResultUpdateDriver;
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
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
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
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 1,
                              child: Stack(
                                children: [
                                  if ((profileUploadSucceeded == null) ||
                                      (profileUploadSucceeded == false))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2, 2, 2, 2),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.width,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/images/Portrait_Placeholder.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  if ((profileUploadSucceeded != null) &&
                                      (profileUploadSucceeded == true))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2, 2, 2, 2),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.width,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          FFAppState()
                                              .driverProfileImageDownloadUrl,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                ],
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
                                apiEndpointTarget:
                                    FFAppState().apiEndpointTarget,
                              );
                              if ((apiResulttx0?.succeeded ?? true)) {
                                await requestPermission(photoLibraryPermission);
                                await requestPermission(photoLibraryPermission);
                                final selectedMedia =
                                    await selectMediaWithSourceBottomSheet(
                                  context: context,
                                  allowPhoto: true,
                                  pickerFontFamily: 'Poppins',
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  setState(() => isMediaUploading1 = true);
                                  var selectedLocalFiles = <FFLocalFile>[];
                                  try {
                                    selectedLocalFiles = selectedMedia
                                        .map((m) => FFLocalFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                            ))
                                        .toList();
                                  } finally {
                                    isMediaUploading1 = false;
                                  }
                                  if (selectedLocalFiles.length ==
                                      selectedMedia.length) {
                                    setState(() => uploadedLocalFile1 =
                                        selectedLocalFiles.first);
                                  } else {
                                    setState(() {});
                                    return;
                                  }
                                }

                                profileUploadSucceeded =
                                    await actions.uploadImage(
                                  DriverInfoGroup.getDriverCall
                                      .profileImageUploadUrl(
                                        (apiResulttx0?.jsonBody ?? ''),
                                      )
                                      .toString(),
                                  null!,
                                );
                                if (profileUploadSucceeded!) {
                                  fcmToken2 = await actions.getFcmToken();
                                  apiResultUpdateDriver2 = await DriverInfoGroup
                                      .updateDriverCall
                                      .call(
                                    driverId: FFAppState().driverId,
                                    apiToken: FFAppState().apiToken,
                                    appOs: DriverInfoGroup.getDriverCall
                                        .appOs(
                                          (apiResulttx0?.jsonBody ?? ''),
                                        )
                                        .toString(),
                                    appVersion: DriverInfoGroup.getDriverCall
                                        .appVersion(
                                          (apiResulttx0?.jsonBody ?? ''),
                                        )
                                        .toString(),
                                    appFcmToken: fcmToken2,
                                    profileImageUploaded: true,
                                    licenseImageUploaded: DriverInfoGroup
                                        .getDriverCall
                                        .isLicenseImageUploaded(
                                      (apiResulttx0?.jsonBody ?? ''),
                                    ),
                                    carNumber: FFAppState().driverCarNumber,
                                    apiEndpointTarget:
                                        FFAppState().apiEndpointTarget,
                                  );
                                  if ((apiResultUpdateDriver2?.succeeded ??
                                      true)) {
                                    FFAppState().update(() {
                                      FFAppState()
                                              .driverProfileImageDownloadUrl =
                                          DriverInfoGroup.getDriverCall
                                              .profileImageDownloadUrl(
                                        (apiResulttx0?.jsonBody ?? ''),
                                      );
                                    });
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
                              }

                              setState(() {});
                            },
                            text: '프로필 사진 등록',
                            options: FFButtonOptions(
                              width: 150,
                              height: 50,
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
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Container(
                            width: 240,
                            height: 150,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 1,
                              child: Stack(
                                children: [
                                  if ((licenseUploadSucceeded == null) ||
                                      (licenseUploadSucceeded == false))
                                    Image.asset(
                                      'assets/images/Square_Placeholder.png',
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              1,
                                      fit: BoxFit.cover,
                                    ),
                                  if ((licenseUploadSucceeded != null) &&
                                      (licenseUploadSucceeded == true))
                                    Image.network(
                                      FFAppState()
                                          .driverLicenseImageDownloadUrl,
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              1,
                                      fit: BoxFit.cover,
                                    ),
                                ],
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
                                apiEndpointTarget:
                                    FFAppState().apiEndpointTarget,
                              );
                              if ((apiResulttx1?.succeeded ?? true)) {
                                await requestPermission(photoLibraryPermission);
                                await requestPermission(cameraPermission);
                                final selectedMedia =
                                    await selectMediaWithSourceBottomSheet(
                                  context: context,
                                  allowPhoto: true,
                                  pickerFontFamily: 'Poppins',
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  setState(() => isMediaUploading2 = true);
                                  var selectedLocalFiles = <FFLocalFile>[];
                                  try {
                                    selectedLocalFiles = selectedMedia
                                        .map((m) => FFLocalFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                            ))
                                        .toList();
                                  } finally {
                                    isMediaUploading2 = false;
                                  }
                                  if (selectedLocalFiles.length ==
                                      selectedMedia.length) {
                                    setState(() => uploadedLocalFile2 =
                                        selectedLocalFiles.first);
                                  } else {
                                    setState(() {});
                                    return;
                                  }
                                }

                                licenseUploadSucceeded =
                                    await actions.uploadImage(
                                  DriverInfoGroup.getDriverCall
                                      .licenseImageUploadUrl(
                                        (apiResulttx1?.jsonBody ?? ''),
                                      )
                                      .toString(),
                                  null!,
                                );
                                if (licenseUploadSucceeded!) {
                                  fcmToken = await actions.getFcmToken();
                                  apiResultUpdateDriver = await DriverInfoGroup
                                      .updateDriverCall
                                      .call(
                                    driverId: FFAppState().driverId,
                                    apiToken: FFAppState().apiToken,
                                    appOs: DriverInfoGroup.getDriverCall
                                        .appOs(
                                          (apiResulttx1?.jsonBody ?? ''),
                                        )
                                        .toString(),
                                    appVersion: DriverInfoGroup.getDriverCall
                                        .appVersion(
                                          (apiResulttx1?.jsonBody ?? ''),
                                        )
                                        .toString(),
                                    appFcmToken: fcmToken,
                                    profileImageUploaded: DriverInfoGroup
                                        .getDriverCall
                                        .isProfileImageUploaded(
                                      (apiResulttx1?.jsonBody ?? ''),
                                    ),
                                    licenseImageUploaded: true,
                                    carNumber: FFAppState().driverCarNumber,
                                    apiEndpointTarget:
                                        FFAppState().apiEndpointTarget,
                                  );
                                  if ((apiResultUpdateDriver2?.succeeded ??
                                      true)) {
                                    FFAppState().update(() {
                                      FFAppState()
                                              .driverLicenseImageDownloadUrl =
                                          DriverInfoGroup.getDriverCall
                                              .licenseImageDownloadUrl(
                                        (apiResulttx0?.jsonBody ?? ''),
                                      );
                                    });
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
                              }

                              setState(() {});
                            },
                            text: '택시 등록증 사진 등록',
                            options: FFButtonOptions(
                              width: 190,
                              height: 50,
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
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
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
