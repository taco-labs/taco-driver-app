// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';

Future<bool> uploadImage(String uploadUrl, dynamic uploadedLocalFile) async {
  bool succeeded = false;
  FilePickerResult? result = await FilePicker.platform.pickFiles();
  if (result != null) {
    PlatformFile file = result.files.first;
    File f = File(file.path!);

    http.Response response = await http.put(
      Uri.parse(uploadUrl),
      body: f.readAsBytesSync(),
      headers: {
        "Content-Type": "image/${file.extension}",
        "Content-Length": "${file.size}"
      },
    );

    if (response.statusCode == 200) {
      succeeded = true;
    } else {
      debugPrint(
          "error code ${response.statusCode} body ${response.body.toString()}");
    }
  }

  return succeeded;
}
