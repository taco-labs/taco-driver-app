import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Signin  flow Group Code

class SigninFlowGroup {
  static String baseUrl =
      'http://alb-taco-dev-851043754.ap-northeast-2.elb.amazonaws.com:18882/driver/signin';
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
}

/// End Signin  flow Group Code

/// Start Signin Group Code

class SigninGroup {
  static String baseUrl =
      'http://alb-taco-dev-851043754.ap-northeast-2.elb.amazonaws.com:18882/driver';
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
      apiUrl: '${SigninGroup.baseUrl}/signup',
      callType: ApiCallType.POST,
      headers: {
        ...SigninGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

/// End Signin Group Code

/// Start Driver Info Group Code

class DriverInfoGroup {
  static String baseUrl =
      'http://alb-taco-dev-851043754.ap-northeast-2.elb.amazonaws.com:18882/driver';
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
  static String baseUrl =
      'http://alb-taco-dev-851043754.ap-northeast-2.elb.amazonaws.com:18883/driver';
  static Map<String, String> headers = {
    'Authorization': 'Bearer backoffice_secret_dev',
  };
  static DeleteDriverCall deleteDriverCall = DeleteDriverCall();
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

/// End Backoffice Group Code

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
