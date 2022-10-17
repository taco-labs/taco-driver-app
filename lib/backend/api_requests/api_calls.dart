import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Signin  flow Group Code

class SigninFlowGroup {
  static String baseUrl = 'https://driver.dev.api.taco-labs.com/driver/signin';
  static Map<String, String> headers = {};
  static SMSVerificationRequestCall sMSVerificationRequestCall =
      SMSVerificationRequestCall();
  static SMSVerificationAndSigninCall sMSVerificationAndSigninCall =
      SMSVerificationAndSigninCall();
}

class SMSVerificationRequestCall {
  Future<ApiCallResponse> call({
    String? stateKey = '',
    String? phone = '',
  }) {
    final body = '''
{
  "stateKey": "${stateKey}",
  "phone": "${phone}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SMS verification request',
      apiUrl: '${SigninFlowGroup.baseUrl}/sms/request',
      callType: ApiCallType.POST,
      headers: {
        ...SigninFlowGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class SMSVerificationAndSigninCall {
  Future<ApiCallResponse> call({
    String? stateKey = '',
    String? verificationCode = '',
  }) {
    final body = '''
{
  "stateKey": "${stateKey}",
  "verificationCode": "${verificationCode}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SMS Verification and signin',
      apiUrl: '${SigninFlowGroup.baseUrl}/sms/verify',
      callType: ApiCallType.POST,
      headers: {
        ...SigninFlowGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }

  dynamic apiToken(dynamic response) => getJsonField(
        response,
        r'''$.token''',
      );
  dynamic driverInfo(dynamic response) => getJsonField(
        response,
        r'''$.driver''',
      );
  dynamic driverId(dynamic response) => getJsonField(
        response,
        r'''$.driver.id''',
      );
  dynamic driverType(dynamic response) => getJsonField(
        response,
        r'''$.driver.driverType''',
      );
  dynamic driverFirstName(dynamic response) => getJsonField(
        response,
        r'''$.driver.firstName''',
      );
  dynamic driverLastName(dynamic response) => getJsonField(
        response,
        r'''$.driver.lastName''',
      );
  dynamic driverPhoneNumber(dynamic response) => getJsonField(
        response,
        r'''$.driver.phone''',
      );
  dynamic driverGenderCode(dynamic response) => getJsonField(
        response,
        r'''$.driver.gender''',
      );
  dynamic driverAppOs(dynamic response) => getJsonField(
        response,
        r'''$.driver.appOs''',
      );
  dynamic driverAppVersion(dynamic response) => getJsonField(
        response,
        r'''$.driver.osVersion''',
      );
  dynamic driverIsActive(dynamic response) => getJsonField(
        response,
        r'''$.driver.active''',
      );
  dynamic driverIsOnDuty(dynamic response) => getJsonField(
        response,
        r'''$.driver.onDuty''',
      );
}

/// End Signin  flow Group Code

/// Start Signup Group Code

class SignupGroup {
  static String baseUrl = 'https://driver.dev.api.taco-labs.com/driver';
  static Map<String, String> headers = {};
  static SignupCall signupCall = SignupCall();
}

class SignupCall {
  Future<ApiCallResponse> call({
    String? driverType = '',
    String? firstName = '',
    String? lastName = '',
    String? gender = '',
    String? birthday = '',
    String? phone = '',
    String? appOs = '',
    String? appVersion = '',
    String? appFcmToken = '',
    String? driverLicenseId = '',
    String? smsVerificationStateKey = '',
  }) {
    final body = '''
{
  "driverType": "${driverType}",
  "firstName": "${firstName}",
  "lastName": "${lastName}",
  "gender": "${gender}",
  "phone": "${phone}",
  "appOs": "${appOs}",
  "appVersion": "${appVersion}",
  "appFcmToken": "${appFcmToken}",
  "driverLicenseId": "${driverLicenseId}",
  "smsVerificationStateKey": "${smsVerificationStateKey}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Signup',
      apiUrl: '${SignupGroup.baseUrl}/signup',
      callType: ApiCallType.POST,
      headers: {
        ...SignupGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }

  dynamic apiToken(dynamic response) => getJsonField(
        response,
        r'''$.token''',
      );
  dynamic driverInfo(dynamic response) => getJsonField(
        response,
        r'''$.driver''',
      );
  dynamic driverId(dynamic response) => getJsonField(
        response,
        r'''$.driver.id''',
      );
  dynamic driverType(dynamic response) => getJsonField(
        response,
        r'''$.driver.driverType''',
      );
  dynamic driverFirstName(dynamic response) => getJsonField(
        response,
        r'''$.driver.firstName''',
      );
  dynamic driverLastName(dynamic response) => getJsonField(
        response,
        r'''$.driver.lastName''',
      );
  dynamic driverPhoneNumber(dynamic response) => getJsonField(
        response,
        r'''$.driver.phone''',
      );
  dynamic driverGenderCode(dynamic response) => getJsonField(
        response,
        r'''$.driver.gender''',
      );
  dynamic driverAppOs(dynamic response) => getJsonField(
        response,
        r'''$.driver.appOs''',
      );
  dynamic driverAppVersion(dynamic response) => getJsonField(
        response,
        r'''$.driver.osVersion''',
      );
  dynamic driverIsActive(dynamic response) => getJsonField(
        response,
        r'''$.driver.active''',
      );
  dynamic dirverIsOnDuty(dynamic response) => getJsonField(
        response,
        r'''$.driver.onDuty''',
      );
}

/// End Signup Group Code

/// Start Driver Info Group Code

class DriverInfoGroup {
  static String baseUrl = 'https://driver.dev.api.taco-labs.com/driver';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [apiToken]',
  };
  static GetDriverCall getDriverCall = GetDriverCall();
  static UpdateDriverCall updateDriverCall = UpdateDriverCall();
  static UpdateOnDutyCall updateOnDutyCall = UpdateOnDutyCall();
  static UpdateDriverLocationCall updateDriverLocationCall =
      UpdateDriverLocationCall();
  static RegisterSettlementAccountCall registerSettlementAccountCall =
      RegisterSettlementAccountCall();
  static GetSettlementAccountCall getSettlementAccountCall =
      GetSettlementAccountCall();
  static UpdateDriverSettlementAccountCall updateDriverSettlementAccountCall =
      UpdateDriverSettlementAccountCall();
}

class GetDriverCall {
  Future<ApiCallResponse> call({
    String? apiToken = '',
    String? driverId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Driver',
      apiUrl: '${DriverInfoGroup.baseUrl}/${driverId}',
      callType: ApiCallType.GET,
      headers: {
        ...DriverInfoGroup.headers,
      },
      params: {},
      returnBody: true,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic driverType(dynamic response) => getJsonField(
        response,
        r'''$.driverType''',
      );
  dynamic firstName(dynamic response) => getJsonField(
        response,
        r'''$.firstName''',
      );
  dynamic lastName(dynamic response) => getJsonField(
        response,
        r'''$.lastName''',
      );
  dynamic phoneNumber(dynamic response) => getJsonField(
        response,
        r'''$.phone''',
      );
  dynamic genderCode(dynamic response) => getJsonField(
        response,
        r'''$.gender''',
      );
  dynamic appOs(dynamic response) => getJsonField(
        response,
        r'''$.appOs''',
      );
  dynamic appVersion(dynamic response) => getJsonField(
        response,
        r'''$.osVersion''',
      );
  dynamic isActive(dynamic response) => getJsonField(
        response,
        r'''$.active''',
      );
  dynamic isOnDuty(dynamic response) => getJsonField(
        response,
        r'''$.onDuty''',
      );
  dynamic birthday(dynamic response) => getJsonField(
        response,
        r'''$.birtyday''',
      );
}

class UpdateDriverCall {
  Future<ApiCallResponse> call({
    String? driverId = '',
    String? apiToken = '',
    String? appOs = '',
    String? appVersion = '',
    String? appFcmToken = '',
  }) {
    final body = '''
{
  "appOs": "${appOs}",
  "appVersion": "${appVersion}",
  "appFcmToken": "${appFcmToken}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Driver',
      apiUrl: '${DriverInfoGroup.baseUrl}/${driverId}',
      callType: ApiCallType.PUT,
      headers: {
        ...DriverInfoGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class UpdateOnDutyCall {
  Future<ApiCallResponse> call({
    String? apiToken = '',
    String? driverId = '',
    bool? onDuty,
  }) {
    final body = '''
{
  "onDuty": ${onDuty}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update on duty',
      apiUrl: '${DriverInfoGroup.baseUrl}/${driverId}/on_duty',
      callType: ApiCallType.PUT,
      headers: {
        ...DriverInfoGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class UpdateDriverLocationCall {
  Future<ApiCallResponse> call({
    String? driverId = '',
    String? apiToken = '',
    double? latitude,
    double? longitude,
  }) {
    final body = '''
{
  "latitude": ${latitude},
  "longitude": ${longitude}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update driver location',
      apiUrl: '${DriverInfoGroup.baseUrl}/${driverId}/location',
      callType: ApiCallType.PUT,
      headers: {
        ...DriverInfoGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class RegisterSettlementAccountCall {
  Future<ApiCallResponse> call({
    String? driverId = '',
    String? apiToken = '',
    String? bank = '',
    String? accountNumber = '',
  }) {
    final body = '''
{
  "bank": "${bank}",
  "accountNumber": "${accountNumber}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Register settlement account',
      apiUrl: '${DriverInfoGroup.baseUrl}/${driverId}/settlement_account',
      callType: ApiCallType.POST,
      headers: {
        ...DriverInfoGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class GetSettlementAccountCall {
  Future<ApiCallResponse> call({
    String? driverId = '',
    String? apiToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Settlement account',
      apiUrl: '${DriverInfoGroup.baseUrl}/${driverId}/settlement_account',
      callType: ApiCallType.GET,
      headers: {
        ...DriverInfoGroup.headers,
      },
      params: {},
      returnBody: true,
    );
  }
}

class UpdateDriverSettlementAccountCall {
  Future<ApiCallResponse> call({
    String? driverId = '',
    String? apiToken = '',
    String? bank = '',
    String? accountNumber = '',
  }) {
    final body = '''
{
  "bank": "${bank}",
  "accountNumber": "${accountNumber}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update driver settlement account',
      apiUrl: '${DriverInfoGroup.baseUrl}/${driverId}/settlement_account',
      callType: ApiCallType.PUT,
      headers: {
        ...DriverInfoGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

/// End Driver Info Group Code

/// Start Backoffice Group Code

class BackofficeGroup {
  static String baseUrl = 'https://backoffice.dev.api.taco-labs.com/driver';
  static Map<String, String> headers = {
    'Authorization': 'Bearer backoffice_secret_dev',
  };
  static DeleteDriverCall deleteDriverCall = DeleteDriverCall();
  static ActivateDriverCall activateDriverCall = ActivateDriverCall();
}

class DeleteDriverCall {
  Future<ApiCallResponse> call({
    String? driverId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete Driver',
      apiUrl: '${BackofficeGroup.baseUrl}/${driverId}',
      callType: ApiCallType.DELETE,
      headers: {
        ...BackofficeGroup.headers,
      },
      params: {},
      returnBody: true,
    );
  }
}

class ActivateDriverCall {
  Future<ApiCallResponse> call({
    String? driverId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Activate Driver',
      apiUrl: '${BackofficeGroup.baseUrl}/${driverId}/activate',
      callType: ApiCallType.PUT,
      headers: {
        ...BackofficeGroup.headers,
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

/// End Backoffice Group Code

/// Start Taxi Call Group Code

class TaxiCallGroup {
  static String baseUrl = 'https://driver.dev.api.taco-labs.com';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [apiToken]',
  };
  static GetLatestTaxiCallCall getLatestTaxiCallCall = GetLatestTaxiCallCall();
  static ListTaxiCallCall listTaxiCallCall = ListTaxiCallCall();
  static AcceptTaxiCallTicketCall acceptTaxiCallTicketCall =
      AcceptTaxiCallTicketCall();
  static RejectTaxiCallTicketCall rejectTaxiCallTicketCall =
      RejectTaxiCallTicketCall();
}

class GetLatestTaxiCallCall {
  Future<ApiCallResponse> call({
    String? driverId = '',
    String? apiToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Latest Taxi Call',
      apiUrl: '${TaxiCallGroup.baseUrl}/driver/${driverId}/taxicall_latest',
      callType: ApiCallType.GET,
      headers: {
        ...TaxiCallGroup.headers,
      },
      params: {},
      returnBody: true,
    );
  }
}

class ListTaxiCallCall {
  Future<ApiCallResponse> call({
    String? driverId = '',
    String? apiToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'List Taxi Call',
      apiUrl: '${TaxiCallGroup.baseUrl}/driver/${driverId}/taxicall',
      callType: ApiCallType.GET,
      headers: {
        ...TaxiCallGroup.headers,
      },
      params: {},
      returnBody: true,
    );
  }

  dynamic callList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  dynamic pageToken(dynamic response) => getJsonField(
        response,
        r'''$.pageToken''',
      );
}

class AcceptTaxiCallTicketCall {
  Future<ApiCallResponse> call({
    String? ticketId = '',
    String? apiToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Accept Taxi Call Ticket',
      apiUrl: '${TaxiCallGroup.baseUrl}/ticket/${ticketId}',
      callType: ApiCallType.PUT,
      headers: {
        ...TaxiCallGroup.headers,
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class RejectTaxiCallTicketCall {
  Future<ApiCallResponse> call({
    String? ticketId = '',
    String? apiToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Reject Taxi Call Ticket',
      apiUrl: '${TaxiCallGroup.baseUrl}/ticket/${ticketId}',
      callType: ApiCallType.DELETE,
      headers: {
        ...TaxiCallGroup.headers,
      },
      params: {},
      returnBody: true,
    );
  }
}

/// End Taxi Call Group Code

class GetUUIDCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Get UUID',
      apiUrl: 'https://www.uuidtools.com/api/generate/v4',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }

  static dynamic uuid(dynamic response) => getJsonField(
        response,
        r'''$[0]''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}
