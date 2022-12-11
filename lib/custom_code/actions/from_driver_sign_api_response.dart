// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future fromDriverSignApiResponse(dynamic apiResponse) async {
  dynamic driverInfo = apiResponse['driver'];

  FFAppState().apiToken = apiResponse['token'];
  FFAppState().driverId = driverInfo['id'];
  FFAppState().driverType = driverInfo['driverType'];
  FFAppState().driverFirstName = driverInfo['firstName'];
  FFAppState().driverLastName = driverInfo['lastName'];
  FFAppState().driverBirthday = driverInfo['birthday'];
  FFAppState().driverPhoneNumber = driverInfo['phone'];
  FFAppState().driverGenderCode = driverInfo['gender'];
  FFAppState().driverIsActivated = driverInfo['active'];
  FFAppState().driverIsOnDuty = driverInfo['onDuty'];
  FFAppState().driverLicenseNumber = driverInfo['driverLicenseId'];
  FFAppState().driverCompanyRegistrationNumber =
      driverInfo['companyRegistrationNumber'];
  FFAppState().driverCompanyName = driverInfo['companyName'];
  FFAppState().driverCarNumber = driverInfo['carNumber'];
  FFAppState().driverServiceRegion = driverInfo['serviceRegion'];
  FFAppState().driverLicenseImageUploaded =
      driverInfo['driverLicenseImageUploaded'];
  FFAppState().driverProfileImageUploaded =
      driverInfo['driverProfileImageUploaded'];
  FFAppState().driverProfileImageUploadUrl =
      driverInfo['uploadUrls']['profileImage'];
  FFAppState().driverLicenseImageUploadUrl =
      driverInfo['uploadUrls']['licenseImage'];
  FFAppState().driverProfileImageDownloadUrl =
      driverInfo['downloadUrls']['profileImage'];
  FFAppState().driverLicenseImageDownloadUrl =
      driverInfo['downloadUrls']['licenseImage'];
}
