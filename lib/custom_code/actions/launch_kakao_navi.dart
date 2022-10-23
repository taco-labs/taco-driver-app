// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'package:kakao_flutter_sdk_navi/kakao_flutter_sdk_navi.dart';

Future launchKakaoNavi(
  double latitude,
  double longitude,
) async {
  bool isInstalled = await NaviApi.instance.isKakaoNaviInstalled();
  if (!isInstalled) {
    debugPrint('카카오내비 미설치');
    launchBrowserTab(Uri.parse(NaviApi.webNaviInstall));
    return;
  }
}
