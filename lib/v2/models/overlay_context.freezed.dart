// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'overlay_context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OverlayContext {
  ApiToken get apiToken => throw _privateConstructorUsedError;
  TaxiCallTicket get taxiCallTicket => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OverlayContextCopyWith<OverlayContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OverlayContextCopyWith<$Res> {
  factory $OverlayContextCopyWith(
          OverlayContext value, $Res Function(OverlayContext) then) =
      _$OverlayContextCopyWithImpl<$Res, OverlayContext>;
  @useResult
  $Res call({ApiToken apiToken, TaxiCallTicket taxiCallTicket});

  $ApiTokenCopyWith<$Res> get apiToken;
  $TaxiCallTicketCopyWith<$Res> get taxiCallTicket;
}

/// @nodoc
class _$OverlayContextCopyWithImpl<$Res, $Val extends OverlayContext>
    implements $OverlayContextCopyWith<$Res> {
  _$OverlayContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiToken = null,
    Object? taxiCallTicket = null,
  }) {
    return _then(_value.copyWith(
      apiToken: null == apiToken
          ? _value.apiToken
          : apiToken // ignore: cast_nullable_to_non_nullable
              as ApiToken,
      taxiCallTicket: null == taxiCallTicket
          ? _value.taxiCallTicket
          : taxiCallTicket // ignore: cast_nullable_to_non_nullable
              as TaxiCallTicket,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ApiTokenCopyWith<$Res> get apiToken {
    return $ApiTokenCopyWith<$Res>(_value.apiToken, (value) {
      return _then(_value.copyWith(apiToken: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TaxiCallTicketCopyWith<$Res> get taxiCallTicket {
    return $TaxiCallTicketCopyWith<$Res>(_value.taxiCallTicket, (value) {
      return _then(_value.copyWith(taxiCallTicket: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OverlayContextCopyWith<$Res>
    implements $OverlayContextCopyWith<$Res> {
  factory _$$_OverlayContextCopyWith(
          _$_OverlayContext value, $Res Function(_$_OverlayContext) then) =
      __$$_OverlayContextCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ApiToken apiToken, TaxiCallTicket taxiCallTicket});

  @override
  $ApiTokenCopyWith<$Res> get apiToken;
  @override
  $TaxiCallTicketCopyWith<$Res> get taxiCallTicket;
}

/// @nodoc
class __$$_OverlayContextCopyWithImpl<$Res>
    extends _$OverlayContextCopyWithImpl<$Res, _$_OverlayContext>
    implements _$$_OverlayContextCopyWith<$Res> {
  __$$_OverlayContextCopyWithImpl(
      _$_OverlayContext _value, $Res Function(_$_OverlayContext) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiToken = null,
    Object? taxiCallTicket = null,
  }) {
    return _then(_$_OverlayContext(
      apiToken: null == apiToken
          ? _value.apiToken
          : apiToken // ignore: cast_nullable_to_non_nullable
              as ApiToken,
      taxiCallTicket: null == taxiCallTicket
          ? _value.taxiCallTicket
          : taxiCallTicket // ignore: cast_nullable_to_non_nullable
              as TaxiCallTicket,
    ));
  }
}

/// @nodoc

class _$_OverlayContext
    with DiagnosticableTreeMixin
    implements _OverlayContext {
  const _$_OverlayContext(
      {required this.apiToken, required this.taxiCallTicket});

  @override
  final ApiToken apiToken;
  @override
  final TaxiCallTicket taxiCallTicket;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OverlayContext(apiToken: $apiToken, taxiCallTicket: $taxiCallTicket)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OverlayContext'))
      ..add(DiagnosticsProperty('apiToken', apiToken))
      ..add(DiagnosticsProperty('taxiCallTicket', taxiCallTicket));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OverlayContext &&
            (identical(other.apiToken, apiToken) ||
                other.apiToken == apiToken) &&
            (identical(other.taxiCallTicket, taxiCallTicket) ||
                other.taxiCallTicket == taxiCallTicket));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiToken, taxiCallTicket);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OverlayContextCopyWith<_$_OverlayContext> get copyWith =>
      __$$_OverlayContextCopyWithImpl<_$_OverlayContext>(this, _$identity);
}

abstract class _OverlayContext implements OverlayContext {
  const factory _OverlayContext(
      {required final ApiToken apiToken,
      required final TaxiCallTicket taxiCallTicket}) = _$_OverlayContext;

  @override
  ApiToken get apiToken;
  @override
  TaxiCallTicket get taxiCallTicket;
  @override
  @JsonKey(ignore: true)
  _$$_OverlayContextCopyWith<_$_OverlayContext> get copyWith =>
      throw _privateConstructorUsedError;
}
