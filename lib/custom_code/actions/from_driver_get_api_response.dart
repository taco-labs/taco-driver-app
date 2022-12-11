// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future fromDriverGetApiResponse(dynamic apiResponse) async {
  FFAppState().driverType = apiResponse['driverType'];
  FFAppState().driverFirstName = apiResponse['firstName'];
  FFAppState().driverLastName = apiResponse['lastName'];
  FFAppState().driverBirthday = apiResponse['birthday'];
  FFAppState().driverPhoneNumber = apiResponse['phone'];
  FFAppState().driverGenderCode = apiResponse['gender'];
  FFAppState().driverIsActivated = apiResponse['active'];
  FFAppState().driverIsOnDuty = apiResponse['onDuty'];
  FFAppState().driverLicenseNumber = apiResponse['driverLicenseId'];
  FFAppState().driverCompanyRegistrationNumber =
      apiResponse['companyRegistrationNumber'];
  FFAppState().driverCompanyName = apiResponse['companyName'];
  FFAppState().driverCarNumber = apiResponse['carNumber'];
  FFAppState().driverServiceRegion = apiResponse['serviceRegion'];
  FFAppState().driverLicenseImageUploaded =
      apiResponse['driverLicenseImageUploaded'];
  FFAppState().driverProfileImageUploaded =
      apiResponse['driverProfileImageUploaded'];
  FFAppState().driverProfileImageUploadUrl =
      apiResponse['uploadUrls']['profileImage'];
  FFAppState().driverLicenseImageUploadUrl =
      apiResponse['uploadUrls']['licenseImage'];
  FFAppState().driverProfileImageDownloadUrl =
      apiResponse['downloadUrls']['profileImage'];
  FFAppState().driverLicenseImageDownloadUrl =
      apiResponse['downloadUrls']['licenseImage'];
}
