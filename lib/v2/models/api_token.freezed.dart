// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'api_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiToken _$ApiTokenFromJson(Map<String, dynamic> json) {
  return _ApiToken.fromJson(json);
}

/// @nodoc
mixin _$ApiToken {
  String get token => throw _privateConstructorUsedError;
  String get driverId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiTokenCopyWith<ApiToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiTokenCopyWith<$Res> {
  factory $ApiTokenCopyWith(ApiToken value, $Res Function(ApiToken) then) =
      _$ApiTokenCopyWithImpl<$Res, ApiToken>;
  @useResult
  $Res call({String token, String driverId});
}

/// @nodoc
class _$ApiTokenCopyWithImpl<$Res, $Val extends ApiToken>
    implements $ApiTokenCopyWith<$Res> {
  _$ApiTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? driverId = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ApiTokenCopyWith<$Res> implements $ApiTokenCopyWith<$Res> {
  factory _$$_ApiTokenCopyWith(
          _$_ApiToken value, $Res Function(_$_ApiToken) then) =
      __$$_ApiTokenCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, String driverId});
}

/// @nodoc
class __$$_ApiTokenCopyWithImpl<$Res>
    extends _$ApiTokenCopyWithImpl<$Res, _$_ApiToken>
    implements _$$_ApiTokenCopyWith<$Res> {
  __$$_ApiTokenCopyWithImpl(
      _$_ApiToken _value, $Res Function(_$_ApiToken) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? driverId = null,
  }) {
    return _then(_$_ApiToken(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApiToken with DiagnosticableTreeMixin implements _ApiToken {
  const _$_ApiToken({required this.token, required this.driverId});

  factory _$_ApiToken.fromJson(Map<String, dynamic> json) =>
      _$$_ApiTokenFromJson(json);

  @override
  final String token;
  @override
  final String driverId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ApiToken(token: $token, driverId: $driverId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ApiToken'))
      ..add(DiagnosticsProperty('token', token))
      ..add(DiagnosticsProperty('driverId', driverId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiToken &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token, driverId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiTokenCopyWith<_$_ApiToken> get copyWith =>
      __$$_ApiTokenCopyWithImpl<_$_ApiToken>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApiTokenToJson(
      this,
    );
  }
}

abstract class _ApiToken implements ApiToken {
  const factory _ApiToken(
      {required final String token,
      required final String driverId}) = _$_ApiToken;

  factory _ApiToken.fromJson(Map<String, dynamic> json) = _$_ApiToken.fromJson;

  @override
  String get token;
  @override
  String get driverId;
  @override
  @JsonKey(ignore: true)
  _$$_ApiTokenCopyWith<_$_ApiToken> get copyWith =>
      throw _privateConstructorUsedError;
}
