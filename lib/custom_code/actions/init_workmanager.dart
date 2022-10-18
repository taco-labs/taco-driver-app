// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:workmanager/workmanager.dart';

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    switch (task) {
      case 'syncLocationTask':
        debugPrint("syncLocationTask was executed");
        Workmanager().registerOneOffTask(
          "1",
          "syncLocationTask",
          initialDelay: const Duration(seconds: 10),
          existingWorkPolicy: ExistingWorkPolicy.append,
        );
        break;
    }
    return Future.value(true);
  });
}

Future initWorkmanager() async {
  Workmanager().initialize(
      callbackDispatcher, // The top level function, aka callbackDispatcher
      isInDebugMode:
          true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
      );
}
