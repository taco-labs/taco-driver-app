import 'package:dio/dio.dart';

class ApiError implements Exception {
  ApiError(this.errorCode, this.errorMessage);

  final String errorCode;
  final String errorMessage;

  static ApiError unKnownError() {
    return ApiError("ERR_UNKNOWN", "unkown error");
  }

  @override
  String toString() {
    return "Code: $errorCode / Message: $errorMessage";
  }
}

class ApiClientWrapper<C> {
  final C api;
  ApiClientWrapper(this.api);

  invoke<T>(Future<T> Function(C) invokehHandler) async {
    try {
      final v = await invokehHandler(api);
      return v;
    } on DioError catch (e) {
      final apiErrResp = tryCastErrorResopnse(e.response?.data);
      final apiErr = ApiError(
          apiErrResp["errCode"] as String? ?? "UNKNOWN_ERROR",
          apiErrResp["message"] as String? ?? e.message);
      throw apiErr;
    } catch (e) {
      throw ApiError.unKnownError();
    }
  }
}

Map<String, Object?> tryCastErrorResopnse(dynamic resp) {
  try {
    return resp as Map<String, Object?>;
  } on TypeError {
    return <String, Object?>{};
  }
}
