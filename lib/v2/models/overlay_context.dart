import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taco_driver/v2/models/api_token.dart';
import 'package:taco_driver/v2/models/taxi_call.dart';

part 'overlay_context.freezed.dart';

@freezed
class OverlayContext with _$OverlayContext {
  const factory OverlayContext({
    required ApiToken apiToken,
    required TaxiCallTicket taxiCallTicket,
  }) = _OverlayContext;
}
