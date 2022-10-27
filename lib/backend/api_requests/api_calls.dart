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
    String? carNumber = '',
    String? companyRegistrationNumber = '',
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
  "companyRegistrationNumber": "${companyRegistrationNumber}"
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
        'Authorization': 'Bearer ${apiToken}',
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
  dynamic aa(dynamic response) => getJsonField(
        response,
        r'''$.driverLicenseId''',
      );
  dynamic bb(dynamic response) => getJsonField(
        response,
        r'''$.companyRegistrationNumber''',
      );
  dynamic cc(dynamic response) => getJsonField(
        response,
        r'''$.carNumber''',
      );
  dynamic dd(dynamic response) => getJsonField(
        response,
        r'''$.uploadUrls''',
      );
  dynamic ee(dynamic response) => getJsonField(
        response,
        r'''$.uploadUrls.profileImage''',
      );
  dynamic ff(dynamic response) => getJsonField(
        response,
        r'''$.uploadUrls.licenseImage''',
      );
  dynamic gg(dynamic response) => getJsonField(
        response,
        r'''$.downloadUrls''',
      );
  dynamic hh(dynamic response) => getJsonField(
        response,
        r'''$.downloadUrls.profileImage''',
      );
  dynamic jj(dynamic response) => getJsonField(
        response,
        r'''$.downloadUrls.licenseImage''',
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
      apiUrl: '${DriverInfoGroup.baseUrl}/${driverId}',
      callType: ApiCallType.PUT,
      headers: {
        ...DriverInfoGroup.headers,
        'Authorization': 'Bearer ${apiToken}',
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
        'Authorization': 'Bearer ${apiToken}',
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
        'Authorization': 'Bearer ${apiToken}',
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
        'Authorization': 'Bearer ${apiToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
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
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Settlement account',
      apiUrl: '${DriverInfoGroup.baseUrl}/${driverId}/settlement_account',
      callType: ApiCallType.GET,
      headers: {
        ...DriverInfoGroup.headers,
        'Authorization': 'Bearer ${apiToken}',
      },
      params: {},
      returnBody: true,
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
        'Authorization': 'Bearer ${apiToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class GetDriverImageUrlsCall {
  Future<ApiCallResponse> call({
    String? driverId = '',
    String? apiToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Driver Image Urls',
      apiUrl: '${DriverInfoGroup.baseUrl}/${driverId}/image_urls',
      callType: ApiCallType.GET,
      headers: {
        ...DriverInfoGroup.headers,
        'Authorization': 'Bearer ${apiToken}',
      },
      params: {},
      returnBody: true,
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

/// End Driver Info Group Code

/// Start Backoffice Group Code

class BackofficeGroup {
  static String baseUrl = 'https://backoffice.dev.api.taco-labs.com/driver';
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

class ForceAcceptTaxiCallRequestCall {
  Future<ApiCallResponse> call({
    String? driverId = '',
    String? taxiCallRequestId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Force Accept Taxi Call Request',
      apiUrl:
          '${BackofficeGroup.baseUrl}/${driverId}/force_accept/${taxiCallRequestId}',
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
        'Authorization': 'Bearer ${apiToken}',
      },
      params: {},
      returnBody: true,
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
  dynamic aa(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic bb(dynamic response) => getJsonField(
        response,
        r'''$.userId''',
      );
  dynamic cc(dynamic response) => getJsonField(
        response,
        r'''$.driverId''',
      );
  dynamic dd(dynamic response) => getJsonField(
        response,
        r'''$.requestMinAdditionalPrice''',
      );
  dynamic ee(dynamic response) => getJsonField(
        response,
        r'''$.createTime''',
      );
  dynamic ff(dynamic response) => getJsonField(
        response,
        r'''$.updateTime''',
      );
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
        'Authorization': 'Bearer ${apiToken}',
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
        'Authorization': 'Bearer ${apiToken}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
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
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Reject Taxi Call Ticket',
      apiUrl: '${TaxiCallGroup.baseUrl}/ticket/${ticketId}',
      callType: ApiCallType.DELETE,
      headers: {
        ...TaxiCallGroup.headers,
        'Authorization': 'Bearer ${apiToken}',
      },
      params: {},
      returnBody: true,
    );
  }
}

class TaxiCallDriverToArrivalCall {
  Future<ApiCallResponse> call({
    String? taxiCallRequestId = '',
    String? apiToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Taxi Call Driver To Arrival',
      apiUrl:
          '${TaxiCallGroup.baseUrl}/taxicall/${taxiCallRequestId}/to_arrival',
      callType: ApiCallType.PUT,
      headers: {
        ...TaxiCallGroup.headers,
        'Authorization': 'Bearer ${apiToken}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class CancelTaxiCallRequestCall {
  Future<ApiCallResponse> call({
    String? taxiCallRequestId = '',
    String? apiToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Cancel Taxi Call Request',
      apiUrl: '${TaxiCallGroup.baseUrl}/taxicall/${taxiCallRequestId}',
      callType: ApiCallType.DELETE,
      headers: {
        ...TaxiCallGroup.headers,
        'Authorization': 'Bearer ${apiToken}',
      },
      params: {},
      returnBody: true,
    );
  }
}

class DoneTaxiCallCall {
  Future<ApiCallResponse> call({
    String? taxiCallRequestId = '',
    int? basePrice,
    String? apiToken = '',
  }) {
    final body = '''
{
  "basePrice": ${basePrice}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Done taxi call',
      apiUrl: '${TaxiCallGroup.baseUrl}/taxicall/${taxiCallRequestId}/done',
      callType: ApiCallType.PUT,
      headers: {
        ...TaxiCallGroup.headers,
        'Authorization': 'Bearer ${apiToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
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
