import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taco_driver/v2/api/driver_api.dart';
import 'package:taco_driver/v2/api/driver_api_wrapper.dart';
import 'package:dio/dio.dart';

part 'client.g.dart';

@riverpod
class ApiClient extends _$ApiClient {
  static Dio _newDio() {
    final dio = Dio();

    return dio;
  }

  @override
  ApiClientWrapper<DriverApi> build() {
    return ApiClientWrapper(DriverApi(_newDio()));
  }

  void setHeader(String key, String value) {
    final dio = _newDio();
    dio.options.headers[key] = value;
    state = ApiClientWrapper(DriverApi(dio));
  }
}
