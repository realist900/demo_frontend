import 'dart:convert';

import 'package:demo_front/data/storage.dart';
import 'package:dio/dio.dart';

class AuthorizationInterceptor extends QueuedInterceptorsWrapper {
  final Storage _storage;

  AuthorizationInterceptor({
    required Storage storage,
  }) : _storage = storage;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String? token = _storage.accessToken;

    if (token != null && token.isNotEmpty) {
      options.headers.addAll(
        <String, String>{'Authorization': 'Bearer $token'},
      );
    }
    var d = cURLRepresentation(options);
    print(cURLRepresentation(options));
    handler.next(options);
  }

  // @override
  // void onError(
  //     DioError err,
  //     ErrorInterceptorHandler handler,
  //     ) async {
  //   if (err.response?.statusCode == 401) {
  //     final refreshToken = _storage.refreshToken;
  //     if (refreshToken == null || refreshToken.isEmpty) {
  //       _authorizationRepository.logout();
  //
  //       return handler.next(err);
  //     }
  //     try {
  //       final RequestOptions requestOptions = err.response!.requestOptions;
  //       final Dio dioRefresh = Dio(
  //         BaseOptions(
  //           baseUrl: requestOptions.baseUrl,
  //           headers: requestOptions.headers,
  //         ),
  //       );
  //       final TokenRepository tokenRepository = TokenRepositoryImpl(TokenApi(dioRefresh));
  //       final Authorization authorization = await tokenRepository.refresh(refreshToken);
  //       await _storage.saveTokens(
  //         access: authorization.accessToken.token,
  //         refresh: authorization.refreshToken.token,
  //       );
  //       requestOptions.headers['Authorization'] = 'Bearer ${authorization.accessToken}';
  //       final Options options = Options(
  //         method: requestOptions.method,
  //         headers: requestOptions.headers,
  //       );
  //
  //       final Response<dynamic> response = await dioRefresh.request<dynamic>(
  //         requestOptions.path,
  //         data: requestOptions.data,
  //         queryParameters: requestOptions.queryParameters,
  //         options: options,
  //       );
  //
  //       return handler.resolve(response);
  //     } on DioError {
  //       if (err.response?.statusCode == 401) {
  //         _authorizationRepository.logout();
  //       }
  //     }
  //   }
  //   handler.next(err);
  // }

  String cURLRepresentation(RequestOptions options) {
    List<String> components = ['\$ curl -i'];
    // if (options.method.toUpperCase() == 'GET') {
    //   components.add('-X ${options.method}');
    // }

    components.add('-X ${options.method}');

    options.headers.forEach((
      k,
      v,
    ) {
      if (k != 'Cookie') {
        components.add('-H \'$k: $v\'');
      }
    });

    var data = jsonEncode(options.data);
    data = data.replaceAll(
      '\'',
      '\\\'',
    );
    components.add('-d \'$data\'');

    components.add('\'${options.uri.toString()}\'');

    return components.join('\\\n\t');
  }
}
