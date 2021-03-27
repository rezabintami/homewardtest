import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:homewardtest/utils/v_const.dart';

class ApiClient {
  get(
      {@required
          String url,
      Map<String, String> params,
      Map<String, dynamic> headers,
      @required
          ValueChanged callback(int code, String message, dynamic res)}) async {
    print("request: $url");

    try {
      Response response = await Dio().get(url,
          queryParameters: params, options: Options(headers: headers));
      callback(response.statusCode, response.statusMessage, response.data);
    } on DioError catch (e) {
      print(e);
      switch (e.type) {
        case DioErrorType.CANCEL:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.SEND_TIMEOUT:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.RESPONSE:
          if (e.response.data is String)
            callback(e.response.statusCode,
                "Server kami sedang dalam perbaikan", e.response.data);
          else
            callback(e.response.statusCode, e.response.data["stat_msg"],
                e.response.data);
          break;
        case DioErrorType.DEFAULT:
          callback(503, "Network Error", null);
          break;
      }
    }
  }

  post(
      {@required String url,
      Map<String, dynamic> headers,
      Map<String, dynamic> body,
      @required ValueChanged callback(int code, String message, res)}) async {
    try {
      Response response =
          await Dio().post(url, options: Options(headers: headers), data: body);
      callback(response.statusCode, response.data["stat_msg"], response.data);
    } on DioError catch (e) {
      print(e);
      switch (e.type) {
        case DioErrorType.CANCEL:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.SEND_TIMEOUT:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.RESPONSE:
          if (e.response.data is String)
            callback(e.response.statusCode, VConst.fail, e.response.data);
          else
            callback(e.response.statusCode, e.response.data["stat_msg"],
                e.response.data);
          break;
        case DioErrorType.DEFAULT:
          callback(503, VConst.internet, null);
          break;
      }
    }
  }

  delete(
      {@required String url,
      Map<String, dynamic> headers,
      Map<String, dynamic> body,
      @required ValueChanged callback(int code, String message, res)}) async {
    // headers["Content-Type"] =  Headers.jsonContentType;

    print("request: $url");
    print("body: $body");

    try {
      Response response = await Dio()
          .delete(url, options: Options(headers: headers), data: body);
      callback(response.statusCode, response.data["stat_msg"], response.data);
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.CANCEL:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.SEND_TIMEOUT:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.RESPONSE:
          if (e.response.data is String)
            callback(e.response.statusCode, VConst.fail, e.response.data);
          else
            callback(e.response.statusCode, e.response.data["stat_msg"],
                e.response.data);
          break;
        case DioErrorType.DEFAULT:
          callback(503, VConst.internet, null);
          break;
      }
    }
  }

  put(
      {@required String url,
      Map<String, dynamic> headers,
      Map<String, String> params,
      Map<String, dynamic> body,
      @required ValueChanged callback(int code, String message, res)}) async {
    print("request: $url");
    try {
      Response response = await Dio().put(
        url,
        queryParameters: params,
        options: Options(headers: headers),
        data: body,
      );
      print("put ${response.statusCode}");
      callback(response.statusCode, response.data["stat_msg"], response.data);
    } on DioError catch (e) {
      print(e);
      switch (e.type) {
        case DioErrorType.CANCEL:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.SEND_TIMEOUT:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.RESPONSE:
          if (e.response.data is String)
            callback(e.response.statusCode, VConst.fail, e.response.data);
          else
            callback(e.response.statusCode, e.response.data["stat_msg"],
                e.response.data);
          break;
        case DioErrorType.DEFAULT:
          callback(503, VConst.internet, null);
          break;
      }
    }
  }
}
