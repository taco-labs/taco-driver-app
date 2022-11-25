import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

List<String> getSupportedServiceArea() {
  List<String> supportedArea = [
    '서울',
    '경기 고양',
    '경기 과천',
    '경기 광명',
    '경기 광주',
    '경기 구리',
    '경기 군포',
    '경기 김포',
    '경기 남양주',
    '경기 동두천',
    '경기 부천',
    '경기 성남',
    '경기 수원',
    '경기 시흥',
    '경기 안산',
    '경기 안성',
    '경기 안양',
    '경기 양주',
    '경기 여주',
    '경기 오산',
    '경기 용인',
    '경기 의왕',
    '경기 의정부',
    '경기 이천',
    '경기 파주',
    '경기 평택',
    '경기 포천',
    '경기 하남',
    '경기 화성',
  ];

  return supportedArea;
}

String toDriverType(String driverTypeInput) {
  String driverType = 'UNKNOWN';
  switch (driverTypeInput) {
    case '개인 택시':
      driverType = 'INDIVIDUAL';
      break;
    case '법인 택시':
      driverType = 'COORPERATE';
      break;
  }

  return driverType;
}

String toHumanFriendlyDistanceFromMeters(int meters) {
  double distanceInKillometers = meters / 1000;

  return '$distanceInKillometers km';
}

String toHumanFreindlyEtaFromNanoseconds(int nanoSeconds) {
  return '${(nanoSeconds / 1000000000 / 60).toString()} 분';
}
