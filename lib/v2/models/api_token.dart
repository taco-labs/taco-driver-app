import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_token.freezed.dart';

part 'api_token.g.dart';

@freezed
class ApiToken with _$ApiToken {
  const factory ApiToken({
    required String token,
    required String driverId,
  }) = _ApiToken;

  factory ApiToken.fromJson(Map<String, Object?> json) =>
      _$ApiTokenFromJson(json);
}
