import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:taco_driver/v2/models/api_token.dart';
import 'package:taco_driver/v2/models/taxi_call.dart';
import 'package:riverpod/riverpod.dart';

final flutterOverlayListenerProvider = Provider((ref) {
  return FlutterOverlayWindow.overlayListener.asBroadcastStream();
});

final overlayApiTokenStreamProvider = StreamProvider<ApiToken>((ref) {
  final overlayStream = ref.watch(flutterOverlayListenerProvider);
  return overlayStream.where((event) {
    try {
      ApiToken.fromJson(event);
      return true;
    } catch (e) {
      return false;
    }
  }).asyncMap((event) => ApiToken.fromJson(event));
});

final overlayTaxiCallStreamProvider = StreamProvider<TaxiCallTicket>((ref) {
  final overlayStream = ref.watch(flutterOverlayListenerProvider);
  return overlayStream.where((event) {
    try {
      TaxiCallTicket.fromJson(event);
      return true;
    } catch (e) {
      return false;
    }
  }).asyncMap((event) => TaxiCallTicket.fromJson(event));
});
