import 'package:demo_front/api/request/add_fcm_token_request.dart';
import 'package:demo_front/api/request/delete_fcm_token_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'cloud_messaging_api.g.dart';

@RestApi()
abstract class CloudMessagingApi {
  factory CloudMessagingApi(
    Dio dio, {
    String baseUrl,
  }) = _CloudMessagingApi;

  @POST('/save-push-token')
  Future<void> addFcmToken(@Body() AddFcmTokenRequest request);

  @POST('/delete-push-token')
  Future<void> deleteFcmToken(
    @Header('Authorization') String token,
    @Body() DeleteFcmTokenRequest request,
  );
}
