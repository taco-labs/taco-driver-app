// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:geolocator/geolocator.dart';
import '../../backend/api_requests/api_calls.dart';
import '../../custom_code/actions/init_driver_home.dart';

Future startStreamCurrentLocation() async {
  var locationSettings = LocationSettings();
  positionStream =
      Geolocator.getPositionStream(locationSettings: locationSettings)
          .listen((Position? position) async {
    debugPrint(position == null
        ? 'Unknown'
        : '${position!.latitude.toString()}, ${position!.longitude.toString()}');

    ApiCallResponse? apiResult =
        await DriverInfoGroup.updateDriverLocationCall.call(
      driverId: FFAppState().driverId,
      apiToken: FFAppState().apiToken,
      latitude: position!.latitude,
      longitude: position!.longitude,
    );

    if (!(apiResult?.succeeded ?? true)) {
      debugPrint(
          "Update Driver Location API call failed with ${apiResult.statusCode.toString()}");
    }
  });
}
