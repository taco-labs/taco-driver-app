import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';

String toTimeSeconds(String rawTimestampString) {
  DateTime dateTime = DateTime.parse(rawTimestampString).toLocal();
  DateFormat df = DateFormat('yyyy-MM-dd HH:mm:ss');
  return df.format(dateTime);
}

double toLatitudeFromLatLng(LatLng latLng) {
  return latLng.latitude;
}

double toLongitudeFromLatLng(LatLng latLng) {
  return latLng.longitude;
}

bool isCompletedCallRequest(String currentState) {
  bool completed = false;
  switch (currentState) {
    case "TAXI_CALL_DONE":
    case "USER_CANCELLED":
    case "DRIVER_CANCELLED":
      {
        completed = true;
      }
      break;
  }

  return completed;
}
