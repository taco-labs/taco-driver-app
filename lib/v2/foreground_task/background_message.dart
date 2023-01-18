import 'dart:isolate';

import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';

class TaxiCallTicketHandler extends TaskHandler {
  static const MessageKey = "com.tacolabs.driver.taxicallticket";

  Future<void> onStart(DateTime timestamp, SendPort? sendPort) async {
    if (!await FlutterOverlayWindow.isActive()) {
      await FlutterOverlayWindow.showOverlay();
    }
  }

  @override
  Future<void> onEvent(DateTime timestamp, SendPort? sendPort) async {}

  @override
  Future<void> onDestroy(DateTime timestamp, SendPort? sendPort) async {
    // You can use the clearAllData function to clear all the stored data.
    await FlutterForegroundTask.clearAllData();
  }

  @override
  void onButtonPressed(String id) {}
}
