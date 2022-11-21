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
import 'package:background_locator_2/settings/locator_settings.dart';
import 'package:background_locator_2/location_dto.dart';

Future startLocationService() async {
  BackgroundLocator.registerLocationUpdate(callback,
      autoStop: false,
      androidSettings: AndroidSettings(
        accuracy: LocationAccuracy.NAVIGATION,
        interval: 5,
        distanceFilter: 0,
      ));
}

@pragma('vm:entry-point')
void callback(LocationDto locationDto) async {
  debugPrint("lat ${locationDto.latitude} lng ${locationDto.longitude}");
}
