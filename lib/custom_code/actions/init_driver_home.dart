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
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../backend/api_requests/api_calls.dart';

const String kakaoAppKey = 'ad4db5aa94cc0675585a6203dd19747d';

void sendRefreshedFcmToken(String fcmToken) async {
  ApiCallResponse? apiResult1;
  ApiCallResponse? apiResult2;

  apiResult1 = await DriverInfoGroup.getDriverCall.call(
    apiToken: FFAppState().apiToken,
    driverId: FFAppState().driverId,
    apiEndpointTarget: FFAppState().apiEndpointTarget,
  );

  if ((apiResult1?.succeeded ?? true)) {
    apiResult2 = await DriverInfoGroup.updateDriverCall.call(
      driverId: FFAppState().driverId,
      apiToken: FFAppState().apiToken,
      apiEndpointTarget: FFAppState().apiEndpointTarget,
      appOs: DriverInfoGroup.getDriverCall
          .appOs(
            (apiResult1?.jsonBody ?? ''),
          )
          .toString(),
      appVersion: DriverInfoGroup.getDriverCall
          .appVersion(
            (apiResult1?.jsonBody ?? ''),
          )
          .toString(),
      appFcmToken: fcmToken,
      carNumber: FFAppState().driverCarNumber,
      profileImageUploaded:
          DriverInfoGroup.getDriverCall.isProfileImageUploaded(
        (apiResult1?.jsonBody ?? ''),
      ),
      licenseImageUploaded:
          DriverInfoGroup.getDriverCall.isLicenseImageUploaded(
        (apiResult1?.jsonBody ?? ''),
      ),
    );

    if ((apiResult2?.succeeded ?? false)) {
      print('error sending refreshed fcm token to server');
    }
  } else {
    print('error getting driver info from server');
  }
}

Future initDriverHome() async {
  // KakaoSdk.init(
  //   nativeAppKey: '$kakaoAppKey',
  // );
  await BackgroundLocator.initialize();

  FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
    sendRefreshedFcmToken(fcmToken);
  }).onError((err) {
    print('error getting refreshed fcm token');
  });
}
