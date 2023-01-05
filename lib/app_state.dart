import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _apiToken = prefs.getString('ff_apiToken') ?? _apiToken;
    _driverId = prefs.getString('ff_driverId') ?? _driverId;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _apiToken = '';
  String get apiToken => _apiToken;
  set apiToken(String _value) {
    _apiToken = _value;
    prefs.setString('ff_apiToken', _value);
  }

  String _driverId = '';
  String get driverId => _driverId;
  set driverId(String _value) {
    _driverId = _value;
    prefs.setString('ff_driverId', _value);
  }

  String _driverFirstName = '';
  String get driverFirstName => _driverFirstName;
  set driverFirstName(String _value) {
    _driverFirstName = _value;
  }

  bool _isOnDrivingToDeparture = false;
  bool get isOnDrivingToDeparture => _isOnDrivingToDeparture;
  set isOnDrivingToDeparture(bool _value) {
    _isOnDrivingToDeparture = _value;
  }

  bool _isOnDrivingToArrival = false;
  bool get isOnDrivingToArrival => _isOnDrivingToArrival;
  set isOnDrivingToArrival(bool _value) {
    _isOnDrivingToArrival = _value;
  }

  bool _isOnCallWaiting = false;
  bool get isOnCallWaiting => _isOnCallWaiting;
  set isOnCallWaiting(bool _value) {
    _isOnCallWaiting = _value;
  }

  bool _isOnCallViewing = false;
  bool get isOnCallViewing => _isOnCallViewing;
  set isOnCallViewing(bool _value) {
    _isOnCallViewing = _value;
  }

  bool _isArrived = false;
  bool get isArrived => _isArrived;
  set isArrived(bool _value) {
    _isArrived = _value;
  }

  String _driverLastName = '';
  String get driverLastName => _driverLastName;
  set driverLastName(String _value) {
    _driverLastName = _value;
  }

  String _driverLicenseNumber = '';
  String get driverLicenseNumber => _driverLicenseNumber;
  set driverLicenseNumber(String _value) {
    _driverLicenseNumber = _value;
  }

  String _apiEndpointTarget = 'dev';
  String get apiEndpointTarget => _apiEndpointTarget;
  set apiEndpointTarget(String _value) {
    _apiEndpointTarget = _value;
  }

  String _driverBirthday = '';
  String get driverBirthday => _driverBirthday;
  set driverBirthday(String _value) {
    _driverBirthday = _value;
  }

  String _driverPhoneNumber = '';
  String get driverPhoneNumber => _driverPhoneNumber;
  set driverPhoneNumber(String _value) {
    _driverPhoneNumber = _value;
  }

  String _driverGenderCode = '';
  String get driverGenderCode => _driverGenderCode;
  set driverGenderCode(String _value) {
    _driverGenderCode = _value;
  }

  String _driverType = '';
  String get driverType => _driverType;
  set driverType(String _value) {
    _driverType = _value;
  }

  bool _driverIsOnDuty = false;
  bool get driverIsOnDuty => _driverIsOnDuty;
  set driverIsOnDuty(bool _value) {
    _driverIsOnDuty = _value;
  }

  bool _driverIsActivated = false;
  bool get driverIsActivated => _driverIsActivated;
  set driverIsActivated(bool _value) {
    _driverIsActivated = _value;
  }

  String _driverCompanyRegistrationNumber = '';
  String get driverCompanyRegistrationNumber =>
      _driverCompanyRegistrationNumber;
  set driverCompanyRegistrationNumber(String _value) {
    _driverCompanyRegistrationNumber = _value;
  }

  String _driverCompanyName = '';
  String get driverCompanyName => _driverCompanyName;
  set driverCompanyName(String _value) {
    _driverCompanyName = _value;
  }

  String _driverCarNumber = '';
  String get driverCarNumber => _driverCarNumber;
  set driverCarNumber(String _value) {
    _driverCarNumber = _value;
  }

  String _driverServiceRegion = '';
  String get driverServiceRegion => _driverServiceRegion;
  set driverServiceRegion(String _value) {
    _driverServiceRegion = _value;
  }

  bool _driverLicenseImageUploaded = false;
  bool get driverLicenseImageUploaded => _driverLicenseImageUploaded;
  set driverLicenseImageUploaded(bool _value) {
    _driverLicenseImageUploaded = _value;
  }

  bool _driverProfileImageUploaded = false;
  bool get driverProfileImageUploaded => _driverProfileImageUploaded;
  set driverProfileImageUploaded(bool _value) {
    _driverProfileImageUploaded = _value;
  }

  String _driverProfileImageUploadUrl = '';
  String get driverProfileImageUploadUrl => _driverProfileImageUploadUrl;
  set driverProfileImageUploadUrl(String _value) {
    _driverProfileImageUploadUrl = _value;
  }

  String _driverLicenseImageUploadUrl = '';
  String get driverLicenseImageUploadUrl => _driverLicenseImageUploadUrl;
  set driverLicenseImageUploadUrl(String _value) {
    _driverLicenseImageUploadUrl = _value;
  }

  String _driverBankAccountNumber = '';
  String get driverBankAccountNumber => _driverBankAccountNumber;
  set driverBankAccountNumber(String _value) {
    _driverBankAccountNumber = _value;
  }

  String _driverBankCode = '';
  String get driverBankCode => _driverBankCode;
  set driverBankCode(String _value) {
    _driverBankCode = _value;
  }

  String _errCode = '';
  String get errCode => _errCode;
  set errCode(String _value) {
    _errCode = _value;
  }

  String _callId = '';
  String get callId => _callId;
  set callId(String _value) {
    _callId = _value;
  }

  String _callState = '';
  String get callState => _callState;
  set callState(String _value) {
    _callState = _value;
  }

  DateTime? _callCreateTime;
  DateTime? get callCreateTime => _callCreateTime;
  set callCreateTime(DateTime? _value) {
    _callCreateTime = _value;
  }

  DateTime? _callUpdateTime;
  DateTime? get callUpdateTime => _callUpdateTime;
  set callUpdateTime(DateTime? _value) {
    _callUpdateTime = _value;
  }

  String _callUserId = '';
  String get callUserId => _callUserId;
  set callUserId(String _value) {
    _callUserId = _value;
  }

  String _callUserPhone = '';
  String get callUserPhone => _callUserPhone;
  set callUserPhone(String _value) {
    _callUserPhone = _value;
  }

  List<String> _callTags = [];
  List<String> get callTags => _callTags;
  set callTags(List<String> _value) {
    _callTags = _value;
  }

  void addToCallTags(String _value) {
    _callTags.add(_value);
  }

  void removeFromCallTags(String _value) {
    _callTags.remove(_value);
  }

  String _callUserTag = '';
  String get callUserTag => _callUserTag;
  set callUserTag(String _value) {
    _callUserTag = _value;
  }

  LatLng? _callDepartureCoordinate;
  LatLng? get callDepartureCoordinate => _callDepartureCoordinate;
  set callDepartureCoordinate(LatLng? _value) {
    _callDepartureCoordinate = _value;
  }

  String _callDepartureName = '';
  String get callDepartureName => _callDepartureName;
  set callDepartureName(String _value) {
    _callDepartureName = _value;
  }

  LatLng? _callArrivalCoordinate;
  LatLng? get callArrivalCoordinate => _callArrivalCoordinate;
  set callArrivalCoordinate(LatLng? _value) {
    _callArrivalCoordinate = _value;
  }

  String _callArrivalName = '';
  String get callArrivalName => _callArrivalName;
  set callArrivalName(String _value) {
    _callArrivalName = _value;
  }

  int _callToArrivalDistance = 0;
  int get callToArrivalDistance => _callToArrivalDistance;
  set callToArrivalDistance(int _value) {
    _callToArrivalDistance = _value;
  }

  int _callToArrivalEtaNanoSec = 0;
  int get callToArrivalEtaNanoSec => _callToArrivalEtaNanoSec;
  set callToArrivalEtaNanoSec(int _value) {
    _callToArrivalEtaNanoSec = _value;
  }

  List<dynamic> _callToArrivalRouteLatitudes = [];
  List<dynamic> get callToArrivalRouteLatitudes => _callToArrivalRouteLatitudes;
  set callToArrivalRouteLatitudes(List<dynamic> _value) {
    _callToArrivalRouteLatitudes = _value;
  }

  void addToCallToArrivalRouteLatitudes(dynamic _value) {
    _callToArrivalRouteLatitudes.add(_value);
  }

  void removeFromCallToArrivalRouteLatitudes(dynamic _value) {
    _callToArrivalRouteLatitudes.remove(_value);
  }

  List<dynamic> _callToArrivalRouteLongitudes = [];
  List<dynamic> get callToArrivalRouteLongitudes =>
      _callToArrivalRouteLongitudes;
  set callToArrivalRouteLongitudes(List<dynamic> _value) {
    _callToArrivalRouteLongitudes = _value;
  }

  void addToCallToArrivalRouteLongitudes(dynamic _value) {
    _callToArrivalRouteLongitudes.add(_value);
  }

  void removeFromCallToArrivalRouteLongitudes(dynamic _value) {
    _callToArrivalRouteLongitudes.remove(_value);
  }

  int _callToDepartureDistance = 0;
  int get callToDepartureDistance => _callToDepartureDistance;
  set callToDepartureDistance(int _value) {
    _callToDepartureDistance = _value;
  }

  int _callToDepartureEtaNanoSec = 0;
  int get callToDepartureEtaNanoSec => _callToDepartureEtaNanoSec;
  set callToDepartureEtaNanoSec(int _value) {
    _callToDepartureEtaNanoSec = _value;
  }

  List<dynamic> _callToDepartureRouteLatitudes = [];
  List<dynamic> get callToDepartureRouteLatitudes =>
      _callToDepartureRouteLatitudes;
  set callToDepartureRouteLatitudes(List<dynamic> _value) {
    _callToDepartureRouteLatitudes = _value;
  }

  void addToCallToDepartureRouteLatitudes(dynamic _value) {
    _callToDepartureRouteLatitudes.add(_value);
  }

  void removeFromCallToDepartureRouteLatitudes(dynamic _value) {
    _callToDepartureRouteLatitudes.remove(_value);
  }

  List<dynamic> _callToDepartureRouteLongitudes = [];
  List<dynamic> get callToDepartureRouteLongitudes =>
      _callToDepartureRouteLongitudes;
  set callToDepartureRouteLongitudes(List<dynamic> _value) {
    _callToDepartureRouteLongitudes = _value;
  }

  void addToCallToDepartureRouteLongitudes(dynamic _value) {
    _callToDepartureRouteLongitudes.add(_value);
  }

  void removeFromCallToDepartureRouteLongitudes(dynamic _value) {
    _callToDepartureRouteLongitudes.remove(_value);
  }

  int _callBasePrice = 0;
  int get callBasePrice => _callBasePrice;
  set callBasePrice(int _value) {
    _callBasePrice = _value;
  }

  int _callMinAdditionalPrice = 0;
  int get callMinAdditionalPrice => _callMinAdditionalPrice;
  set callMinAdditionalPrice(int _value) {
    _callMinAdditionalPrice = _value;
  }

  int _callMaxAdditionalPrice = 0;
  int get callMaxAdditionalPrice => _callMaxAdditionalPrice;
  set callMaxAdditionalPrice(int _value) {
    _callMaxAdditionalPrice = _value;
  }

  int _callAdditionalPrice = 0;
  int get callAdditionalPrice => _callAdditionalPrice;
  set callAdditionalPrice(int _value) {
    _callAdditionalPrice = _value;
  }

  String _driverProfileImageDownloadUrl = '';
  String get driverProfileImageDownloadUrl => _driverProfileImageDownloadUrl;
  set driverProfileImageDownloadUrl(String _value) {
    _driverProfileImageDownloadUrl = _value;
  }

  String _driverLicenseImageDownloadUrl = '';
  String get driverLicenseImageDownloadUrl => _driverLicenseImageDownloadUrl;
  set driverLicenseImageDownloadUrl(String _value) {
    _driverLicenseImageDownloadUrl = _value;
  }

  String _callTagsConcat = '';
  String get callTagsConcat => _callTagsConcat;
  set callTagsConcat(String _value) {
    _callTagsConcat = _value;
  }

  String _callArrivalAddressRegionDepth2 = '';
  String get callArrivalAddressRegionDepth2 => _callArrivalAddressRegionDepth2;
  set callArrivalAddressRegionDepth2(String _value) {
    _callArrivalAddressRegionDepth2 = _value;
  }

  String _callArrivalAddressRegionDepth3 = '';
  String get callArrivalAddressRegionDepth3 => _callArrivalAddressRegionDepth3;
  set callArrivalAddressRegionDepth3(String _value) {
    _callArrivalAddressRegionDepth3 = _value;
  }

  String _callArrivalAddressMainNo = '';
  String get callArrivalAddressMainNo => _callArrivalAddressMainNo;
  set callArrivalAddressMainNo(String _value) {
    _callArrivalAddressMainNo = _value;
  }

  String _callArrivalAddressSubNo = '';
  String get callArrivalAddressSubNo => _callArrivalAddressSubNo;
  set callArrivalAddressSubNo(String _value) {
    _callArrivalAddressSubNo = _value;
  }

  String _callTicketId = '';
  String get callTicketId => _callTicketId;
  set callTicketId(String _value) {
    _callTicketId = _value;
  }

  String _callDepartureAddressRegionDepth2 = '';
  String get callDepartureAddressRegionDepth2 =>
      _callDepartureAddressRegionDepth2;
  set callDepartureAddressRegionDepth2(String _value) {
    _callDepartureAddressRegionDepth2 = _value;
  }

  String _callDepartureAddressRegionDepth3 = '';
  String get callDepartureAddressRegionDepth3 =>
      _callDepartureAddressRegionDepth3;
  set callDepartureAddressRegionDepth3(String _value) {
    _callDepartureAddressRegionDepth3 = _value;
  }

  String _callDepartureAddressMainNo = '';
  String get callDepartureAddressMainNo => _callDepartureAddressMainNo;
  set callDepartureAddressMainNo(String _value) {
    _callDepartureAddressMainNo = _value;
  }

  String _callDepartureAddressSubNo = '';
  String get callDepartureAddressSubNo => _callDepartureAddressSubNo;
  set callDepartureAddressSubNo(String _value) {
    _callDepartureAddressSubNo = _value;
  }

  int _callTicketAttempt = 0;
  int get callTicketAttempt => _callTicketAttempt;
  set callTicketAttempt(int _value) {
    _callTicketAttempt = _value;
  }

  String _driverReferralCode = '';
  String get driverReferralCode => _driverReferralCode;
  set driverReferralCode(String _value) {
    _driverReferralCode = _value;
  }

  List<String> _supportedServiceRegions = [];
  List<String> get supportedServiceRegions => _supportedServiceRegions;
  set supportedServiceRegions(List<String> _value) {
    _supportedServiceRegions = _value;
  }

  void addToSupportedServiceRegions(String _value) {
    _supportedServiceRegions.add(_value);
  }

  void removeFromSupportedServiceRegions(String _value) {
    _supportedServiceRegions.remove(_value);
  }

  String _appDownloadUrl =
      'https://play.google.com/store/apps/details?id=com.tacolabs.taco.driver';
  String get appDownloadUrl => _appDownloadUrl;
  set appDownloadUrl(String _value) {
    _appDownloadUrl = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
