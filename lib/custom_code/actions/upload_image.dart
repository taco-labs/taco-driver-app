// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import 'package:mime_type/mime_type.dart';

Future<bool> uploadImage(String uploadUrl, dynamic uploadedLocalFile) async {
  bool succeeded = false;
  FFLocalFile? file = uploadedLocalFile;

  if (file == null || file.bytes == null) {
    debugPrint("uploadImage action: requested file bytes is null");
    return succeeded;
  }

  http.Response response = await http.put(
    Uri.parse(uploadUrl),
    body: file.bytes!,
    headers: {
      "Content-Type": "image/${mime(file.name)}",
      "Content-Length": "${file.bytes!.length}"
    },
  );

  if (response.statusCode == 200) {
    succeeded = true;
  } else {
    debugPrint(
        "error code ${response.statusCode} body ${response.body.toString()}");
  }

  return succeeded;
}
