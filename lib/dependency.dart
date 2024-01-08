import 'package:demo_front/api/auth_api.dart';
import 'package:demo_front/api/cat_api.dart';
import 'package:demo_front/api/cloud_messaging_api.dart';
import 'package:demo_front/api/common/authorization_interceptor.dart';
import 'package:demo_front/api/common/device_info.dart';
import 'package:demo_front/data/storage.dart';
import 'package:demo_front/data/web_socket_repository.dart';
import 'package:dio/dio.dart';

class Dependency {
  static final Dio dio = Dio(BaseOptions(baseUrl: 'http://192.168.1.65:8080/'));
  static final CatApi catApi = CatApi(dio);
  static final AuthApi authApi = AuthApi(dio);
  static final DeviceInfo deviceInfo = DeviceInfo();
  static final CloudMessagingApi cloudMessagingApi = CloudMessagingApi(dio);
  static final WebSocketRepository webSocketRepository = WebSocketRepository();
  static late Storage storage;
  static late AuthorizationInterceptor authorizationInterceptor;
}
