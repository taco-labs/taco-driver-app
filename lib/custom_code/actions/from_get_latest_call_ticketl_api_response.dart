// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future fromGetLatestCallTicketlApiResponse(dynamic apiResponse) async {
  dynamic departureInfo = apiResponse['departure'];
  dynamic departurePointInfo = departureInfo['point'];
  dynamic departureAddressInfo = departureInfo['address'];
  dynamic arrivalInfo = apiResponse['arrival'];
  dynamic arrivalPointInfo = arrivalInfo['point'];
  dynamic arrivalAddressInfo = arrivalInfo['address'];

  // Call identifier
  FFAppState().callId = apiResponse['id'];
  FFAppState().callTicketId = apiResponse['taxiCallTicketId'];
  FFAppState().callTicketAttempt = apiResponse['attempt'];

  // Call state
  FFAppState().callState = apiResponse['currentState'];
  FFAppState().callCreateTime = DateTime.parse(apiResponse['createTime']);
  FFAppState().callUpdateTime = DateTime.parse(apiResponse['updateTime']);

  // Driver
  FFAppState().callUserId = apiResponse['userId'];
  FFAppState().callUserPhone = apiResponse['userPhone'];

  // User requirements
  FFAppState().callTags = List<String>.from(apiResponse['tags']);
  FFAppState().callTagsConcat = FFAppState().callTags.join(",");
  FFAppState().callUserTag = apiResponse['userTag'];

  // Location
  FFAppState().callDepartureCoordinate =
      LatLng(departurePointInfo['latitude'], departurePointInfo['longitude']);
  if (departureAddressInfo['buildingName'].isEmpty) {
    FFAppState().callDepartureName = '';
  } else {
    FFAppState().callDepartureName = departureAddressInfo['buildingName'];
  }
  FFAppState().callDepartureAddressRegionDepth2 =
      departureAddressInfo['regionDepth2'];
  FFAppState().callDepartureAddressRegionDepth3 =
      departureAddressInfo['regionDepth3'];
  FFAppState().callDepartureAddressMainNo =
      departureAddressInfo['mainAddressNo'];
  FFAppState().callDepartureAddressSubNo = departureAddressInfo['subAddressNo'];

  FFAppState().callArrivalCoordinate =
      LatLng(arrivalPointInfo['latitude'], arrivalPointInfo['longitude']);
  if (arrivalAddressInfo['buildingName'].isEmpty) {
    FFAppState().callArrivalName = '';
  } else {
    FFAppState().callArrivalName = arrivalAddressInfo['buildingName'];
  }
  FFAppState().callArrivalAddressRegionDepth2 =
      arrivalAddressInfo['regionDepth2'];
  FFAppState().callArrivalAddressRegionDepth3 =
      arrivalAddressInfo['regionDepth3'];
  FFAppState().callArrivalAddressMainNo = arrivalAddressInfo['mainAddressNo'];
  FFAppState().callArrivalAddressSubNo = arrivalAddressInfo['subAddressNo'];

  // Distance from departure to arrival in meters
  FFAppState().callToArrivalDistance = apiResponse['toArrivalDistance'];
  FFAppState().callToArrivalEtaNanoSec = apiResponse['toArrivalEta'];

  FFAppState().callToDepartureDistance = apiResponse['toDepartureDistance'];

  // Taxi fares
  FFAppState().callBasePrice = apiResponse['requestBasePrice'];
  // TODO: set user specified min, max
  FFAppState().callMinAdditionalPrice =
      apiResponse['requestMinAdditionalPrice'];
  FFAppState().callMaxAdditionalPrice =
      apiResponse['requestMaxAdditionalPrice'];
  FFAppState().callAdditionalPrice = apiResponse['additionalPrice'];
}
