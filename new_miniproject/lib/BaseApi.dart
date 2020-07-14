import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class BaseApi {
  final Dio _dio = Dio();
  Response<dynamic> _returnResponse;
  bool error;
  // HTTP method for get, set arguments to your liking
  get({
    String url,
    Map<String, dynamic> params,
    String token,
    BuildContext context,
  }) async {
    print('url $url');
    error = false;
    final Response<dynamic> response = await _dio
        .get(
      url,
      queryParameters: params,
      options: Options(
        headers: {'Authorization': token},
      ),
    )
        .catchError((e) {
      error = true;
      _handleError(e, context);
    });
    if (!error) {
      _returnResponse = _statusCodeHandler(response);
    }
    return _returnResponse;
  }
  // HTTP method for post, set arguments to your liking
  post({url, token, data, context}) async {
    error = false;
    Response response = await _dio
        .post(
      url,
      options: Options(headers: {'Authorization': token}),
      data: data,
    )
        .catchError((e) {
      error = true;
      _handleError(e, context);
    });
    if (!error) {
      _returnResponse = _statusCodeHandler(response);
    }
    return _returnResponse;
  }
  _handleError(e, context) {
    print('response dioerror: ${e.response}');
    _returnResponse = _statusCodeHandler(e.response);
  }
  Response<dynamic> _statusCodeHandler(Response response) {
    switch (response.statusCode) {
      case 200:
        print('200 => ${response.toString()}');
        return response;
      case 400:
        print('400 => ${response.toString()}');
        return response;
      case 401:
        print('401 => ${response.toString()}');
        return response;
      case 403:
        print('403 => ${response.toString()}');
        return response;
      case 500:
        print('500 => ${response.toString()}');
        return response;
      default:
        print('unknown => ${response.toString()}');
        return response;
    }
  }
}