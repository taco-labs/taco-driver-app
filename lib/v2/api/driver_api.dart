import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:taco_driver/v2/models/taxi_call.dart';

part 'driver_api.g.dart';

@RestApi(baseUrl: 'https://driver.dev.api.taco-labs.com')
abstract class DriverApi {
  factory DriverApi(Dio dio, {String baseUrl}) = _DriverApi;

  @PUT("/taxicall/ticket/{ticketId}")
  Future<DriverLatestTaxiCallResponse> acceptTicket(
      @Path("ticketId") String ticketId);

  @DELETE("/taxicall/ticket/{ticketId}")
  Future<void> rejectTicket(@Path("ticketId") String ticketId);
}
