// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Point _$$_PointFromJson(Map<String, dynamic> json) => _$_Point(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$_PointToJson(_$_Point instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

_$_Address _$$_AddressFromJson(Map<String, dynamic> json) => _$_Address(
      addressName: json['addressName'] as String,
      regionDepth1: json['regionDepth1'] as String,
      regionDepth2: json['regionDepth2'] as String,
      regionDepth3: json['regionDepth3'] as String,
      mainAddressNo: json['mainAddressNo'] as String,
      subAddressNo: json['subAddressNo'] as String,
      buildingName: json['buildingName'] as String,
    );

Map<String, dynamic> _$$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'addressName': instance.addressName,
      'regionDepth1': instance.regionDepth1,
      'regionDepth2': instance.regionDepth2,
      'regionDepth3': instance.regionDepth3,
      'mainAddressNo': instance.mainAddressNo,
      'subAddressNo': instance.subAddressNo,
      'buildingName': instance.buildingName,
    };

_$_Location _$$_LocationFromJson(Map<String, dynamic> json) => _$_Location(
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      point: Point.fromJson(json['point'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LocationToJson(_$_Location instance) =>
    <String, dynamic>{
      'address': instance.address,
      'point': instance.point,
    };
