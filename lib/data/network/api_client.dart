import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:receptyUser/core/app/app_preference.dart';
import 'package:receptyUser/data/network/urls.dart';

import '../../core/app/app_dependency.dart';

const String applicationJson = "application/json";
const String contentType = "Content-Type";
const String accept = "Accept";
const String authorization = "Authorization";

enum Method { post, get, put, delete, patch }

class ApiClient {
  final AppPreferences _appPreferences;
  final Dio _dio;

  ApiClient(this._dio) : _appPreferences = instance.get() {
    initInterceptors();
  }

  void initInterceptors() {
    _dio.options.baseUrl = Urls.baseUrl;
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          Map<String, dynamic> header = <String, dynamic>{};
          header[contentType] = applicationJson;
          header[accept] = applicationJson;
          String token = await _appPreferences.getUserToken();
          if (token.isNotEmpty) {
            header[authorization] = "Bearer $token";
          }
          options.headers = header;
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (err, handler) {
          log('Status Code: ${err.response?.statusCode} Error Data: ${err.response?.data}');
          return handler.next(err);
        },
      ),
    );
  }

  Future<dynamic> request(
      {required String url,
      required Method method,
      Map<String, dynamic>? params}) async {
    Response response;
    log('Request url ======> ${_dio.options.baseUrl}$url');
    log('Request params ======> $params');
    try {
      if (method == Method.post) {
        response = await _dio.post(url, data: params);
      } else if (method == Method.delete) {
        response = await _dio.delete(url);
      } else if (method == Method.put) {
        response = await _dio.put(url, data: params);
      } else {
        response = await _dio.get(url, queryParameters: params);
      }
      log('Request response =========> ${response.data}');
      return response.data;
    } on DioError catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
