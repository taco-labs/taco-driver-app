import 'dart:convert';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Signin  flow Group Code

class SigninFlowGroup {
  static String baseUrl = 'https://';
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
    String? apiEndpointTarget = '',
  }) {
    final body = '''
{
  "stateKey": "${stateKey}",
  "phone": "${phone}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SMS verification request',
      apiUrl:
          '${SigninFlowGroup.baseUrl}driver.${apiEndpointTarget}.api.taco-labs.com/driver/signin/sms/request',
      callType: ApiCallType.POST,
      headers: {
        ...SigninFlowGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }
}

class SMSVerificationAndSigninCall {
  Future<ApiCallResponse> call({
    String? stateKey = '',
    String? verificationCode = '',
    String? apiEndpointTarget = '',
  }) {
    final body = '''
{
  "stateKey": "${stateKey}",
  "verificationCode": "${verificationCode}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SMS Verification and signin',
      apiUrl:
          '${SigninFlowGroup.baseUrl}driver.${apiEndpointTarget}.api.taco-labs.com/driver/signin/sms/verify',
      callType: ApiCallType.POST,
      headers: {
        ...SigninFlowGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
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
  dynamic driverLicenseId(dynamic response) => getJsonField(
        response,
        r'''$.driver.driverLicenseId''',
      );
  dynamic driverBusinessNumber(dynamic response) => getJsonField(
        response,
        r'''$.driver.companyRegistrationNumber''',
      );
  dynamic driverCarNumber(dynamic response) => getJsonField(
        response,
        r'''$.driver.carNumber''',
      );
  dynamic driverUploadUrlInfo(dynamic response) => getJsonField(
        response,
        r'''$.driver.uploadUrls''',
      );
  dynamic driverProfileImageUploadUrl(dynamic response) => getJsonField(
        response,
        r'''$.driver.uploadUrls.profileImage''',
      );
  dynamic driverLicenseImageUploadUrl(dynamic response) => getJsonField(
        response,
        r'''$.driver.uploadUrls.licenseImage''',
      );
  dynamic driverDownloadUrlInfo(dynamic response) => getJsonField(
        response,
        r'''$.driver.downloadUrls''',
      );
  dynamic driverProfileImageDownloadUrl(dynamic response) => getJsonField(
        response,
        r'''$.driver.downloadUrls.profileImage''',
      );
  dynamic driverLicenseImageDownloadUrl(dynamic response) => getJsonField(
        response,
        r'''$.driver.downloadUrls.licenseImage''',
      );
  dynamic isLicenseImageUploaded(dynamic response) => getJsonField(
        response,
        r'''$.driver.driverLicenseImageUploaded''',
      );
  dynamic isProfileImageUploaded(dynamic response) => getJsonField(
        response,
        r'''$.driver.driverProfileImageUploaded''',
      );
  dynamic driverBirthday(dynamic response) => getJsonField(
        response,
        r'''$.driver.birthday''',
      );
  dynamic driverServiceRegion(dynamic response) => getJsonField(
        response,
        r'''$.driver.serviceRegion''',
      );
}

/// End Signin  flow Group Code

/// Start Signup Group Code

class SignupGroup {
  static String baseUrl = 'https://';
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
    String? carNumber = '',
    String? companyRegistrationNumber = '',
    String? serviceRegion = '',
    String? apiEndpointTarget = '',
    String? companyName = '',
  }) {
    final body = '''
{
  "driverType": "${driverType}",
  "firstName": "${firstName}",
  "lastName": "${lastName}",
  "birthday": "${birthday}",
  "gender": "${gender}",
  "phone": "${phone}",
  "appOs": "${appOs}",
  "appVersion": "${appVersion}",
  "appFcmToken": "${appFcmToken}",
  "driverLicenseId": "${driverLicenseId}",
  "smsVerificationStateKey": "${smsVerificationStateKey}",
  "carNumber": "${carNumber}",
  "companyRegistrationNumber": "${companyRegistrationNumber}",
  "serviceRegion": "${serviceRegion}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Signup',
      apiUrl:
          '${SignupGroup.baseUrl}driver.${apiEndpointTarget}.api.taco-labs.com/driver/signup',
      callType: ApiCallType.POST,
      headers: {
        ...SignupGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
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
  dynamic driverBirthday(dynamic response) => getJsonField(
        response,
        r'''$.driver.birthday''',
      );
  dynamic driverLicenseId(dynamic response) => getJsonField(
        response,
        r'''$.driver.driverLicenseId''',
      );
  dynamic driverBusinessRegistrationNumber(dynamic response) => getJsonField(
        response,
        r'''$.driver.companyRegistrationNumber''',
      );
  dynamic driverCarNumber(dynamic response) => getJsonField(
        response,
        r'''$.driver.carNumber''',
      );
  dynamic driverServiceRegion(dynamic response) => getJsonField(
        response,
        r'''$.driver.serviceRegion''',
      );
  dynamic driverIsLicenseImageUploaded(dynamic response) => getJsonField(
        response,
        r'''$.driver.driverLicenseImageUploaded''',
      );
  dynamic driverIsProfileImageUploaded(dynamic response) => getJsonField(
        response,
        r'''$.driver.driverProfileImageUploaded''',
      );
  dynamic driverUploadUrls(dynamic response) => getJsonField(
        response,
        r'''$.driver.uploadUrls''',
      );
  dynamic driverUploadUrlProfile(dynamic response) => getJsonField(
        response,
        r'''$.driver.uploadUrls.profileImage''',
      );
  dynamic driverUploadUrlLicense(dynamic response) => getJsonField(
        response,
        r'''$.driver.uploadUrls.licenseImage''',
      );
  dynamic driverDownloadUrls(dynamic response) => getJsonField(
        response,
        r'''$.driver.downloadUrls''',
      );
  dynamic driverDownloadUrlProfile(dynamic response) => getJsonField(
        response,
        r'''$.driver.downloadUrls.profileImage''',
      );
  dynamic driverDownloadUrlLicense(dynamic response) => getJsonField(
        response,
        r'''$.driver.downloadUrls.licenseImage''',
      );
}

/// End Signup Group Code

/// Start Driver Info Group Code

class DriverInfoGroup {
  static String baseUrl = 'https://';
  static Map<String, String> headers = {};
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
  static GetDriverImageUrlsCall getDriverImageUrlsCall =
      GetDriverImageUrlsCall();
  static GetExpectetedSettlementCall getExpectetedSettlementCall =
      GetExpectetedSettlementCall();
  static ListDriverSettlementHistoryCall listDriverSettlementHistoryCall =
      ListDriverSettlementHistoryCall();
  static RequestDriverSettlementCall requestDriverSettlementCall =
      RequestDriverSettlementCall();
}

class GetDriverCall {
  Future<ApiCallResponse> call({
    String? apiToken = '',
    String? driverId = '',
    String? apiEndpointTarget = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Driver',
      apiUrl:
          '${DriverInfoGroup.baseUrl}driver.${apiEndpointTarget}.api.taco-labs.com/driver/${driverId}',
      callType: ApiCallType.GET,
      headers: {
        ...DriverInfoGroup.headers,
        'Authorization': 'Bearer ${apiToken}',
      },
      params: {},
      returnBody: true,
      cache: false,
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
  dynamic driverLicenseId(dynamic response) => getJsonField(
        response,
        r'''$.driverLicenseId''',
      );
  dynamic businessRegistrationNumber(dynamic response) => getJsonField(
        response,
        r'''$.companyRegistrationNumber''',
      );
  dynamic carNumber(dynamic response) => getJsonField(
        response,
        r'''$.carNumber''',
      );
  dynamic uploadUrls(dynamic response) => getJsonField(
        response,
        r'''$.uploadUrls''',
      );
  dynamic profileImageUploadUrl(dynamic response) => getJsonField(
        response,
        r'''$.uploadUrls.profileImage''',
      );
  dynamic licenseImageUploadUrl(dynamic response) => getJsonField(
        response,
        r'''$.uploadUrls.licenseImage''',
      );
  dynamic downloadUrls(dynamic response) => getJsonField(
        response,
        r'''$.downloadUrls''',
      );
  dynamic profileImageDownloadUrl(dynamic response) => getJsonField(
        response,
        r'''$.downloadUrls.profileImage''',
      );
  dynamic licenseImageDownloadUrl(dynamic response) => getJsonField(
        response,
        r'''$.downloadUrls.licenseImage''',
      );
  dynamic isLicenseImageUploaded(dynamic response) => getJsonField(
        response,
        r'''$.driverLicenseImageUploaded''',
      );
  dynamic isProfileImageUploaded(dynamic response) => getJsonField(
        response,
        r'''$.driverProfileImageUploaded''',
      );
  dynamic birthday(dynamic response) => getJsonField(
        response,
        r'''$.birthday''',
      );
  dynamic serviceRegion(dynamic response) => getJsonField(
        response,
        r'''$.serviceRegion''',
      );
}

class UpdateDriverCall {
  Future<ApiCallResponse> call({
    String? driverId = '',
    String? apiToken = '',
    String? appOs = '',
    String? appVersion = '',
    String? appFcmToken = '',
    bool? profileImageUploaded,
    bool? licenseImageUploaded,
    String? carNumber = '',
    String? apiEndpointTarget = '',
  }) {
    final body = '''
{
  "appOs": "${appOs}",
  "appVersion": "${appVersion}",
  "appFcmToken": "${appFcmToken}",
  "profileImageUploaded": ${profileImageUploaded},
  "licenseImageUploaded": ${licenseImageUploaded},
  "carNumber": "${carNumber}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Driver',
      apiUrl:
          '${DriverInfoGroup.baseUrl}driver.${apiEndpointTarget}.api.taco-labs.com/driver/${driverId}',
      callType: ApiCallType.PUT,
      headers: {
        ...DriverInfoGroup.headers,
        'Authorization': 'Bearer ${apiToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }
}

class UpdateOnDutyCall {
  Future<ApiCallResponse> call({
    String? apiToken = '',
    String? driverId = '',
    bool? onDuty,
    String? apiEndpointTarget = '',
  }) {
    final body = '''
{
  "onDuty": ${onDuty}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update on duty',
      apiUrl:
          '${DriverInfoGroup.baseUrl}driver.${apiEndpointTarget}.api.taco-labs.com/driver/${driverId}/on_duty',
      callType: ApiCallType.PUT,
      headers: {
        ...DriverInfoGroup.headers,
        'Authorization': 'Bearer ${apiToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }
}

class UpdateDriverLocationCall {
  Future<ApiCallResponse> call({
    String? driverId = '',
    String? apiToken = '',
    double? latitude,
    double? longitude,
    String? apiEndpointTarget = '',
  }) {
    final body = '''
{
  "latitude": ${latitude},
  "longitude": ${longitude}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update driver location',
      apiUrl:
          '${DriverInfoGroup.baseUrl}driver.${apiEndpointTarget}.api.taco-labs.com/driver/${driverId}/location',
      callType: ApiCallType.PUT,
      headers: {
        ...DriverInfoGroup.headers,
        'Authorization': 'Bearer ${apiToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }
}

class RegisterSettlementAccountCall {
  Future<ApiCallResponse> call({
    String? driverId = '',
    String? apiToken = '',
    String? bank = '',
    String? accountNumber = '',
    String? apiEndpointTarget = '',
  }) {
    final body = '''
{
  "bank": "${bank}",
  "accountNumber": "${accountNumber}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Register settlement account',
      apiUrl:
          '${DriverInfoGroup.baseUrl}driver.${apiEndpointTarget}.api.taco-labs.com/driver/${driverId}/settlement_account',
      callType: ApiCallType.POST,
      headers: {
        ...DriverInfoGroup.headers,
        'Authorization': 'Bearer ${apiToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }

  dynamic aa(dynamic response) => getJsonField(
        response,
        r'''$.driverId''',
      );
  dynamic bb(dynamic response) => getJsonField(
        response,
        r'''$.bank''',
      );
  dynamic cc(dynamic response) => getJsonField(
        response,
        r'''$.accountNumber''',
      );
  dynamic dd(dynamic response) => getJsonField(
        response,
        r'''$.createTime''',
      );
  dynamic ee(dynamic response) => getJsonField(
        response,
        r'''$.updateTime''',
      );
}

class GetSettlementAccountCall {
  Future<ApiCallResponse> call({
    String? driverId = '',
    String? apiToken = '',
    String? apiEndpointTarget = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Settlement account',
      apiUrl:
          '${DriverInfoGroup.baseUrl}driver.${apiEndpointTarget}.api.taco-labs.com/driver/${driverId}/settlement_account',
      callType: ApiCallType.GET,
      headers: {
        ...DriverInfoGroup.headers,
        'Authorization': 'Bearer ${apiToken}',
      },
      params: {},
      returnBody: true,
      cache: false,
    );
  }

  dynamic driverId(dynamic response) => getJsonField(
        response,
        r'''$.driverId''',
      );
  dynamic bank(dynamic response) => getJsonField(
        response,
        r'''$.bank''',
      );
  dynamic accountNumber(dynamic response) => getJsonField(
        response,
        r'''$.accountNumber''',
      );
  dynamic createTime(dynamic response) => getJsonField(
        response,
        r'''$.createTime''',
      );
  dynamic updateTime(dynamic response) => getJsonField(
        response,
        r'''$.updateTime''',
      );
}

class UpdateDriverSettlementAccountCall {
  Future<ApiCallResponse> call({
    String? driverId = '',
    String? apiToken = '',
    String? bank = '',
    String? accountNumber = '',
    String? apiEndpointTarget = '',
  }) {
    final body = '''
{
  "bank": "${bank}",
  "accountNumber": "${accountNumber}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update driver settlement account',
      apiUrl:
          '${DriverInfoGroup.baseUrl}driver.${apiEndpointTarget}.api.taco-labs.com/driver/${driverId}/settlement_account',
      callType: ApiCallType.PUT,
      headers: {
        ...DriverInfoGroup.headers,
        'Authorization': 'Bearer ${apiToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }

  dynamic driverId(dynamic response) => getJsonField(
        response,
        r'''$.driverId''',
      );
  dynamic bankCode(dynamic response) => getJsonField(
        response,
        r'''$.bank''',
      );
  dynamic accountNumber(dynamic response) => getJsonField(
        response,
        r'''$.accountNumber''',
      );
  dynamic createTime(dynamic response) => getJsonField(
        response,
        r'''$.createTime''',
      );
  dynamic updateTime(dynamic response) => getJsonField(
        response,
        r'''$.updateTime''',
      );
}

class GetDriverImageUrlsCall {
  Future<ApiCallResponse> call({
    String? driverId = '',
    String? apiToken = '',
    String? apiEndpointTarget = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Driver Image Urls',
      apiUrl:
          '${DriverInfoGroup.baseUrl}driver.${apiEndpointTarget}.api.taco-labs.com/driver/${driverId}/image_urls',
      callType: ApiCallType.GET,
      headers: {
        ...DriverInfoGroup.headers,
        'Authorization': 'Bearer ${apiToken}',
      },
      params: {},
      returnBody: true,
      cache: false,
    );
  }

  dynamic uploadUrls(dynamic response) => getJsonField(
        response,
        r'''$.uploadUrls''',
      );
  dynamic uploadProfileImageUrl(dynamic response) => getJsonField(
        response,
        r'''$.uploadUrls.profileImage''',
      );
  dynamic uploadLicenseImageUrl(dynamic response) => getJsonField(
        response,
        r'''$.uploadUrls.licenseImage''',
      );
  dynamic downloadUrls(dynamic response) => getJsonField(
        response,
        r'''$.downloadUrls''',
      );
  dynamic downloadProfileImageUrl(dynamic response) => getJsonField(
        response,
        r'''$.downloadUrls.profileImage''',
      );
  dynamic downloadLicenseImageUrl(dynamic response) => getJsonField(
        response,
        r'''$.downloadUrls.licenseImage''',
      );
}

class GetExpectetedSettlementCall {
  Future<ApiCallResponse> call({
    String? apiToken = '',
    String? driverId = '',
    String? apiEndpointTarget = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Expecteted Settlement',
      apiUrl:
          '${DriverInfoGroup.baseUrl}driver.${apiEndpointTarget}.api.taco-labs.com/driver/${driverId}/expected_settlement',
      callType: ApiCallType.GET,
      headers: {
        ...DriverInfoGroup.headers,
        'Authorization': 'Bearer ${apiToken}',
      },
      params: {},
      returnBody: true,
      cache: false,
    );
  }

  dynamic driverId(dynamic response) => getJsonField(
        response,
        r'''$.driverId''',
      );
  dynamic totalAmount(dynamic response) => getJsonField(
        response,
        r'''$.totalAmount''',
      );
  dynamic requestableAmount(dynamic response) => getJsonField(
        response,
        r'''$.requestableAmount''',
      );
}

class ListDriverSettlementHistoryCall {
  Future<ApiCallResponse> call({
    String? driverId = '',
    String? apiToken = '',
    String? pageToken = '',
    int? count,
    String? apiEndpointTarget = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'List Driver Settlement History',
      apiUrl:
          '${DriverInfoGroup.baseUrl}driver.${apiEndpointTarget}.api.taco-labs.com/driver/${driverId}/settlement',
      callType: ApiCallType.GET,
      headers: {
        ...DriverInfoGroup.headers,
        'Authorization': 'Bearer ${apiToken}',
      },
      params: {
        'pageToken': pageToken,
        'count': count,
      },
      returnBody: true,
      cache: false,
    );
  }

  dynamic histories(dynamic response) => getJsonField(
        response,
        r'''$.histories''',
      );
  dynamic historyDriverId(dynamic response) => getJsonField(
        response,
        r'''$.histories[:].driverId''',
      );
  dynamic historyPeriodStart(dynamic response) => getJsonField(
        response,
        r'''$.histories[:].settlementPeriodStart''',
      );
  dynamic historyPeriodEnd(dynamic response) => getJsonField(
        response,
        r'''$.histories[:].settlementPeriodEnd''',
      );
  dynamic historyCreateTime(dynamic response) => getJsonField(
        response,
        r'''$.histories[:].createTime''',
      );
  dynamic historyAmount(dynamic response) => getJsonField(
        response,
        r'''$.histories[:].amount''',
      );
}

class RequestDriverSettlementCall {
  Future<ApiCallResponse> call({
    String? driverId = '',
    String? apiToken = '',
    String? apiEndpointTarget = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Request Driver Settlement',
      apiUrl:
          '${DriverInfoGroup.baseUrl}driver.${apiEndpointTarget}.api.taco-labs.com/driver/${driverId}/settlement_requeset',
      callType: ApiCallType.POST,
      headers: {
        ...DriverInfoGroup.headers,
        'Authorization': 'Bearer ${apiToken}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }
}

/// End Driver Info Group Code

/// Start Backoffice Dev Group Code

class BackofficeDevGroup {
  static String baseUrl = 'https://';
  static Map<String, String> headers = {
    'Authorization': 'Bearer backoffice_secret_dev',
  };
  static DeleteDriverCall deleteDriverCall = DeleteDriverCall();
  static ActivateDriverCall activateDriverCall = ActivateDriverCall();
  static ForceAcceptTaxiCallRequestCall forceAcceptTaxiCallRequestCall =
      ForceAcceptTaxiCallRequestCall();
}

class DeleteDriverCall {
  Future<ApiCallResponse> call({
    String? driverId = '',
    String? apiEndpointTarget = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete Driver',
      apiUrl:
          '${BackofficeDevGroup.baseUrl}backoffice.${apiEndpointTarget}.api.taco-labs.com/driver/${driverId}',
      callType: ApiCallType.DELETE,
      headers: {
        ...BackofficeDevGroup.headers,
      },
      params: {},
      returnBody: true,
      cache: false,
    );
  }
}

class ActivateDriverCall {
  Future<ApiCallResponse> call({
    String? driverId = '',
    String? apiEndpointTarget = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Activate Driver',
      apiUrl:
          '${BackofficeDevGroup.baseUrl}backoffice.${apiEndpointTarget}.api.taco-labs.com/driver/${driverId}/activate',
      callType: ApiCallType.PUT,
      headers: {
        ...BackofficeDevGroup.headers,
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }
}

class ForceAcceptTaxiCallRequestCall {
  Future<ApiCallResponse> call({
    String? driverId = '',
    String? taxiCallRequestId = '',
    String? apiEndpointTarget = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Force Accept Taxi Call Request',
      apiUrl:
          '${BackofficeDevGroup.baseUrl}backoffice.${apiEndpointTarget}.api.taco-labs.com/driver/${driverId}/force_accept/${taxiCallRequestId}',
      callType: ApiCallType.PUT,
      headers: {
        ...BackofficeDevGroup.headers,
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }
}

/// End Backoffice Dev Group Code

/// Start Backoffice Prod Group Code

class BackofficeProdGroup {
  static String baseUrl = 'https://';
  static Map<String, String> headers = {
    'Authorization': 'Bearer hpS4#QZmt6pHYLmG',
  };
  static DeleteDriverCopyCall deleteDriverCopyCall = DeleteDriverCopyCall();
  static ActivateDriverCopyCall activateDriverCopyCall =
      ActivateDriverCopyCall();
  static ForceAcceptTaxiCallRequestCopyCall forceAcceptTaxiCallRequestCopyCall =
      ForceAcceptTaxiCallRequestCopyCall();
}

class DeleteDriverCopyCall {
  Future<ApiCallResponse> call({
    String? driverId = '',
    String? apiEndpointTarget = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete Driver Copy',
      apiUrl:
          '${BackofficeProdGroup.baseUrl}backoffice.${apiEndpointTarget}.api.taco-labs.com/driver/${driverId}',
      callType: ApiCallType.DELETE,
      headers: {
        ...BackofficeProdGroup.headers,
      },
      params: {},
      returnBody: true,
      cache: false,
    );
  }
}

class ActivateDriverCopyCall {
  Future<ApiCallResponse> call({
    String? driverId = '',
    String? apiEndpointTarget = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Activate Driver Copy',
      apiUrl:
          '${BackofficeProdGroup.baseUrl}backoffice.${apiEndpointTarget}.api.taco-labs.com/driver/${driverId}/activate',
      callType: ApiCallType.PUT,
      headers: {
        ...BackofficeProdGroup.headers,
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }
}

class ForceAcceptTaxiCallRequestCopyCall {
  Future<ApiCallResponse> call({
    String? driverId = '',
    String? taxiCallRequestId = '',
    String? apiEndpointTarget = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Force Accept Taxi Call Request Copy',
      apiUrl:
          '${BackofficeProdGroup.baseUrl}backoffice.${apiEndpointTarget}.api.taco-labs.com/driver/${driverId}/force_accept/${taxiCallRequestId}',
      callType: ApiCallType.PUT,
      headers: {
        ...BackofficeProdGroup.headers,
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }
}

/// End Backoffice Prod Group Code

/// Start Taxi Call Group Code

class TaxiCallGroup {
  static String baseUrl = 'https://';
  static Map<String, String> headers = {};
  static GetLatestTaxiCallCall getLatestTaxiCallCall = GetLatestTaxiCallCall();
  static ListTaxiCallCall listTaxiCallCall = ListTaxiCallCall();
  static AcceptTaxiCallTicketCall acceptTaxiCallTicketCall =
      AcceptTaxiCallTicketCall();
  static RejectTaxiCallTicketCall rejectTaxiCallTicketCall =
      RejectTaxiCallTicketCall();
  static TaxiCallDriverToArrivalCall taxiCallDriverToArrivalCall =
      TaxiCallDriverToArrivalCall();
  static CancelTaxiCallRequestCall cancelTaxiCallRequestCall =
      CancelTaxiCallRequestCall();
  static DoneTaxiCallCall doneTaxiCallCall = DoneTaxiCallCall();
  static GetLatestTaxiCallTicketCall getLatestTaxiCallTicketCall =
      GetLatestTaxiCallTicketCall();
}

class GetLatestTaxiCallCall {
  Future<ApiCallResponse> call({
    String? driverId = '',
    String? apiToken = '',
    String? apiEndpointTarget = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Latest Taxi Call',
      apiUrl:
          '${TaxiCallGroup.baseUrl}driver.${apiEndpointTarget}.api.taco-labs.com/driver/${driverId}/taxicall_latest',
      callType: ApiCallType.GET,
      headers: {
        ...TaxiCallGroup.headers,
        'Authorization': 'Bearer ${apiToken}',
      },
      params: {},
      returnBody: true,
      cache: false,
    );
  }

  dynamic callCurrentState(dynamic response) => getJsonField(
        response,
        r'''$.currentState''',
      );
  dynamic callBasePrice(dynamic response) => getJsonField(
        response,
        r'''$.basePrice''',
      );
  dynamic callExtraPrice(dynamic response) => getJsonField(
        response,
        r'''$.additionalPrice''',
      );
  dynamic callRequestMaxExtraPrice(dynamic response) => getJsonField(
        response,
        r'''$.requestMaxAdditionalPrice''',
      );
  dynamic callRequestBasePrice(dynamic response) => getJsonField(
        response,
        r'''$.requestBasePrice''',
      );
  dynamic arrivalPointLatitude(dynamic response) => getJsonField(
        response,
        r'''$.arrival.point.latitude''',
      );
  dynamic arrivalPointLongitude(dynamic response) => getJsonField(
        response,
        r'''$.arrival.point.longitude''',
      );
  dynamic arrivalAddressName(dynamic response) => getJsonField(
        response,
        r'''$.arrival.address.addressName''',
      );
  dynamic arrivalAddressDepth1(dynamic response) => getJsonField(
        response,
        r'''$.arrival.address.regionDepth1''',
      );
  dynamic arrivalAddressDepth2(dynamic response) => getJsonField(
        response,
        r'''$.arrival.address.regionDepth2''',
      );
  dynamic arrivalAddressDepth3(dynamic response) => getJsonField(
        response,
        r'''$.arrival.address.regionDepth3''',
      );
  dynamic arrivalAddressMainNo(dynamic response) => getJsonField(
        response,
        r'''$.arrival.address.mainAddressNo''',
      );
  dynamic arrivalAddressSubNo(dynamic response) => getJsonField(
        response,
        r'''$.arrival.address.subAddressNo''',
      );
  dynamic distanceInMeters(dynamic response) => getJsonField(
        response,
        r'''$.distance''',
      );
  dynamic etaNanoseconds(dynamic response) => getJsonField(
        response,
        r'''$.eta''',
      );
  dynamic departurePointLatitude(dynamic response) => getJsonField(
        response,
        r'''$.departure.point.latitude''',
      );
  dynamic departurePointLongitude(dynamic response) => getJsonField(
        response,
        r'''$.departure.point.longitude''',
      );
  dynamic departureAddressName(dynamic response) => getJsonField(
        response,
        r'''$.departure.address.addressName''',
      );
  dynamic departureAddressDepth1(dynamic response) => getJsonField(
        response,
        r'''$.departure.address.regionDepth1''',
      );
  dynamic departureAddressDepth2(dynamic response) => getJsonField(
        response,
        r'''$.departure.address.regionDepth2''',
      );
  dynamic departureAddressDepth3(dynamic response) => getJsonField(
        response,
        r'''$.departure.address.regionDepth3''',
      );
  dynamic departureAddressMainNo(dynamic response) => getJsonField(
        response,
        r'''$.departure.address.mainAddressNo''',
      );
  dynamic departureAddressSubNo(dynamic response) => getJsonField(
        response,
        r'''$.departure.address.subAddressNo''',
      );
  dynamic taxiCallRequestId(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic userId(dynamic response) => getJsonField(
        response,
        r'''$.userId''',
      );
  dynamic driverId(dynamic response) => getJsonField(
        response,
        r'''$.driverId''',
      );
  dynamic requestMinAdditionalPrice(dynamic response) => getJsonField(
        response,
        r'''$.requestMinAdditionalPrice''',
      );
  dynamic createTime(dynamic response) => getJsonField(
        response,
        r'''$.createTime''',
      );
  dynamic updateTime(dynamic response) => getJsonField(
        response,
        r'''$.updateTime''',
      );
  dynamic arrivalServiceRegion(dynamic response) => getJsonField(
        response,
        r'''$.arrival.address.serviceRegion''',
      );
  dynamic paymentInfo(dynamic response) => getJsonField(
        response,
        r'''$.payment''',
      );
  dynamic paymentId(dynamic response) => getJsonField(
        response,
        r'''$.payment.paymentId''',
      );
  dynamic paymentCardCompany(dynamic response) => getJsonField(
        response,
        r'''$.payment.company''',
      );
  dynamic paymentCardNumber(dynamic response) => getJsonField(
        response,
        r'''$.payment.cardNumber''',
      );
  dynamic arrivalPointInfo(dynamic response) => getJsonField(
        response,
        r'''$.arrival.point''',
      );
  dynamic dryrun(dynamic response) => getJsonField(
        response,
        r'''$.dryrun''',
      );
  dynamic departureInfo(dynamic response) => getJsonField(
        response,
        r'''$.departure''',
      );
  dynamic departureAddressInfo(dynamic response) => getJsonField(
        response,
        r'''$.departure.address''',
      );
  dynamic departurePointInfo(dynamic response) => getJsonField(
        response,
        r'''$.departure.point''',
      );
  dynamic departureServiceRegion(dynamic response) => getJsonField(
        response,
        r'''$.departure.address.serviceRegion''',
      );
  dynamic arrivalInfo(dynamic response) => getJsonField(
        response,
        r'''$.arrival''',
      );
  dynamic arrivalAddressInfo(dynamic response) => getJsonField(
        response,
        r'''$.arrival.address''',
      );
  dynamic tollFee(dynamic response) => getJsonField(
        response,
        r'''$.tollFee''',
      );
  dynamic paths(dynamic response) => getJsonField(
        response,
        r'''$.path''',
        true,
      );
  dynamic tags(dynamic response) => getJsonField(
        response,
        r'''$.tags''',
        true,
      );
  dynamic userTag(dynamic response) => getJsonField(
        response,
        r'''$.userTag''',
      );
}

class ListTaxiCallCall {
  Future<ApiCallResponse> call({
    String? driverId = '',
    String? apiToken = '',
    int? count,
    String? pageToken = '',
    String? apiEndpointTarget = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'List Taxi Call',
      apiUrl:
          '${TaxiCallGroup.baseUrl}driver.${apiEndpointTarget}.api.taco-labs.com/driver/${driverId}/taxicall',
      callType: ApiCallType.GET,
      headers: {
        ...TaxiCallGroup.headers,
        'Authorization': 'Bearer ${apiToken}',
      },
      params: {
        'pageToken': pageToken,
        'count': count,
      },
      returnBody: true,
      cache: false,
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
  dynamic dryruns(dynamic response) => getJsonField(
        response,
        r'''$.data[:].dryrun''',
        true,
      );
  dynamic distances(dynamic response) => getJsonField(
        response,
        r'''$.data[:].distance''',
        true,
      );
  dynamic etas(dynamic response) => getJsonField(
        response,
        r'''$.data[:].eta''',
        true,
      );
  dynamic paths(dynamic response) => getJsonField(
        response,
        r'''$.data[:].path''',
        true,
      );
  dynamic callRequestIds(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      );
  dynamic userIds(dynamic response) => getJsonField(
        response,
        r'''$.data[:].userId''',
        true,
      );
  dynamic driverIds(dynamic response) => getJsonField(
        response,
        r'''$.data[:].driverId''',
        true,
      );
  dynamic departures(dynamic response) => getJsonField(
        response,
        r'''$.data[:].departure''',
        true,
      );
  dynamic aa(dynamic response) => getJsonField(
        response,
        r'''$.data[:].departure.address''',
        true,
      );
  dynamic bb(dynamic response) => getJsonField(
        response,
        r'''$.data[:].departure.address.addressName''',
        true,
      );
  dynamic cc(dynamic response) => getJsonField(
        response,
        r'''$.data[:].departure.address.regionDepth1''',
        true,
      );
  dynamic dd(dynamic response) => getJsonField(
        response,
        r'''$.data[:].departure.address.regionDepth2''',
        true,
      );
  dynamic ee(dynamic response) => getJsonField(
        response,
        r'''$.data[:].departure.address.regionDepth3''',
        true,
      );
  dynamic ff(dynamic response) => getJsonField(
        response,
        r'''$.data[:].departure.address.mainAddressNo''',
        true,
      );
  dynamic gg(dynamic response) => getJsonField(
        response,
        r'''$.data[:].departure.address.serviceRegion''',
        true,
      );
  dynamic hh(dynamic response) => getJsonField(
        response,
        r'''$.data[:].departure.point''',
        true,
      );
  dynamic ii(dynamic response) => getJsonField(
        response,
        r'''$.data[:].departure.point.latitude''',
        true,
      );
  dynamic jj(dynamic response) => getJsonField(
        response,
        r'''$.data[:].departure.point.longitude''',
        true,
      );
  dynamic aa1(dynamic response) => getJsonField(
        response,
        r'''$.data[:].arrival''',
        true,
      );
  dynamic aa2(dynamic response) => getJsonField(
        response,
        r'''$.data[:].arrival.address''',
        true,
      );
  dynamic aa3(dynamic response) => getJsonField(
        response,
        r'''$.data[:].arrival.address.addressName''',
        true,
      );
  dynamic aa4(dynamic response) => getJsonField(
        response,
        r'''$.data[:].arrival.address.regionDepth1''',
        true,
      );
  dynamic aa5(dynamic response) => getJsonField(
        response,
        r'''$.data[:].arrival.address.regionDepth2''',
        true,
      );
  dynamic aa6(dynamic response) => getJsonField(
        response,
        r'''$.data[:].arrival.address.regionDepth3''',
        true,
      );
  dynamic aa7(dynamic response) => getJsonField(
        response,
        r'''$.data[:].arrival.address.mainAddressNo''',
        true,
      );
  dynamic aa8(dynamic response) => getJsonField(
        response,
        r'''$.data[:].arrival.address.subAddressNo''',
        true,
      );
  dynamic aa9(dynamic response) => getJsonField(
        response,
        r'''$.data[:].arrival.address.serviceRegion''',
        true,
      );
  dynamic aa112(dynamic response) => getJsonField(
        response,
        r'''$.data[:].arrival.point''',
        true,
      );
  dynamic aa23(dynamic response) => getJsonField(
        response,
        r'''$.data[:].arrival.point.latitude''',
        true,
      );
  dynamic bb1(dynamic response) => getJsonField(
        response,
        r'''$.data[:].arrival.point.longitude''',
        true,
      );
  dynamic bb2(dynamic response) => getJsonField(
        response,
        r'''$.data[:].tags''',
        true,
      );
  dynamic bb3(dynamic response) => getJsonField(
        response,
        r'''$.data[:].payment''',
        true,
      );
  dynamic bb4(dynamic response) => getJsonField(
        response,
        r'''$.data[:].payment.paymentId''',
        true,
      );
  dynamic bb6(dynamic response) => getJsonField(
        response,
        r'''$.data[:].payment.company''',
        true,
      );
  dynamic cc1(dynamic response) => getJsonField(
        response,
        r'''$.data[:].payment.cardNumber''',
        true,
      );
  dynamic cc2(dynamic response) => getJsonField(
        response,
        r'''$.data[:].requestBasePrice''',
        true,
      );
  dynamic cc4(dynamic response) => getJsonField(
        response,
        r'''$.data[:].requestMinAdditionalPrice''',
        true,
      );
  dynamic cc5(dynamic response) => getJsonField(
        response,
        r'''$.data[:].requestMaxAdditionalPrice''',
        true,
      );
  dynamic cc6(dynamic response) => getJsonField(
        response,
        r'''$.data[:].basePrice''',
        true,
      );
  dynamic dd1(dynamic response) => getJsonField(
        response,
        r'''$.data[:].tollFee''',
        true,
      );
  dynamic dd2(dynamic response) => getJsonField(
        response,
        r'''$.data[:].additionalPrice''',
        true,
      );
  dynamic dd3(dynamic response) => getJsonField(
        response,
        r'''$.data[:].currentState''',
        true,
      );
  dynamic dd5(dynamic response) => getJsonField(
        response,
        r'''$.data[:].createTime''',
        true,
      );
  dynamic dd6(dynamic response) => getJsonField(
        response,
        r'''$.data[:].updateTime''',
        true,
      );
}

class AcceptTaxiCallTicketCall {
  Future<ApiCallResponse> call({
    String? ticketId = '',
    String? apiToken = '',
    String? apiEndpointTarget = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Accept Taxi Call Ticket',
      apiUrl:
          '${TaxiCallGroup.baseUrl}driver.${apiEndpointTarget}.api.taco-labs.com/taxicall/ticket/${ticketId}',
      callType: ApiCallType.PUT,
      headers: {
        ...TaxiCallGroup.headers,
        'Authorization': 'Bearer ${apiToken}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }

  dynamic callCurrentState(dynamic response) => getJsonField(
        response,
        r'''$.currentState''',
      );
}

class RejectTaxiCallTicketCall {
  Future<ApiCallResponse> call({
    String? ticketId = '',
    String? apiToken = '',
    String? apiEndpointTarget = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Reject Taxi Call Ticket',
      apiUrl:
          '${TaxiCallGroup.baseUrl}driver.${apiEndpointTarget}.api.taco-labs.com/taxicall/ticket/${ticketId}',
      callType: ApiCallType.DELETE,
      headers: {
        ...TaxiCallGroup.headers,
        'Authorization': 'Bearer ${apiToken}',
      },
      params: {},
      returnBody: true,
      cache: false,
    );
  }
}

class TaxiCallDriverToArrivalCall {
  Future<ApiCallResponse> call({
    String? taxiCallRequestId = '',
    String? apiToken = '',
    String? apiEndpointTarget = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Taxi Call Driver To Arrival',
      apiUrl:
          '${TaxiCallGroup.baseUrl}driver.${apiEndpointTarget}.api.taco-labs.com/taxicall/${taxiCallRequestId}/to_arrival',
      callType: ApiCallType.PUT,
      headers: {
        ...TaxiCallGroup.headers,
        'Authorization': 'Bearer ${apiToken}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }
}

class CancelTaxiCallRequestCall {
  Future<ApiCallResponse> call({
    String? taxiCallRequestId = '',
    String? apiToken = '',
    String? apiEndpointTarget = '',
    bool? confirmCancel,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Cancel Taxi Call Request',
      apiUrl:
          '${TaxiCallGroup.baseUrl}driver.${apiEndpointTarget}.api.taco-labs.com/taxicall/${taxiCallRequestId}',
      callType: ApiCallType.DELETE,
      headers: {
        ...TaxiCallGroup.headers,
        'Authorization': 'Bearer ${apiToken}',
      },
      params: {
        'confirmCancel': confirmCancel,
      },
      returnBody: true,
      cache: false,
    );
  }
}

class DoneTaxiCallCall {
  Future<ApiCallResponse> call({
    String? taxiCallRequestId = '',
    int? basePrice,
    String? apiToken = '',
    int? tollFee,
    String? apiEndpointTarget = '',
  }) {
    final body = '''
{
  "basePrice": ${basePrice},
  "tollFee": ${tollFee}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Done taxi call',
      apiUrl:
          '${TaxiCallGroup.baseUrl}driver.${apiEndpointTarget}.api.taco-labs.com/taxicall/${taxiCallRequestId}/done',
      callType: ApiCallType.PUT,
      headers: {
        ...TaxiCallGroup.headers,
        'Authorization': 'Bearer ${apiToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }
}

class GetLatestTaxiCallTicketCall {
  Future<ApiCallResponse> call({
    String? driverId = '',
    String? apiEndpointTarget = '',
    String? apiToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Latest  Taxi Call Ticket',
      apiUrl:
          '${TaxiCallGroup.baseUrl}driver.${apiEndpointTarget}.api.taco-labs.com/driver/${driverId}/ticket_latest',
      callType: ApiCallType.GET,
      headers: {
        ...TaxiCallGroup.headers,
        'Authorization': 'Bearer ${apiToken}',
      },
      params: {},
      returnBody: true,
      cache: false,
    );
  }

  dynamic callRequestId(dynamic response) => getJsonField(
        response,
        r'''$.taxiCallRequestId''',
      );
  dynamic callState(dynamic response) => getJsonField(
        response,
        r'''$.taxiCallState''',
      );
  dynamic callTicketId(dynamic response) => getJsonField(
        response,
        r'''$.taxiCallTicketId''',
      );
  dynamic callTicketAttempt(dynamic response) => getJsonField(
        response,
        r'''$.ticketAttempt''',
      );
  dynamic callBasePrice(dynamic response) => getJsonField(
        response,
        r'''$.requestBasePrice''',
      );
  dynamic callAdditionalPrice(dynamic response) => getJsonField(
        response,
        r'''$.additionalPrice''',
      );
  dynamic toDepartureInfo(dynamic response) => getJsonField(
        response,
        r'''$.toDeparture''',
      );
  dynamic toDepartureEta(dynamic response) => getJsonField(
        response,
        r'''$.toDeparture.eta''',
      );
  dynamic toDepartureBasePrice(dynamic response) => getJsonField(
        response,
        r'''$.toDeparture.price''',
      );
  dynamic toDepartureDistance(dynamic response) => getJsonField(
        response,
        r'''$.toDeparture.distance''',
      );
  dynamic toDeparturePathInfo(dynamic response) => getJsonField(
        response,
        r'''$.toDeparture.path''',
        true,
      );
  dynamic toDepartureLatitudes(dynamic response) => getJsonField(
        response,
        r'''$.toDeparture.path[:].latitude''',
        true,
      );
  dynamic toDepartureLongitudes(dynamic response) => getJsonField(
        response,
        r'''$.toDeparture.path[:].longitude''',
        true,
      );
  dynamic toArrivalInfo(dynamic response) => getJsonField(
        response,
        r'''$.toArrival''',
      );
  dynamic toArrivalEta(dynamic response) => getJsonField(
        response,
        r'''$.toArrival.eta''',
      );
  dynamic toArrivalBasePrice(dynamic response) => getJsonField(
        response,
        r'''$.toArrival.price''',
      );
  dynamic toArrivalDistance(dynamic response) => getJsonField(
        response,
        r'''$.toArrival.distance''',
      );
  dynamic toArrivalPathInfo(dynamic response) => getJsonField(
        response,
        r'''$.toArrival.path''',
        true,
      );
  dynamic toArrivalLatitudes(dynamic response) => getJsonField(
        response,
        r'''$.toArrival.path[:].latitude''',
        true,
      );
  dynamic toArrivalLongitudes(dynamic response) => getJsonField(
        response,
        r'''$.toArrival.path[:].longitude''',
        true,
      );
  dynamic tags(dynamic response) => getJsonField(
        response,
        r'''$.tags''',
        true,
      );
  dynamic updateTime(dynamic response) => getJsonField(
        response,
        r'''$.updateTime''',
      );
  dynamic userTag(dynamic response) => getJsonField(
        response,
        r'''$.userTag''',
      );
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
      cache: false,
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
