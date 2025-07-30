import 'dart:io';

import 'package:city17/src/core/utils/shared_pref_utils.dart';
import 'package:dio/dio.dart';

enum DioMethod { get, post, put, patch, delete }

class APIServices {
  APIServices._singleton();

  static final APIServices instance = APIServices._singleton();

  String get baseUrl => 'https://city17-production.up.railway.app';
  // 'http://192.168.1.14:5000';

  String get baseVersionUrl {
    return '$baseUrl/api/v1';
  }

  Future<Response> request(
    String endpoint,
    DioMethod method, {
    Map<String, dynamic>? param,

    String? contentType,
    formData,
  }) async {
    try {
      final dio = Dio(
        BaseOptions(
          baseUrl: baseVersionUrl,

          contentType: contentType ?? Headers.formUrlEncodedContentType,
          headers: {
            if (currentLoginInfo != null && currentLoginInfo?.token != null)
              HttpHeaders.authorizationHeader:
                  'Bearer ${currentLoginInfo?.token}',
          },
        ),
      );

      switch (method) {
        case DioMethod.post:
          return await dio.post(endpoint, data: param ?? formData);
        case DioMethod.get:
          return await dio.get(endpoint, queryParameters: param);
        case DioMethod.put:
          return dio.put(endpoint, data: param ?? formData);
        case DioMethod.patch:
          return dio.patch(endpoint, data: param ?? formData);
        case DioMethod.delete:
          return dio.delete(endpoint, queryParameters: param ?? formData);

        default:
          return dio.post(endpoint, data: param ?? formData);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}



//auth/google-login