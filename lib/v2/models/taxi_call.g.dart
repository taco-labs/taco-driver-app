// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taxi_call.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DriverLatestTaxiCallResponse _$$_DriverLatestTaxiCallResponseFromJson(
        Map<String, dynamic> json) =>
    _$_DriverLatestTaxiCallResponse(
      toDepartureDistance: json['toDepartureDistance'] as int,
      toDepartureEta: json['toDepartureEta'] as int,
      toDeparturePath: (json['toDeparturePath'] as List<dynamic>)
          .map((e) => Point.fromJson(e as Map<String, dynamic>))
          .toList(),
      toArrivalDistance: json['toArrivalDistance'] as int,
      toArrivalEta: json['toArrivalEta'] as int,
      toArrivalPath: (json['toArrivalPath'] as List<dynamic>)
          .map((e) => Point.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String,
      userId: json['userId'] as String,
      driverId: json['driverId'] as String,
      departure: Location.fromJson(json['departure'] as Map<String, dynamic>),
      arrival: Location.fromJson(json['arrival'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      userTag: json['userTag'] as String,
      requestBasePrice: json['requestBasePrice'] as int,
      requestMinAdditionalPrice: json['requestMinAdditionalPrice'] as int,
      requestMaxAdditionalPrice: json['requestMaxAdditionalPrice'] as int,
      basePrice: json['basePrice'] as int,
      cancelPenaltyPrice: json['cancelPenaltyPrice'] as int,
      tollFee: json['tollFee'] as int,
      additionalPrice: json['additionalPrice'] as int,
      currentState: json['currentState'] as String,
      createTime: DateTime.parse(json['createTime'] as String),
      updateTime: DateTime.parse(json['updateTime'] as String),
      userPhone: json['userPhone'] as String,
    );

Map<String, dynamic> _$$_DriverLatestTaxiCallResponseToJson(
        _$_DriverLatestTaxiCallResponse instance) =>
    <String, dynamic>{
      'toDepartureDistance': instance.toDepartureDistance,
      'toDepartureEta': instance.toDepartureEta,
      'toDeparturePath': instance.toDeparturePath,
      'toArrivalDistance': instance.toArrivalDistance,
      'toArrivalEta': instance.toArrivalEta,
      'toArrivalPath': instance.toArrivalPath,
      'id': instance.id,
      'userId': instance.userId,
      'driverId': instance.driverId,
      'departure': instance.departure,
      'arrival': instance.arrival,
      'tags': instance.tags,
      'userTag': instance.userTag,
      'requestBasePrice': instance.requestBasePrice,
      'requestMinAdditionalPrice': instance.requestMinAdditionalPrice,
      'requestMaxAdditionalPrice': instance.requestMaxAdditionalPrice,
      'basePrice': instance.basePrice,
      'cancelPenaltyPrice': instance.cancelPenaltyPrice,
      'tollFee': instance.tollFee,
      'additionalPrice': instance.additionalPrice,
      'currentState': instance.currentState,
      'createTime': instance.createTime.toIso8601String(),
      'updateTime': instance.updateTime.toIso8601String(),
      'userPhone': instance.userPhone,
    };

_$_TaxiCallTicket _$$_TaxiCallTicketFromJson(Map<String, dynamic> json) =>
    _$_TaxiCallTicket(
      taxiCallRequestId: json['taxiCallRequestId'] as String,
      ticketId: json['ticketId'] as String,
      attempt: json['attempt'] as int,
      tags: json['tags'] as String,
      userTag: json['userTag'] as String,
      toDepartureDistance: json['toDepartureDistance'] as int,
      toArrivalDistance: json['toArrivalDistance'] as int,
      toArrivalETA: json['toArrivalETA'] as int,
      additionalPrice: json['additionalPrice'] as int,
      departureAddressRegionDepth2:
          json['departureAddressRegionDepth2'] as String,
      departureAddressRegionDepth3:
          json['departureAddressRegionDepth3'] as String,
      departureName: json['departureName'] as String,
      arrivalAddressRegionDepth2: json['arrivalAddressRegionDepth2'] as String,
      arrivalAddressRegionDepth3: json['arrivalAddressRegionDepth3'] as String,
      arrivalName: json['arrivalName'] as String,
      updateTime: DateTime.parse(json['updateTime'] as String),
    );

Map<String, dynamic> _$$_TaxiCallTicketToJson(_$_TaxiCallTicket instance) =>
    <String, dynamic>{
      'taxiCallRequestId': instance.taxiCallRequestId,
      'ticketId': instance.ticketId,
      'attempt': instance.attempt,
      'tags': instance.tags,
      'userTag': instance.userTag,
      'toDepartureDistance': instance.toDepartureDistance,
      'toArrivalDistance': instance.toArrivalDistance,
      'toArrivalETA': instance.toArrivalETA,
      'additionalPrice': instance.additionalPrice,
      'departureAddressRegionDepth2': instance.departureAddressRegionDepth2,
      'departureAddressRegionDepth3': instance.departureAddressRegionDepth3,
      'departureName': instance.departureName,
      'arrivalAddressRegionDepth2': instance.arrivalAddressRegionDepth2,
      'arrivalAddressRegionDepth3': instance.arrivalAddressRegionDepth3,
      'arrivalName': instance.arrivalName,
      'updateTime': instance.updateTime.toIso8601String(),
    };
