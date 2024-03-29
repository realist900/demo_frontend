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
