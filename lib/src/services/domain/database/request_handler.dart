import 'dart:developer' show log;
import 'package:get/get.dart' show GetxController;

import 'package:dio/dio.dart';

class RequestHandler extends GetxController {
  static const mainUrl = "https://secure-falls-43052.herokuapp.com/api";

  final Dio _dio = Dio();
  Dio get dio => _dio;

  updateToken({required String token}) async {
    log("#UpdatedToken: \$TOKEN => $token");
    dio.options.headers['Authorization'] = 'Bearer $token';
    dio.options.headers['Connection'] = 'keep-alive';
    update();
  }

  Future post(
    String url,
    dynamic params, {
    String? errorMsg,
    String? baseUrl,
    Options? options,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await dio.post(
        baseUrl ?? mainUrl + url,
        data: params,
        queryParameters: queryParams,
        options: options,
      );
      return response.data;
    } on DioError catch (error, stracktrace) {
      return RequestException(
        method: "/POST",
        url: baseUrl ?? mainUrl + url,
        data: params,
        error: error,
        msg: errorMsg,
        trace: stracktrace,
        res: error.response,
        statusCode: error.response?.statusCode,
      );
    } catch (error, stracktrace) {
      return RequestException(
        method: "/POST",
        url: baseUrl ?? mainUrl + url,
        msg: errorMsg,
        data: params,
        error: error,
        trace: stracktrace,
      );
    }
  }

  Future get(
    String url, {
    String? errorMsg,
    String? baseUrl,
    Options? options,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await dio.get(
        baseUrl ?? mainUrl + url,
        options: options,
        queryParameters: queryParams,
      );
      return response.data;
    } on DioError catch (error, stracktrace) {
      return RequestException(
        method: "/GET",
        url: baseUrl ?? mainUrl + url,
        error: error,
        msg: errorMsg,
        trace: stracktrace,
        res: error.response,
        statusCode: error.response?.statusCode,
      );
    } catch (error, stracktrace) {
      return RequestException(
        method: "/GET",
        url: baseUrl ?? mainUrl + url,
        msg: errorMsg,
        error: error,
        trace: stracktrace,
      );
    }
  }

  Future put(
    String url,
    Map<String, dynamic> params, {
    String? errorMsg,
    String? baseUrl,
    Options? options,
    Map<String, dynamic>? queryParams,
  }) async {
    Response response;
    try {
      response = await dio.put(
        baseUrl ?? mainUrl + url,
        data: params,
        queryParameters: queryParams,
        options: options,
      );
      return response.data;
    } on DioError catch (error, stracktrace) {
      return RequestException(
        method: "/PUT",
        url: baseUrl ?? mainUrl + url,
        data: params,
        error: error,
        msg: errorMsg,
        trace: stracktrace,
        res: error.response,
        statusCode: error.response?.statusCode,
      );
    } catch (error, stracktrace) {
      return RequestException(
        method: "/PUT",
        url: baseUrl ?? mainUrl + url,
        msg: errorMsg,
        data: params,
        error: error,
        trace: stracktrace,
      );
    }
  }
}

class RequestException implements Exception {
  String url;
  String? msg;
  Object error;
  String method;
  Response? res;
  int? statusCode;
  StackTrace trace;
  dynamic data;

  RequestException({
    this.msg,
    this.res,
    this.data,
    this.statusCode,
    required this.url,
    required this.method,
    required this.error,
    required this.trace,
  }) {
    log(
      """
/*
    method: "$method"
    statusCode: ${statusCode ?? 0}
    url: "$url
    errorMsg: "${msg ?? ''}"
    data: ${(data?.toString()) ?? ''}
    res: ${res ?? ''}
*/
     """,
      name: "#RequestException",
      time: DateTime.now(),
      error: error,
      stackTrace: trace,
    );
  }
}
