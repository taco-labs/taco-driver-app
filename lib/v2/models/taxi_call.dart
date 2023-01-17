import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taco_driver/v2/models/address.dart';

part 'taxi_call.freezed.dart';

part 'taxi_call.g.dart';

@freezed
class DriverLatestTaxiCallResponse with _$DriverLatestTaxiCallResponse {
  const factory DriverLatestTaxiCallResponse({
    required int toDepartureDistance,
    required int toDepartureEta,
    required List<Point> toDeparturePath,
    required int toArrivalDistance,
    required int toArrivalEta,
    required List<Point> toArrivalPath,
    required String id,
    required String userId,
    required String driverId,
    required Location departure,
    required Location arrival,
    required List<String> tags,
    required String userTag,
    required int requestBasePrice,
    required int requestMinAdditionalPrice,
    required int requestMaxAdditionalPrice,
    required int basePrice,
    required int cancelPenaltyPrice,
    required int tollFee,
    required int additionalPrice,
    required String currentState,
    required DateTime createTime,
    required DateTime updateTime,
    required String userPhone,
  }) = _DriverLatestTaxiCallResponse;

  factory DriverLatestTaxiCallResponse.fromJson(Map<String, Object?> json) =>
      _$DriverLatestTaxiCallResponseFromJson(json);
}

@freezed
class TaxiCallTicket with _$TaxiCallTicket {
  const TaxiCallTicket._();

  const factory TaxiCallTicket({
    required String taxiCallRequestId,
    required String ticketId,
    required int attempt,
    required String tags,
    required String userTag,
    required int toDepartureDistance,
    required int toArrivalDistance,
    required int toArrivalETA,
    required int additionalPrice,
    required String departureAddressRegionDepth2,
    required String departureAddressRegionDepth3,
    required String departureName,
    required String arrivalAddressRegionDepth2,
    required String arrivalAddressRegionDepth3,
    required String arrivalName,
    required DateTime updateTime,
  }) = _TaxiCallTicket;

  DateTime expireTime() {
    return updateTime.add(Duration(seconds: 10 * (4 - attempt)));
  }

  factory TaxiCallTicket.fromJson(Map<String, Object?> json) =>
      _$TaxiCallTicketFromJson(json);
}
