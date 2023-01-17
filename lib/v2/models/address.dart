import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';

part 'address.g.dart';

@freezed
class Point with _$Point {
  const factory Point({
    required double latitude,
    required double longitude,
  }) = _Point;

  factory Point.fromJson(Map<String, Object?> json) => _$PointFromJson(json);
}

@freezed
class Address with _$Address {
  const factory Address({
    required String addressName,
    required String regionDepth1,
    required String regionDepth2,
    required String regionDepth3,
    required String mainAddressNo,
    required String subAddressNo,
    required String buildingName,
  }) = _Address;

  factory Address.fromJson(Map<String, Object?> json) =>
      _$AddressFromJson(json);
}

@freezed
class Location with _$Location {
  const factory Location({
    required Address address,
    required Point point,
  }) = _Location;

  factory Location.fromJson(Map<String, Object?> json) =>
      _$LocationFromJson(json);
}
