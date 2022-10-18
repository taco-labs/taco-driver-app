// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:workmanager/workmanager.dart';

Future registerSyncLocationTask() async {
  Workmanager().registerOneOffTask(
    "1",
    "syncLocationTask",
    initialDelay: const Duration(seconds: 10),
    existingWorkPolicy: ExistingWorkPolicy.append,
  );
}
