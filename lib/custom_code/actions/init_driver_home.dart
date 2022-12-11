// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'package:background_locator_2/background_locator.dart';
import 'package:kakao_flutter_sdk_navi/kakao_flutter_sdk_navi.dart';

const String kakaoAppKey = 'ad4db5aa94cc0675585a6203dd19747d';

Future initDriverHome() async {
  KakaoSdk.init(
    nativeAppKey: '$kakaoAppKey',
  );
  await BackgroundLocator.initialize();

  if (await NaviApi.instance.isKakaoNaviInstalled() == false) {
    launchBrowserTab(Uri.parse(NaviApi.webNaviInstall));
  }
}
