// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:background_locator_2/background_locator.dart';
import 'package:background_locator_2/settings/android_settings.dart';
import 'package:background_locator_2/settings/ios_settings.dart';
import 'package:background_locator_2/settings/locator_settings.dart';
import 'package:background_locator_2/location_dto.dart';
import '../../backend/api_requests/api_calls.dart';

class LocationServiceRepository {
  static LocationServiceRepository _instance = LocationServiceRepository._();

  LocationServiceRepository._();

  factory LocationServiceRepository() {
    return _instance;
  }

  static const String isolateName = 'LocatorIsolate';
  static String apiToken = '';
  static String driverId = '';
  static String apiEndpoint = '';

  Future<void> init(Map<dynamic, dynamic> params) async {
    debugPrint("***********Init callback handler");
    apiToken = params['apiToken'];
    apiEndpoint = params['apiEndpoint'];
    driverId = params['driverId'];
  }

  Future<void> dispose() async {
    debugPrint("***********Dispose callback handler");
  }

  Future<void> callback(LocationDto locationDto) async {
    debugPrint('location in dart: ${locationDto.toString()}');
    ApiCallResponse? apiResult =
        await DriverInfoGroup.updateDriverLocationCall.call(
      driverId: driverId,
      apiToken: apiToken,
      latitude: locationDto.latitude,
      longitude: locationDto.longitude,
      apiEndpointTarget: apiEndpoint,
    );

    if (apiResult.succeeded == false) {
      debugPrint(
          "Update Driver Location API call failed with ${apiResult.jsonBody['errCode']}");
    }
  }
}

@pragma('vm:entry-point')
class LocationCallbackHandler {
  @pragma('vm:entry-point')
  static Future<void> initCallback(Map<dynamic, dynamic> params) async {
    LocationServiceRepository myLocationCallbackRepository =
        LocationServiceRepository();
    await myLocationCallbackRepository.init(params);
  }

  @pragma('vm:entry-point')
  static Future<void> disposeCallback() async {
    LocationServiceRepository myLocationCallbackRepository =
        LocationServiceRepository();
    await myLocationCallbackRepository.dispose();
  }

  @pragma('vm:entry-point')
  static Future<void> callback(LocationDto locationDto) async {
    LocationServiceRepository myLocationCallbackRepository =
        LocationServiceRepository();
    await myLocationCallbackRepository.callback(locationDto);
  }

  @pragma('vm:entry-point')
  static Future<void> notificationCallback() async {
    debugPrint('***notificationCallback');
  }
}

Future startLocationService() async {
  return await BackgroundLocator.registerLocationUpdate(
      LocationCallbackHandler.callback,
      initCallback: LocationCallbackHandler.initCallback,
      initDataCallback: {
        'apiToken': FFAppState().apiToken,
        'apiEndpoint': FFAppState().apiEndpointTarget,
        'driverId': FFAppState().driverId,
      },
      disposeCallback: LocationCallbackHandler.disposeCallback,
      iosSettings: IOSSettings(
          accuracy: LocationAccuracy.NAVIGATION,
          distanceFilter: 0,
          stopWithTerminate: true),
      autoStop: false,
      androidSettings: AndroidSettings(
          accuracy: LocationAccuracy.NAVIGATION,
          interval: 5,
          distanceFilter: 0,
          client: LocationClient.google,
          androidNotificationSettings: AndroidNotificationSettings(
              notificationChannelName: 'Location tracking',
              notificationTitle: '타코 기사용',
              notificationMsg: '정확한 배차를 위해서 현위치를 사용합니다',
              notificationBigMsg: '',
              /*notificationBigMsg:
                  'Background location is on to keep the app up-tp-date with your location. This is required for main features to work properly when the app is not running.',*/
              notificationIconColor: Colors.grey,
              notificationTapCallback:
                  LocationCallbackHandler.notificationCallback)));
}
