import 'package:demo_front/api/request/login_request.dart';
import 'package:demo_front/api/request/register_request.dart';
import 'package:demo_front/model/cat.dart';
import 'package:demo_front/model/token_response.dart';
import 'package:demo_front/model/user.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(
    Dio dio, {
    String baseUrl,
  }) = _AuthApi;

  @POST('/register')
  Future<void> register(@Body() RegisterRequest registerRequest);

  @POST('/login')
  Future<TokenResponse> login(@Body() LoginRequest loginRequest);

  @GET('/user')
  Future<User> getUser();
}
