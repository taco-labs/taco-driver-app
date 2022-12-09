// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future fromCallRequestedMessagePayload(dynamic payload) async {
  // Call identifier
  FFAppState().callId = payload['taxiCallRequestId'];
  FFAppState().callTicketId = payload['taxiCallTicketId'];

  // Call state
  FFAppState().callState = payload['taxiCallState'];
  FFAppState().callUpdateTime = DateTime.parse(payload['updateTime']);

  // Rider
  FFAppState().callUserId = payload['userId'];
  FFAppState().callUserPhone = payload['userPhone'];

  // Rider requirements
  FFAppState().callTagsConcat = payload['tags'];
  FFAppState().callUserTag = payload['userTag'];

  // Location
  FFAppState().callDepartureCoordinate =
      LatLng(payload['departureLatitude'], payload['departureLongitude']);
  if (payload['departureBuildingName'].isEmpty) {
    FFAppState().callDepartureName = '';
  } else {
    FFAppState().callDepartureName = payload['departureBuildingName'];
  }
  FFAppState().callDepartureAddressRegionDepth2 =
      payload['departureAddressRegionDepth2'];
  FFAppState().callDepartureAddressRegionDepth3 =
      payload['departureAddressRegionDepth3'];
  FFAppState().callDepartureAddressMainNo = payload['departureMainAddressNo'];
  FFAppState().callDepartureAddressSubNo = payload['departureSubAddressNo'];

  FFAppState().callArrivalCoordinate =
      LatLng(payload['arrivalLatitude'], payload['arrivalLongitude']);
  if (payload['arrivalBuildingName'].isEmpty) {
    FFAppState().callArrivalName = '';
  } else {
    FFAppState().callArrivalName = payload['arrivalBuildingName'];
  }
  FFAppState().callArrivalAddressRegionDepth2 =
      payload['arrivalAddressRegionDepth2'];
  FFAppState().callArrivalAddressRegionDepth3 =
      payload['arrivalAddressRegionDepth3'];
  FFAppState().callArrivalAddressMainNo = payload['arrivalMainAddressNo'];
  FFAppState().callArrivalAddressSubNo = payload['arrivalSubAddressNo'];

  // Distance from departure to arrival in meters
  FFAppState().callToArrivalDistance = int.parse(payload['toArrivalDistance']);
  FFAppState().callToArrivalEtaNanoSec = int.parse(payload['toArrivalETA']);

  FFAppState().callToDepartureDistance =
      int.parse(payload['toDepartureDistance']);
  FFAppState().callToDepartureEtaNanoSec = int.parse(payload['toDepartureETA']);

  // Taxi fares
  FFAppState().callBasePrice = int.parse(payload['requestBasePrice']);
  FFAppState().callAdditionalPrice = int.parse(payload['additionalPrice']);
}
