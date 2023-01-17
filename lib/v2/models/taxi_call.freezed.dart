// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'taxi_call.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DriverLatestTaxiCallResponse _$DriverLatestTaxiCallResponseFromJson(
    Map<String, dynamic> json) {
  return _DriverLatestTaxiCallResponse.fromJson(json);
}

/// @nodoc
mixin _$DriverLatestTaxiCallResponse {
  int get toDepartureDistance => throw _privateConstructorUsedError;
  int get toDepartureEta => throw _privateConstructorUsedError;
  List<Point> get toDeparturePath => throw _privateConstructorUsedError;
  int get toArrivalDistance => throw _privateConstructorUsedError;
  int get toArrivalEta => throw _privateConstructorUsedError;
  List<Point> get toArrivalPath => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get driverId => throw _privateConstructorUsedError;
  Location get departure => throw _privateConstructorUsedError;
  Location get arrival => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  String get userTag => throw _privateConstructorUsedError;
  int get requestBasePrice => throw _privateConstructorUsedError;
  int get requestMinAdditionalPrice => throw _privateConstructorUsedError;
  int get requestMaxAdditionalPrice => throw _privateConstructorUsedError;
  int get basePrice => throw _privateConstructorUsedError;
  int get cancelPenaltyPrice => throw _privateConstructorUsedError;
  int get tollFee => throw _privateConstructorUsedError;
  int get additionalPrice => throw _privateConstructorUsedError;
  String get currentState => throw _privateConstructorUsedError;
  DateTime get createTime => throw _privateConstructorUsedError;
  DateTime get updateTime => throw _privateConstructorUsedError;
  String get userPhone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DriverLatestTaxiCallResponseCopyWith<DriverLatestTaxiCallResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverLatestTaxiCallResponseCopyWith<$Res> {
  factory $DriverLatestTaxiCallResponseCopyWith(
          DriverLatestTaxiCallResponse value,
          $Res Function(DriverLatestTaxiCallResponse) then) =
      _$DriverLatestTaxiCallResponseCopyWithImpl<$Res,
          DriverLatestTaxiCallResponse>;
  @useResult
  $Res call(
      {int toDepartureDistance,
      int toDepartureEta,
      List<Point> toDeparturePath,
      int toArrivalDistance,
      int toArrivalEta,
      List<Point> toArrivalPath,
      String id,
      String userId,
      String driverId,
      Location departure,
      Location arrival,
      List<String> tags,
      String userTag,
      int requestBasePrice,
      int requestMinAdditionalPrice,
      int requestMaxAdditionalPrice,
      int basePrice,
      int cancelPenaltyPrice,
      int tollFee,
      int additionalPrice,
      String currentState,
      DateTime createTime,
      DateTime updateTime,
      String userPhone});

  $LocationCopyWith<$Res> get departure;
  $LocationCopyWith<$Res> get arrival;
}

/// @nodoc
class _$DriverLatestTaxiCallResponseCopyWithImpl<$Res,
        $Val extends DriverLatestTaxiCallResponse>
    implements $DriverLatestTaxiCallResponseCopyWith<$Res> {
  _$DriverLatestTaxiCallResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toDepartureDistance = null,
    Object? toDepartureEta = null,
    Object? toDeparturePath = null,
    Object? toArrivalDistance = null,
    Object? toArrivalEta = null,
    Object? toArrivalPath = null,
    Object? id = null,
    Object? userId = null,
    Object? driverId = null,
    Object? departure = null,
    Object? arrival = null,
    Object? tags = null,
    Object? userTag = null,
    Object? requestBasePrice = null,
    Object? requestMinAdditionalPrice = null,
    Object? requestMaxAdditionalPrice = null,
    Object? basePrice = null,
    Object? cancelPenaltyPrice = null,
    Object? tollFee = null,
    Object? additionalPrice = null,
    Object? currentState = null,
    Object? createTime = null,
    Object? updateTime = null,
    Object? userPhone = null,
  }) {
    return _then(_value.copyWith(
      toDepartureDistance: null == toDepartureDistance
          ? _value.toDepartureDistance
          : toDepartureDistance // ignore: cast_nullable_to_non_nullable
              as int,
      toDepartureEta: null == toDepartureEta
          ? _value.toDepartureEta
          : toDepartureEta // ignore: cast_nullable_to_non_nullable
              as int,
      toDeparturePath: null == toDeparturePath
          ? _value.toDeparturePath
          : toDeparturePath // ignore: cast_nullable_to_non_nullable
              as List<Point>,
      toArrivalDistance: null == toArrivalDistance
          ? _value.toArrivalDistance
          : toArrivalDistance // ignore: cast_nullable_to_non_nullable
              as int,
      toArrivalEta: null == toArrivalEta
          ? _value.toArrivalEta
          : toArrivalEta // ignore: cast_nullable_to_non_nullable
              as int,
      toArrivalPath: null == toArrivalPath
          ? _value.toArrivalPath
          : toArrivalPath // ignore: cast_nullable_to_non_nullable
              as List<Point>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
      departure: null == departure
          ? _value.departure
          : departure // ignore: cast_nullable_to_non_nullable
              as Location,
      arrival: null == arrival
          ? _value.arrival
          : arrival // ignore: cast_nullable_to_non_nullable
              as Location,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userTag: null == userTag
          ? _value.userTag
          : userTag // ignore: cast_nullable_to_non_nullable
              as String,
      requestBasePrice: null == requestBasePrice
          ? _value.requestBasePrice
          : requestBasePrice // ignore: cast_nullable_to_non_nullable
              as int,
      requestMinAdditionalPrice: null == requestMinAdditionalPrice
          ? _value.requestMinAdditionalPrice
          : requestMinAdditionalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      requestMaxAdditionalPrice: null == requestMaxAdditionalPrice
          ? _value.requestMaxAdditionalPrice
          : requestMaxAdditionalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      basePrice: null == basePrice
          ? _value.basePrice
          : basePrice // ignore: cast_nullable_to_non_nullable
              as int,
      cancelPenaltyPrice: null == cancelPenaltyPrice
          ? _value.cancelPenaltyPrice
          : cancelPenaltyPrice // ignore: cast_nullable_to_non_nullable
              as int,
      tollFee: null == tollFee
          ? _value.tollFee
          : tollFee // ignore: cast_nullable_to_non_nullable
              as int,
      additionalPrice: null == additionalPrice
          ? _value.additionalPrice
          : additionalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      currentState: null == currentState
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as String,
      createTime: null == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updateTime: null == updateTime
          ? _value.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userPhone: null == userPhone
          ? _value.userPhone
          : userPhone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get departure {
    return $LocationCopyWith<$Res>(_value.departure, (value) {
      return _then(_value.copyWith(departure: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get arrival {
    return $LocationCopyWith<$Res>(_value.arrival, (value) {
      return _then(_value.copyWith(arrival: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DriverLatestTaxiCallResponseCopyWith<$Res>
    implements $DriverLatestTaxiCallResponseCopyWith<$Res> {
  factory _$$_DriverLatestTaxiCallResponseCopyWith(
          _$_DriverLatestTaxiCallResponse value,
          $Res Function(_$_DriverLatestTaxiCallResponse) then) =
      __$$_DriverLatestTaxiCallResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int toDepartureDistance,
      int toDepartureEta,
      List<Point> toDeparturePath,
      int toArrivalDistance,
      int toArrivalEta,
      List<Point> toArrivalPath,
      String id,
      String userId,
      String driverId,
      Location departure,
      Location arrival,
      List<String> tags,
      String userTag,
      int requestBasePrice,
      int requestMinAdditionalPrice,
      int requestMaxAdditionalPrice,
      int basePrice,
      int cancelPenaltyPrice,
      int tollFee,
      int additionalPrice,
      String currentState,
      DateTime createTime,
      DateTime updateTime,
      String userPhone});

  @override
  $LocationCopyWith<$Res> get departure;
  @override
  $LocationCopyWith<$Res> get arrival;
}

/// @nodoc
class __$$_DriverLatestTaxiCallResponseCopyWithImpl<$Res>
    extends _$DriverLatestTaxiCallResponseCopyWithImpl<$Res,
        _$_DriverLatestTaxiCallResponse>
    implements _$$_DriverLatestTaxiCallResponseCopyWith<$Res> {
  __$$_DriverLatestTaxiCallResponseCopyWithImpl(
      _$_DriverLatestTaxiCallResponse _value,
      $Res Function(_$_DriverLatestTaxiCallResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toDepartureDistance = null,
    Object? toDepartureEta = null,
    Object? toDeparturePath = null,
    Object? toArrivalDistance = null,
    Object? toArrivalEta = null,
    Object? toArrivalPath = null,
    Object? id = null,
    Object? userId = null,
    Object? driverId = null,
    Object? departure = null,
    Object? arrival = null,
    Object? tags = null,
    Object? userTag = null,
    Object? requestBasePrice = null,
    Object? requestMinAdditionalPrice = null,
    Object? requestMaxAdditionalPrice = null,
    Object? basePrice = null,
    Object? cancelPenaltyPrice = null,
    Object? tollFee = null,
    Object? additionalPrice = null,
    Object? currentState = null,
    Object? createTime = null,
    Object? updateTime = null,
    Object? userPhone = null,
  }) {
    return _then(_$_DriverLatestTaxiCallResponse(
      toDepartureDistance: null == toDepartureDistance
          ? _value.toDepartureDistance
          : toDepartureDistance // ignore: cast_nullable_to_non_nullable
              as int,
      toDepartureEta: null == toDepartureEta
          ? _value.toDepartureEta
          : toDepartureEta // ignore: cast_nullable_to_non_nullable
              as int,
      toDeparturePath: null == toDeparturePath
          ? _value._toDeparturePath
          : toDeparturePath // ignore: cast_nullable_to_non_nullable
              as List<Point>,
      toArrivalDistance: null == toArrivalDistance
          ? _value.toArrivalDistance
          : toArrivalDistance // ignore: cast_nullable_to_non_nullable
              as int,
      toArrivalEta: null == toArrivalEta
          ? _value.toArrivalEta
          : toArrivalEta // ignore: cast_nullable_to_non_nullable
              as int,
      toArrivalPath: null == toArrivalPath
          ? _value._toArrivalPath
          : toArrivalPath // ignore: cast_nullable_to_non_nullable
              as List<Point>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
      departure: null == departure
          ? _value.departure
          : departure // ignore: cast_nullable_to_non_nullable
              as Location,
      arrival: null == arrival
          ? _value.arrival
          : arrival // ignore: cast_nullable_to_non_nullable
              as Location,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userTag: null == userTag
          ? _value.userTag
          : userTag // ignore: cast_nullable_to_non_nullable
              as String,
      requestBasePrice: null == requestBasePrice
          ? _value.requestBasePrice
          : requestBasePrice // ignore: cast_nullable_to_non_nullable
              as int,
      requestMinAdditionalPrice: null == requestMinAdditionalPrice
          ? _value.requestMinAdditionalPrice
          : requestMinAdditionalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      requestMaxAdditionalPrice: null == requestMaxAdditionalPrice
          ? _value.requestMaxAdditionalPrice
          : requestMaxAdditionalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      basePrice: null == basePrice
          ? _value.basePrice
          : basePrice // ignore: cast_nullable_to_non_nullable
              as int,
      cancelPenaltyPrice: null == cancelPenaltyPrice
          ? _value.cancelPenaltyPrice
          : cancelPenaltyPrice // ignore: cast_nullable_to_non_nullable
              as int,
      tollFee: null == tollFee
          ? _value.tollFee
          : tollFee // ignore: cast_nullable_to_non_nullable
              as int,
      additionalPrice: null == additionalPrice
          ? _value.additionalPrice
          : additionalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      currentState: null == currentState
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as String,
      createTime: null == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updateTime: null == updateTime
          ? _value.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userPhone: null == userPhone
          ? _value.userPhone
          : userPhone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DriverLatestTaxiCallResponse
    with DiagnosticableTreeMixin
    implements _DriverLatestTaxiCallResponse {
  const _$_DriverLatestTaxiCallResponse(
      {required this.toDepartureDistance,
      required this.toDepartureEta,
      required final List<Point> toDeparturePath,
      required this.toArrivalDistance,
      required this.toArrivalEta,
      required final List<Point> toArrivalPath,
      required this.id,
      required this.userId,
      required this.driverId,
      required this.departure,
      required this.arrival,
      required final List<String> tags,
      required this.userTag,
      required this.requestBasePrice,
      required this.requestMinAdditionalPrice,
      required this.requestMaxAdditionalPrice,
      required this.basePrice,
      required this.cancelPenaltyPrice,
      required this.tollFee,
      required this.additionalPrice,
      required this.currentState,
      required this.createTime,
      required this.updateTime,
      required this.userPhone})
      : _toDeparturePath = toDeparturePath,
        _toArrivalPath = toArrivalPath,
        _tags = tags;

  factory _$_DriverLatestTaxiCallResponse.fromJson(Map<String, dynamic> json) =>
      _$$_DriverLatestTaxiCallResponseFromJson(json);

  @override
  final int toDepartureDistance;
  @override
  final int toDepartureEta;
  final List<Point> _toDeparturePath;
  @override
  List<Point> get toDeparturePath {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_toDeparturePath);
  }

  @override
  final int toArrivalDistance;
  @override
  final int toArrivalEta;
  final List<Point> _toArrivalPath;
  @override
  List<Point> get toArrivalPath {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_toArrivalPath);
  }

  @override
  final String id;
  @override
  final String userId;
  @override
  final String driverId;
  @override
  final Location departure;
  @override
  final Location arrival;
  final List<String> _tags;
  @override
  List<String> get tags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final String userTag;
  @override
  final int requestBasePrice;
  @override
  final int requestMinAdditionalPrice;
  @override
  final int requestMaxAdditionalPrice;
  @override
  final int basePrice;
  @override
  final int cancelPenaltyPrice;
  @override
  final int tollFee;
  @override
  final int additionalPrice;
  @override
  final String currentState;
  @override
  final DateTime createTime;
  @override
  final DateTime updateTime;
  @override
  final String userPhone;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DriverLatestTaxiCallResponse(toDepartureDistance: $toDepartureDistance, toDepartureEta: $toDepartureEta, toDeparturePath: $toDeparturePath, toArrivalDistance: $toArrivalDistance, toArrivalEta: $toArrivalEta, toArrivalPath: $toArrivalPath, id: $id, userId: $userId, driverId: $driverId, departure: $departure, arrival: $arrival, tags: $tags, userTag: $userTag, requestBasePrice: $requestBasePrice, requestMinAdditionalPrice: $requestMinAdditionalPrice, requestMaxAdditionalPrice: $requestMaxAdditionalPrice, basePrice: $basePrice, cancelPenaltyPrice: $cancelPenaltyPrice, tollFee: $tollFee, additionalPrice: $additionalPrice, currentState: $currentState, createTime: $createTime, updateTime: $updateTime, userPhone: $userPhone)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DriverLatestTaxiCallResponse'))
      ..add(DiagnosticsProperty('toDepartureDistance', toDepartureDistance))
      ..add(DiagnosticsProperty('toDepartureEta', toDepartureEta))
      ..add(DiagnosticsProperty('toDeparturePath', toDeparturePath))
      ..add(DiagnosticsProperty('toArrivalDistance', toArrivalDistance))
      ..add(DiagnosticsProperty('toArrivalEta', toArrivalEta))
      ..add(DiagnosticsProperty('toArrivalPath', toArrivalPath))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('driverId', driverId))
      ..add(DiagnosticsProperty('departure', departure))
      ..add(DiagnosticsProperty('arrival', arrival))
      ..add(DiagnosticsProperty('tags', tags))
      ..add(DiagnosticsProperty('userTag', userTag))
      ..add(DiagnosticsProperty('requestBasePrice', requestBasePrice))
      ..add(DiagnosticsProperty(
          'requestMinAdditionalPrice', requestMinAdditionalPrice))
      ..add(DiagnosticsProperty(
          'requestMaxAdditionalPrice', requestMaxAdditionalPrice))
      ..add(DiagnosticsProperty('basePrice', basePrice))
      ..add(DiagnosticsProperty('cancelPenaltyPrice', cancelPenaltyPrice))
      ..add(DiagnosticsProperty('tollFee', tollFee))
      ..add(DiagnosticsProperty('additionalPrice', additionalPrice))
      ..add(DiagnosticsProperty('currentState', currentState))
      ..add(DiagnosticsProperty('createTime', createTime))
      ..add(DiagnosticsProperty('updateTime', updateTime))
      ..add(DiagnosticsProperty('userPhone', userPhone));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DriverLatestTaxiCallResponse &&
            (identical(other.toDepartureDistance, toDepartureDistance) ||
                other.toDepartureDistance == toDepartureDistance) &&
            (identical(other.toDepartureEta, toDepartureEta) ||
                other.toDepartureEta == toDepartureEta) &&
            const DeepCollectionEquality()
                .equals(other._toDeparturePath, _toDeparturePath) &&
            (identical(other.toArrivalDistance, toArrivalDistance) ||
                other.toArrivalDistance == toArrivalDistance) &&
            (identical(other.toArrivalEta, toArrivalEta) ||
                other.toArrivalEta == toArrivalEta) &&
            const DeepCollectionEquality()
                .equals(other._toArrivalPath, _toArrivalPath) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.departure, departure) ||
                other.departure == departure) &&
            (identical(other.arrival, arrival) || other.arrival == arrival) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.userTag, userTag) || other.userTag == userTag) &&
            (identical(other.requestBasePrice, requestBasePrice) ||
                other.requestBasePrice == requestBasePrice) &&
            (identical(other.requestMinAdditionalPrice,
                    requestMinAdditionalPrice) ||
                other.requestMinAdditionalPrice == requestMinAdditionalPrice) &&
            (identical(other.requestMaxAdditionalPrice,
                    requestMaxAdditionalPrice) ||
                other.requestMaxAdditionalPrice == requestMaxAdditionalPrice) &&
            (identical(other.basePrice, basePrice) ||
                other.basePrice == basePrice) &&
            (identical(other.cancelPenaltyPrice, cancelPenaltyPrice) ||
                other.cancelPenaltyPrice == cancelPenaltyPrice) &&
            (identical(other.tollFee, tollFee) || other.tollFee == tollFee) &&
            (identical(other.additionalPrice, additionalPrice) ||
                other.additionalPrice == additionalPrice) &&
            (identical(other.currentState, currentState) ||
                other.currentState == currentState) &&
            (identical(other.createTime, createTime) ||
                other.createTime == createTime) &&
            (identical(other.updateTime, updateTime) ||
                other.updateTime == updateTime) &&
            (identical(other.userPhone, userPhone) ||
                other.userPhone == userPhone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        toDepartureDistance,
        toDepartureEta,
        const DeepCollectionEquality().hash(_toDeparturePath),
        toArrivalDistance,
        toArrivalEta,
        const DeepCollectionEquality().hash(_toArrivalPath),
        id,
        userId,
        driverId,
        departure,
        arrival,
        const DeepCollectionEquality().hash(_tags),
        userTag,
        requestBasePrice,
        requestMinAdditionalPrice,
        requestMaxAdditionalPrice,
        basePrice,
        cancelPenaltyPrice,
        tollFee,
        additionalPrice,
        currentState,
        createTime,
        updateTime,
        userPhone
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DriverLatestTaxiCallResponseCopyWith<_$_DriverLatestTaxiCallResponse>
      get copyWith => __$$_DriverLatestTaxiCallResponseCopyWithImpl<
          _$_DriverLatestTaxiCallResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DriverLatestTaxiCallResponseToJson(
      this,
    );
  }
}

abstract class _DriverLatestTaxiCallResponse
    implements DriverLatestTaxiCallResponse {
  const factory _DriverLatestTaxiCallResponse(
      {required final int toDepartureDistance,
      required final int toDepartureEta,
      required final List<Point> toDeparturePath,
      required final int toArrivalDistance,
      required final int toArrivalEta,
      required final List<Point> toArrivalPath,
      required final String id,
      required final String userId,
      required final String driverId,
      required final Location departure,
      required final Location arrival,
      required final List<String> tags,
      required final String userTag,
      required final int requestBasePrice,
      required final int requestMinAdditionalPrice,
      required final int requestMaxAdditionalPrice,
      required final int basePrice,
      required final int cancelPenaltyPrice,
      required final int tollFee,
      required final int additionalPrice,
      required final String currentState,
      required final DateTime createTime,
      required final DateTime updateTime,
      required final String userPhone}) = _$_DriverLatestTaxiCallResponse;

  factory _DriverLatestTaxiCallResponse.fromJson(Map<String, dynamic> json) =
      _$_DriverLatestTaxiCallResponse.fromJson;

  @override
  int get toDepartureDistance;
  @override
  int get toDepartureEta;
  @override
  List<Point> get toDeparturePath;
  @override
  int get toArrivalDistance;
  @override
  int get toArrivalEta;
  @override
  List<Point> get toArrivalPath;
  @override
  String get id;
  @override
  String get userId;
  @override
  String get driverId;
  @override
  Location get departure;
  @override
  Location get arrival;
  @override
  List<String> get tags;
  @override
  String get userTag;
  @override
  int get requestBasePrice;
  @override
  int get requestMinAdditionalPrice;
  @override
  int get requestMaxAdditionalPrice;
  @override
  int get basePrice;
  @override
  int get cancelPenaltyPrice;
  @override
  int get tollFee;
  @override
  int get additionalPrice;
  @override
  String get currentState;
  @override
  DateTime get createTime;
  @override
  DateTime get updateTime;
  @override
  String get userPhone;
  @override
  @JsonKey(ignore: true)
  _$$_DriverLatestTaxiCallResponseCopyWith<_$_DriverLatestTaxiCallResponse>
      get copyWith => throw _privateConstructorUsedError;
}

TaxiCallTicket _$TaxiCallTicketFromJson(Map<String, dynamic> json) {
  return _TaxiCallTicket.fromJson(json);
}

/// @nodoc
mixin _$TaxiCallTicket {
  String get taxiCallRequestId => throw _privateConstructorUsedError;
  String get ticketId => throw _privateConstructorUsedError;
  int get attempt => throw _privateConstructorUsedError;
  String get tags => throw _privateConstructorUsedError;
  String get userTag => throw _privateConstructorUsedError;
  int get toDepartureDistance => throw _privateConstructorUsedError;
  int get toArrivalDistance => throw _privateConstructorUsedError;
  int get toArrivalETA => throw _privateConstructorUsedError;
  int get additionalPrice => throw _privateConstructorUsedError;
  String get departureAddressRegionDepth2 => throw _privateConstructorUsedError;
  String get departureAddressRegionDepth3 => throw _privateConstructorUsedError;
  String get departureName => throw _privateConstructorUsedError;
  String get arrivalAddressRegionDepth2 => throw _privateConstructorUsedError;
  String get arrivalAddressRegionDepth3 => throw _privateConstructorUsedError;
  String get arrivalName => throw _privateConstructorUsedError;
  DateTime get updateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaxiCallTicketCopyWith<TaxiCallTicket> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaxiCallTicketCopyWith<$Res> {
  factory $TaxiCallTicketCopyWith(
          TaxiCallTicket value, $Res Function(TaxiCallTicket) then) =
      _$TaxiCallTicketCopyWithImpl<$Res, TaxiCallTicket>;
  @useResult
  $Res call(
      {String taxiCallRequestId,
      String ticketId,
      int attempt,
      String tags,
      String userTag,
      int toDepartureDistance,
      int toArrivalDistance,
      int toArrivalETA,
      int additionalPrice,
      String departureAddressRegionDepth2,
      String departureAddressRegionDepth3,
      String departureName,
      String arrivalAddressRegionDepth2,
      String arrivalAddressRegionDepth3,
      String arrivalName,
      DateTime updateTime});
}

/// @nodoc
class _$TaxiCallTicketCopyWithImpl<$Res, $Val extends TaxiCallTicket>
    implements $TaxiCallTicketCopyWith<$Res> {
  _$TaxiCallTicketCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taxiCallRequestId = null,
    Object? ticketId = null,
    Object? attempt = null,
    Object? tags = null,
    Object? userTag = null,
    Object? toDepartureDistance = null,
    Object? toArrivalDistance = null,
    Object? toArrivalETA = null,
    Object? additionalPrice = null,
    Object? departureAddressRegionDepth2 = null,
    Object? departureAddressRegionDepth3 = null,
    Object? departureName = null,
    Object? arrivalAddressRegionDepth2 = null,
    Object? arrivalAddressRegionDepth3 = null,
    Object? arrivalName = null,
    Object? updateTime = null,
  }) {
    return _then(_value.copyWith(
      taxiCallRequestId: null == taxiCallRequestId
          ? _value.taxiCallRequestId
          : taxiCallRequestId // ignore: cast_nullable_to_non_nullable
              as String,
      ticketId: null == ticketId
          ? _value.ticketId
          : ticketId // ignore: cast_nullable_to_non_nullable
              as String,
      attempt: null == attempt
          ? _value.attempt
          : attempt // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as String,
      userTag: null == userTag
          ? _value.userTag
          : userTag // ignore: cast_nullable_to_non_nullable
              as String,
      toDepartureDistance: null == toDepartureDistance
          ? _value.toDepartureDistance
          : toDepartureDistance // ignore: cast_nullable_to_non_nullable
              as int,
      toArrivalDistance: null == toArrivalDistance
          ? _value.toArrivalDistance
          : toArrivalDistance // ignore: cast_nullable_to_non_nullable
              as int,
      toArrivalETA: null == toArrivalETA
          ? _value.toArrivalETA
          : toArrivalETA // ignore: cast_nullable_to_non_nullable
              as int,
      additionalPrice: null == additionalPrice
          ? _value.additionalPrice
          : additionalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      departureAddressRegionDepth2: null == departureAddressRegionDepth2
          ? _value.departureAddressRegionDepth2
          : departureAddressRegionDepth2 // ignore: cast_nullable_to_non_nullable
              as String,
      departureAddressRegionDepth3: null == departureAddressRegionDepth3
          ? _value.departureAddressRegionDepth3
          : departureAddressRegionDepth3 // ignore: cast_nullable_to_non_nullable
              as String,
      departureName: null == departureName
          ? _value.departureName
          : departureName // ignore: cast_nullable_to_non_nullable
              as String,
      arrivalAddressRegionDepth2: null == arrivalAddressRegionDepth2
          ? _value.arrivalAddressRegionDepth2
          : arrivalAddressRegionDepth2 // ignore: cast_nullable_to_non_nullable
              as String,
      arrivalAddressRegionDepth3: null == arrivalAddressRegionDepth3
          ? _value.arrivalAddressRegionDepth3
          : arrivalAddressRegionDepth3 // ignore: cast_nullable_to_non_nullable
              as String,
      arrivalName: null == arrivalName
          ? _value.arrivalName
          : arrivalName // ignore: cast_nullable_to_non_nullable
              as String,
      updateTime: null == updateTime
          ? _value.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TaxiCallTicketCopyWith<$Res>
    implements $TaxiCallTicketCopyWith<$Res> {
  factory _$$_TaxiCallTicketCopyWith(
          _$_TaxiCallTicket value, $Res Function(_$_TaxiCallTicket) then) =
      __$$_TaxiCallTicketCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String taxiCallRequestId,
      String ticketId,
      int attempt,
      String tags,
      String userTag,
      int toDepartureDistance,
      int toArrivalDistance,
      int toArrivalETA,
      int additionalPrice,
      String departureAddressRegionDepth2,
      String departureAddressRegionDepth3,
      String departureName,
      String arrivalAddressRegionDepth2,
      String arrivalAddressRegionDepth3,
      String arrivalName,
      DateTime updateTime});
}

/// @nodoc
class __$$_TaxiCallTicketCopyWithImpl<$Res>
    extends _$TaxiCallTicketCopyWithImpl<$Res, _$_TaxiCallTicket>
    implements _$$_TaxiCallTicketCopyWith<$Res> {
  __$$_TaxiCallTicketCopyWithImpl(
      _$_TaxiCallTicket _value, $Res Function(_$_TaxiCallTicket) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taxiCallRequestId = null,
    Object? ticketId = null,
    Object? attempt = null,
    Object? tags = null,
    Object? userTag = null,
    Object? toDepartureDistance = null,
    Object? toArrivalDistance = null,
    Object? toArrivalETA = null,
    Object? additionalPrice = null,
    Object? departureAddressRegionDepth2 = null,
    Object? departureAddressRegionDepth3 = null,
    Object? departureName = null,
    Object? arrivalAddressRegionDepth2 = null,
    Object? arrivalAddressRegionDepth3 = null,
    Object? arrivalName = null,
    Object? updateTime = null,
  }) {
    return _then(_$_TaxiCallTicket(
      taxiCallRequestId: null == taxiCallRequestId
          ? _value.taxiCallRequestId
          : taxiCallRequestId // ignore: cast_nullable_to_non_nullable
              as String,
      ticketId: null == ticketId
          ? _value.ticketId
          : ticketId // ignore: cast_nullable_to_non_nullable
              as String,
      attempt: null == attempt
          ? _value.attempt
          : attempt // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as String,
      userTag: null == userTag
          ? _value.userTag
          : userTag // ignore: cast_nullable_to_non_nullable
              as String,
      toDepartureDistance: null == toDepartureDistance
          ? _value.toDepartureDistance
          : toDepartureDistance // ignore: cast_nullable_to_non_nullable
              as int,
      toArrivalDistance: null == toArrivalDistance
          ? _value.toArrivalDistance
          : toArrivalDistance // ignore: cast_nullable_to_non_nullable
              as int,
      toArrivalETA: null == toArrivalETA
          ? _value.toArrivalETA
          : toArrivalETA // ignore: cast_nullable_to_non_nullable
              as int,
      additionalPrice: null == additionalPrice
          ? _value.additionalPrice
          : additionalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      departureAddressRegionDepth2: null == departureAddressRegionDepth2
          ? _value.departureAddressRegionDepth2
          : departureAddressRegionDepth2 // ignore: cast_nullable_to_non_nullable
              as String,
      departureAddressRegionDepth3: null == departureAddressRegionDepth3
          ? _value.departureAddressRegionDepth3
          : departureAddressRegionDepth3 // ignore: cast_nullable_to_non_nullable
              as String,
      departureName: null == departureName
          ? _value.departureName
          : departureName // ignore: cast_nullable_to_non_nullable
              as String,
      arrivalAddressRegionDepth2: null == arrivalAddressRegionDepth2
          ? _value.arrivalAddressRegionDepth2
          : arrivalAddressRegionDepth2 // ignore: cast_nullable_to_non_nullable
              as String,
      arrivalAddressRegionDepth3: null == arrivalAddressRegionDepth3
          ? _value.arrivalAddressRegionDepth3
          : arrivalAddressRegionDepth3 // ignore: cast_nullable_to_non_nullable
              as String,
      arrivalName: null == arrivalName
          ? _value.arrivalName
          : arrivalName // ignore: cast_nullable_to_non_nullable
              as String,
      updateTime: null == updateTime
          ? _value.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaxiCallTicket extends _TaxiCallTicket with DiagnosticableTreeMixin {
  const _$_TaxiCallTicket(
      {required this.taxiCallRequestId,
      required this.ticketId,
      required this.attempt,
      required this.tags,
      required this.userTag,
      required this.toDepartureDistance,
      required this.toArrivalDistance,
      required this.toArrivalETA,
      required this.additionalPrice,
      required this.departureAddressRegionDepth2,
      required this.departureAddressRegionDepth3,
      required this.departureName,
      required this.arrivalAddressRegionDepth2,
      required this.arrivalAddressRegionDepth3,
      required this.arrivalName,
      required this.updateTime})
      : super._();

  factory _$_TaxiCallTicket.fromJson(Map<String, dynamic> json) =>
      _$$_TaxiCallTicketFromJson(json);

  @override
  final String taxiCallRequestId;
  @override
  final String ticketId;
  @override
  final int attempt;
  @override
  final String tags;
  @override
  final String userTag;
  @override
  final int toDepartureDistance;
  @override
  final int toArrivalDistance;
  @override
  final int toArrivalETA;
  @override
  final int additionalPrice;
  @override
  final String departureAddressRegionDepth2;
  @override
  final String departureAddressRegionDepth3;
  @override
  final String departureName;
  @override
  final String arrivalAddressRegionDepth2;
  @override
  final String arrivalAddressRegionDepth3;
  @override
  final String arrivalName;
  @override
  final DateTime updateTime;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TaxiCallTicket(taxiCallRequestId: $taxiCallRequestId, ticketId: $ticketId, attempt: $attempt, tags: $tags, userTag: $userTag, toDepartureDistance: $toDepartureDistance, toArrivalDistance: $toArrivalDistance, toArrivalETA: $toArrivalETA, additionalPrice: $additionalPrice, departureAddressRegionDepth2: $departureAddressRegionDepth2, departureAddressRegionDepth3: $departureAddressRegionDepth3, departureName: $departureName, arrivalAddressRegionDepth2: $arrivalAddressRegionDepth2, arrivalAddressRegionDepth3: $arrivalAddressRegionDepth3, arrivalName: $arrivalName, updateTime: $updateTime)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TaxiCallTicket'))
      ..add(DiagnosticsProperty('taxiCallRequestId', taxiCallRequestId))
      ..add(DiagnosticsProperty('ticketId', ticketId))
      ..add(DiagnosticsProperty('attempt', attempt))
      ..add(DiagnosticsProperty('tags', tags))
      ..add(DiagnosticsProperty('userTag', userTag))
      ..add(DiagnosticsProperty('toDepartureDistance', toDepartureDistance))
      ..add(DiagnosticsProperty('toArrivalDistance', toArrivalDistance))
      ..add(DiagnosticsProperty('toArrivalETA', toArrivalETA))
      ..add(DiagnosticsProperty('additionalPrice', additionalPrice))
      ..add(DiagnosticsProperty(
          'departureAddressRegionDepth2', departureAddressRegionDepth2))
      ..add(DiagnosticsProperty(
          'departureAddressRegionDepth3', departureAddressRegionDepth3))
      ..add(DiagnosticsProperty('departureName', departureName))
      ..add(DiagnosticsProperty(
          'arrivalAddressRegionDepth2', arrivalAddressRegionDepth2))
      ..add(DiagnosticsProperty(
          'arrivalAddressRegionDepth3', arrivalAddressRegionDepth3))
      ..add(DiagnosticsProperty('arrivalName', arrivalName))
      ..add(DiagnosticsProperty('updateTime', updateTime));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaxiCallTicket &&
            (identical(other.taxiCallRequestId, taxiCallRequestId) ||
                other.taxiCallRequestId == taxiCallRequestId) &&
            (identical(other.ticketId, ticketId) ||
                other.ticketId == ticketId) &&
            (identical(other.attempt, attempt) || other.attempt == attempt) &&
            (identical(other.tags, tags) || other.tags == tags) &&
            (identical(other.userTag, userTag) || other.userTag == userTag) &&
            (identical(other.toDepartureDistance, toDepartureDistance) ||
                other.toDepartureDistance == toDepartureDistance) &&
            (identical(other.toArrivalDistance, toArrivalDistance) ||
                other.toArrivalDistance == toArrivalDistance) &&
            (identical(other.toArrivalETA, toArrivalETA) ||
                other.toArrivalETA == toArrivalETA) &&
            (identical(other.additionalPrice, additionalPrice) ||
                other.additionalPrice == additionalPrice) &&
            (identical(other.departureAddressRegionDepth2,
                    departureAddressRegionDepth2) ||
                other.departureAddressRegionDepth2 ==
                    departureAddressRegionDepth2) &&
            (identical(other.departureAddressRegionDepth3,
                    departureAddressRegionDepth3) ||
                other.departureAddressRegionDepth3 ==
                    departureAddressRegionDepth3) &&
            (identical(other.departureName, departureName) ||
                other.departureName == departureName) &&
            (identical(other.arrivalAddressRegionDepth2,
                    arrivalAddressRegionDepth2) ||
                other.arrivalAddressRegionDepth2 ==
                    arrivalAddressRegionDepth2) &&
            (identical(other.arrivalAddressRegionDepth3,
                    arrivalAddressRegionDepth3) ||
                other.arrivalAddressRegionDepth3 ==
                    arrivalAddressRegionDepth3) &&
            (identical(other.arrivalName, arrivalName) ||
                other.arrivalName == arrivalName) &&
            (identical(other.updateTime, updateTime) ||
                other.updateTime == updateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      taxiCallRequestId,
      ticketId,
      attempt,
      tags,
      userTag,
      toDepartureDistance,
      toArrivalDistance,
      toArrivalETA,
      additionalPrice,
      departureAddressRegionDepth2,
      departureAddressRegionDepth3,
      departureName,
      arrivalAddressRegionDepth2,
      arrivalAddressRegionDepth3,
      arrivalName,
      updateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaxiCallTicketCopyWith<_$_TaxiCallTicket> get copyWith =>
      __$$_TaxiCallTicketCopyWithImpl<_$_TaxiCallTicket>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaxiCallTicketToJson(
      this,
    );
  }
}

abstract class _TaxiCallTicket extends TaxiCallTicket {
  const factory _TaxiCallTicket(
      {required final String taxiCallRequestId,
      required final String ticketId,
      required final int attempt,
      required final String tags,
      required final String userTag,
      required final int toDepartureDistance,
      required final int toArrivalDistance,
      required final int toArrivalETA,
      required final int additionalPrice,
      required final String departureAddressRegionDepth2,
      required final String departureAddressRegionDepth3,
      required final String departureName,
      required final String arrivalAddressRegionDepth2,
      required final String arrivalAddressRegionDepth3,
      required final String arrivalName,
      required final DateTime updateTime}) = _$_TaxiCallTicket;
  const _TaxiCallTicket._() : super._();

  factory _TaxiCallTicket.fromJson(Map<String, dynamic> json) =
      _$_TaxiCallTicket.fromJson;

  @override
  String get taxiCallRequestId;
  @override
  String get ticketId;
  @override
  int get attempt;
  @override
  String get tags;
  @override
  String get userTag;
  @override
  int get toDepartureDistance;
  @override
  int get toArrivalDistance;
  @override
  int get toArrivalETA;
  @override
  int get additionalPrice;
  @override
  String get departureAddressRegionDepth2;
  @override
  String get departureAddressRegionDepth3;
  @override
  String get departureName;
  @override
  String get arrivalAddressRegionDepth2;
  @override
  String get arrivalAddressRegionDepth3;
  @override
  String get arrivalName;
  @override
  DateTime get updateTime;
  @override
  @JsonKey(ignore: true)
  _$$_TaxiCallTicketCopyWith<_$_TaxiCallTicket> get copyWith =>
      throw _privateConstructorUsedError;
}
