// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Point _$PointFromJson(Map<String, dynamic> json) {
  return _Point.fromJson(json);
}

/// @nodoc
mixin _$Point {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PointCopyWith<Point> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointCopyWith<$Res> {
  factory $PointCopyWith(Point value, $Res Function(Point) then) =
      _$PointCopyWithImpl<$Res, Point>;
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class _$PointCopyWithImpl<$Res, $Val extends Point>
    implements $PointCopyWith<$Res> {
  _$PointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PointCopyWith<$Res> implements $PointCopyWith<$Res> {
  factory _$$_PointCopyWith(_$_Point value, $Res Function(_$_Point) then) =
      __$$_PointCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$$_PointCopyWithImpl<$Res> extends _$PointCopyWithImpl<$Res, _$_Point>
    implements _$$_PointCopyWith<$Res> {
  __$$_PointCopyWithImpl(_$_Point _value, $Res Function(_$_Point) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$_Point(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Point with DiagnosticableTreeMixin implements _Point {
  const _$_Point({required this.latitude, required this.longitude});

  factory _$_Point.fromJson(Map<String, dynamic> json) =>
      _$$_PointFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Point(latitude: $latitude, longitude: $longitude)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Point'))
      ..add(DiagnosticsProperty('latitude', latitude))
      ..add(DiagnosticsProperty('longitude', longitude));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Point &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PointCopyWith<_$_Point> get copyWith =>
      __$$_PointCopyWithImpl<_$_Point>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PointToJson(
      this,
    );
  }
}

abstract class _Point implements Point {
  const factory _Point(
      {required final double latitude,
      required final double longitude}) = _$_Point;

  factory _Point.fromJson(Map<String, dynamic> json) = _$_Point.fromJson;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(ignore: true)
  _$$_PointCopyWith<_$_Point> get copyWith =>
      throw _privateConstructorUsedError;
}

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
mixin _$Address {
  String get addressName => throw _privateConstructorUsedError;
  String get regionDepth1 => throw _privateConstructorUsedError;
  String get regionDepth2 => throw _privateConstructorUsedError;
  String get regionDepth3 => throw _privateConstructorUsedError;
  String get mainAddressNo => throw _privateConstructorUsedError;
  String get subAddressNo => throw _privateConstructorUsedError;
  String get buildingName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res, Address>;
  @useResult
  $Res call(
      {String addressName,
      String regionDepth1,
      String regionDepth2,
      String regionDepth3,
      String mainAddressNo,
      String subAddressNo,
      String buildingName});
}

/// @nodoc
class _$AddressCopyWithImpl<$Res, $Val extends Address>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressName = null,
    Object? regionDepth1 = null,
    Object? regionDepth2 = null,
    Object? regionDepth3 = null,
    Object? mainAddressNo = null,
    Object? subAddressNo = null,
    Object? buildingName = null,
  }) {
    return _then(_value.copyWith(
      addressName: null == addressName
          ? _value.addressName
          : addressName // ignore: cast_nullable_to_non_nullable
              as String,
      regionDepth1: null == regionDepth1
          ? _value.regionDepth1
          : regionDepth1 // ignore: cast_nullable_to_non_nullable
              as String,
      regionDepth2: null == regionDepth2
          ? _value.regionDepth2
          : regionDepth2 // ignore: cast_nullable_to_non_nullable
              as String,
      regionDepth3: null == regionDepth3
          ? _value.regionDepth3
          : regionDepth3 // ignore: cast_nullable_to_non_nullable
              as String,
      mainAddressNo: null == mainAddressNo
          ? _value.mainAddressNo
          : mainAddressNo // ignore: cast_nullable_to_non_nullable
              as String,
      subAddressNo: null == subAddressNo
          ? _value.subAddressNo
          : subAddressNo // ignore: cast_nullable_to_non_nullable
              as String,
      buildingName: null == buildingName
          ? _value.buildingName
          : buildingName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddressCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$_AddressCopyWith(
          _$_Address value, $Res Function(_$_Address) then) =
      __$$_AddressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String addressName,
      String regionDepth1,
      String regionDepth2,
      String regionDepth3,
      String mainAddressNo,
      String subAddressNo,
      String buildingName});
}

/// @nodoc
class __$$_AddressCopyWithImpl<$Res>
    extends _$AddressCopyWithImpl<$Res, _$_Address>
    implements _$$_AddressCopyWith<$Res> {
  __$$_AddressCopyWithImpl(_$_Address _value, $Res Function(_$_Address) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressName = null,
    Object? regionDepth1 = null,
    Object? regionDepth2 = null,
    Object? regionDepth3 = null,
    Object? mainAddressNo = null,
    Object? subAddressNo = null,
    Object? buildingName = null,
  }) {
    return _then(_$_Address(
      addressName: null == addressName
          ? _value.addressName
          : addressName // ignore: cast_nullable_to_non_nullable
              as String,
      regionDepth1: null == regionDepth1
          ? _value.regionDepth1
          : regionDepth1 // ignore: cast_nullable_to_non_nullable
              as String,
      regionDepth2: null == regionDepth2
          ? _value.regionDepth2
          : regionDepth2 // ignore: cast_nullable_to_non_nullable
              as String,
      regionDepth3: null == regionDepth3
          ? _value.regionDepth3
          : regionDepth3 // ignore: cast_nullable_to_non_nullable
              as String,
      mainAddressNo: null == mainAddressNo
          ? _value.mainAddressNo
          : mainAddressNo // ignore: cast_nullable_to_non_nullable
              as String,
      subAddressNo: null == subAddressNo
          ? _value.subAddressNo
          : subAddressNo // ignore: cast_nullable_to_non_nullable
              as String,
      buildingName: null == buildingName
          ? _value.buildingName
          : buildingName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Address with DiagnosticableTreeMixin implements _Address {
  const _$_Address(
      {required this.addressName,
      required this.regionDepth1,
      required this.regionDepth2,
      required this.regionDepth3,
      required this.mainAddressNo,
      required this.subAddressNo,
      required this.buildingName});

  factory _$_Address.fromJson(Map<String, dynamic> json) =>
      _$$_AddressFromJson(json);

  @override
  final String addressName;
  @override
  final String regionDepth1;
  @override
  final String regionDepth2;
  @override
  final String regionDepth3;
  @override
  final String mainAddressNo;
  @override
  final String subAddressNo;
  @override
  final String buildingName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Address(addressName: $addressName, regionDepth1: $regionDepth1, regionDepth2: $regionDepth2, regionDepth3: $regionDepth3, mainAddressNo: $mainAddressNo, subAddressNo: $subAddressNo, buildingName: $buildingName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Address'))
      ..add(DiagnosticsProperty('addressName', addressName))
      ..add(DiagnosticsProperty('regionDepth1', regionDepth1))
      ..add(DiagnosticsProperty('regionDepth2', regionDepth2))
      ..add(DiagnosticsProperty('regionDepth3', regionDepth3))
      ..add(DiagnosticsProperty('mainAddressNo', mainAddressNo))
      ..add(DiagnosticsProperty('subAddressNo', subAddressNo))
      ..add(DiagnosticsProperty('buildingName', buildingName));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Address &&
            (identical(other.addressName, addressName) ||
                other.addressName == addressName) &&
            (identical(other.regionDepth1, regionDepth1) ||
                other.regionDepth1 == regionDepth1) &&
            (identical(other.regionDepth2, regionDepth2) ||
                other.regionDepth2 == regionDepth2) &&
            (identical(other.regionDepth3, regionDepth3) ||
                other.regionDepth3 == regionDepth3) &&
            (identical(other.mainAddressNo, mainAddressNo) ||
                other.mainAddressNo == mainAddressNo) &&
            (identical(other.subAddressNo, subAddressNo) ||
                other.subAddressNo == subAddressNo) &&
            (identical(other.buildingName, buildingName) ||
                other.buildingName == buildingName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, addressName, regionDepth1,
      regionDepth2, regionDepth3, mainAddressNo, subAddressNo, buildingName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddressCopyWith<_$_Address> get copyWith =>
      __$$_AddressCopyWithImpl<_$_Address>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddressToJson(
      this,
    );
  }
}

abstract class _Address implements Address {
  const factory _Address(
      {required final String addressName,
      required final String regionDepth1,
      required final String regionDepth2,
      required final String regionDepth3,
      required final String mainAddressNo,
      required final String subAddressNo,
      required final String buildingName}) = _$_Address;

  factory _Address.fromJson(Map<String, dynamic> json) = _$_Address.fromJson;

  @override
  String get addressName;
  @override
  String get regionDepth1;
  @override
  String get regionDepth2;
  @override
  String get regionDepth3;
  @override
  String get mainAddressNo;
  @override
  String get subAddressNo;
  @override
  String get buildingName;
  @override
  @JsonKey(ignore: true)
  _$$_AddressCopyWith<_$_Address> get copyWith =>
      throw _privateConstructorUsedError;
}

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
mixin _$Location {
  Address get address => throw _privateConstructorUsedError;
  Point get point => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res, Location>;
  @useResult
  $Res call({Address address, Point point});

  $AddressCopyWith<$Res> get address;
  $PointCopyWith<$Res> get point;
}

/// @nodoc
class _$LocationCopyWithImpl<$Res, $Val extends Location>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? point = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as Point,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get address {
    return $AddressCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PointCopyWith<$Res> get point {
    return $PointCopyWith<$Res>(_value.point, (value) {
      return _then(_value.copyWith(point: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LocationCopyWith<$Res> implements $LocationCopyWith<$Res> {
  factory _$$_LocationCopyWith(
          _$_Location value, $Res Function(_$_Location) then) =
      __$$_LocationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Address address, Point point});

  @override
  $AddressCopyWith<$Res> get address;
  @override
  $PointCopyWith<$Res> get point;
}

/// @nodoc
class __$$_LocationCopyWithImpl<$Res>
    extends _$LocationCopyWithImpl<$Res, _$_Location>
    implements _$$_LocationCopyWith<$Res> {
  __$$_LocationCopyWithImpl(
      _$_Location _value, $Res Function(_$_Location) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? point = null,
  }) {
    return _then(_$_Location(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as Point,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Location with DiagnosticableTreeMixin implements _Location {
  const _$_Location({required this.address, required this.point});

  factory _$_Location.fromJson(Map<String, dynamic> json) =>
      _$$_LocationFromJson(json);

  @override
  final Address address;
  @override
  final Point point;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Location(address: $address, point: $point)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Location'))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('point', point));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Location &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.point, point) || other.point == point));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, address, point);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocationCopyWith<_$_Location> get copyWith =>
      __$$_LocationCopyWithImpl<_$_Location>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocationToJson(
      this,
    );
  }
}

abstract class _Location implements Location {
  const factory _Location(
      {required final Address address,
      required final Point point}) = _$_Location;

  factory _Location.fromJson(Map<String, dynamic> json) = _$_Location.fromJson;

  @override
  Address get address;
  @override
  Point get point;
  @override
  @JsonKey(ignore: true)
  _$$_LocationCopyWith<_$_Location> get copyWith =>
      throw _privateConstructorUsedError;
}
