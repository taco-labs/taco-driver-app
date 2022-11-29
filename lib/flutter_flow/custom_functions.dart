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

String toHumanFriendlyDistanceFromMeters(String meters) {
  double distanceInKillometers = int.parse(meters) / 1000;

  return '$distanceInKillometers km';
}

String toHumanFreindlyEtaFromNanoseconds(String nanoSeconds) {
  int minutes = (int.parse(nanoSeconds) / 1000000000 / 60).toInt();

  return '${minutes.toString()} 분';
}

String toBankNameFromCode(String bankCode) {
  var bankMap = {
    "002": "KDB산업은행",
    "003": "IBK기업은행",
    "004": "KB국민은행",
    "007": "수협은행",
    "011": "NH농협은행",
    "012": "농협중앙회(단위농축협)",
    "020": "우리은행",
    "023": "SC제일은행",
    "027": "한국씨티은행",
    "031": "대구은행",
    "032": "부산은행",
    "034": "광주은행",
    "035": "제주은행",
    "037": "전북은행",
    "039": "경남은행",
    "045": "새마을금고중앙회",
    "048": "신협중앙회",
    "050": "저축은행중앙회",
    "064": "산림조합중앙회",
    "071": "우체국",
    "081": "하나은행",
    "088": "신한은행",
    "089": "케이뱅크",
    "090": "카카오뱅크",
    "092": "토스뱅크",
    "218": "KB증권",
    "238": "미래에셋대우",
    "240": "삼성증권",
    "243": "한국투자증권",
    "247": "NH투자증권",
    "261": "교보증권",
    "262": "하이투자증권",
    "263": "현대차증권",
    "264": "키움증권",
    "265": "이베스트투자증권",
    "266": "SK증권",
    "267": "대신증권",
    "269": "한화투자증권",
    "271": "토스증권",
    "278": "신한금융투자",
    "279": "DB금융투자",
    "280": "유진투자증권",
    "287": "메리츠증권"
  };

  return bankMap[bankCode]!;
}

List<String> getBankCodesOrNames(bool needBankCodes) {
  var bankMap = {
    "002": "KDB산업은행",
    "003": "IBK기업은행",
    "004": "KB국민은행",
    "007": "수협은행",
    "011": "NH농협은행",
    "012": "농협중앙회(단위농축협)",
    "020": "우리은행",
    "023": "SC제일은행",
    "027": "한국씨티은행",
    "031": "대구은행",
    "032": "부산은행",
    "034": "광주은행",
    "035": "제주은행",
    "037": "전북은행",
    "039": "경남은행",
    "045": "새마을금고중앙회",
    "048": "신협중앙회",
    "050": "저축은행중앙회",
    "064": "산림조합중앙회",
    "071": "우체국",
    "081": "하나은행",
    "088": "신한은행",
    "089": "케이뱅크",
    "090": "카카오뱅크",
    "092": "토스뱅크",
    "218": "KB증권",
    "238": "미래에셋대우",
    "240": "삼성증권",
    "243": "한국투자증권",
    "247": "NH투자증권",
    "261": "교보증권",
    "262": "하이투자증권",
    "263": "현대차증권",
    "264": "키움증권",
    "265": "이베스트투자증권",
    "266": "SK증권",
    "267": "대신증권",
    "269": "한화투자증권",
    "271": "토스증권",
    "278": "신한금융투자",
    "279": "DB금융투자",
    "280": "유진투자증권",
    "287": "메리츠증권"
  };

  if (needBankCodes) {
    return bankMap.keys.toList();
  }

  return bankMap.values.toList();
}

String toAddressNo(
  String subAddressNo,
  String mainAddressNo,
) {
  if (subAddressNo.isEmpty) {
    return mainAddressNo;
  }

  return '$mainAddressNo-$subAddressNo';
}
