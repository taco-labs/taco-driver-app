import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
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
    _appOs = prefs.getString('ff_appOs') ?? _appOs;
    _driverId = prefs.getString('ff_driverId') ?? _driverId;
  }

  late SharedPreferences prefs;

  String _apiToken = '';
  String get apiToken => _apiToken;
  set apiToken(String _value) {
    _apiToken = _value;
    prefs.setString('ff_apiToken', _value);
  }

  String _appOs = '';
  String get appOs => _appOs;
  set appOs(String _value) {
    _appOs = _value;
    prefs.setString('ff_appOs', _value);
  }

  String appVersion = '0.1';

  String _driverId = '';
  String get driverId => _driverId;
  set driverId(String _value) {
    _driverId = _value;
    prefs.setString('ff_driverId', _value);
  }

  String latestCallState = '';

  String callRequest = '';

  bool isOnDuty = false;

  String driverFirstName = '';
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
