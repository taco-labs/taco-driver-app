// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:kakao_flutter_sdk_navi/kakao_flutter_sdk_navi.dart';

Future launchKakaoNavi(
  double latitude,
  double longitude,
) async {
  if (await NaviApi.instance.isKakaoNaviInstalled()) {
    await NaviApi.instance.navigate(
      destination: Location(name: '출발지', x: '$longitude', y: '$latitude'),
      option: NaviOption(coordType: CoordType.wgs84),
    );
  } else {
    launchBrowserTab(Uri.parse(NaviApi.webNaviInstall));
  }
}
