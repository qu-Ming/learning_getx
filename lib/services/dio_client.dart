import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:learning_getx/models/response_model.dart';

import '../utils/utils.dart';
import 'methods.dart';

class DioClient implements Methods {
  late Dio currentDio;
  late int sendTimeout;
  late int receiveTimeout;

  late CancelToken cancelToken = CancelToken();

  DioClient(
      {required Dio dio,
      int? sendTimeout,
      int? receiveTimeout,
      CancelToken? cancelToken}) {
    currentDio = dio;
    sendTimeout = sendTimeout ?? 15000;
    receiveTimeout = receiveTimeout ?? 15000;
    if (cancelToken != null) {
      this.cancelToken = cancelToken;
    }
    currentDio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // ignore: avoid_print
        print("onRequest: ${options.method} ${options.path}");
        return handler.next(options);
      },
      onResponse: (response, handler) {
        // print('onResponse');
        // print(response.data);
        return handler.next(response);
      },
      onError: (DioError e, handler) {
        // print('DioError');
        return handler.next(e);
      },
    ));
    // currentDio.interceptors.add(LogInterceptor(
    //   requestHeader: false,
    //   responseHeader: false,
    //   requestBody: true,
    //   responseBody: true,
    // ));
  }

  @override
  Future<dynamic> getAsync(
    String url, {
    String id = '',
    Map<String, dynamic>? queryParams,
    required Function callBack,
    required Function errorCallBack,
    CancelToken? cancelToken,
  }) async {
    if (await Utils.checkInternetConnections()) {
      Response response;
      try {
        response = await currentDio.get<void>(
          url,
          queryParameters: queryParams,
          options: Options(
            headers: getHeader(id: id),
            // sendTimeout: sendTimeout,
            // receiveTimeout: receiveTimeout,
            validateStatus: (status) {
              return status! <= 500;
            },
          ),
          cancelToken: this.cancelToken,
          onReceiveProgress: (int sent, int total) {
            // print('onReceiveProgress');
          },
        );

        // ignore: avoid_print
        print('onResponse: $response');

        _progressResponse(response,
            callBack: callBack, errorCallBack: errorCallBack);
      } on DioError catch (e) {
        _handError(errorCallBack, e.toString());
      } on SocketException catch (e) {
        _handError(errorCallBack, e.toString());
      } catch (e) {
        _handError(errorCallBack, e.toString());
      }
    } else {
      _handError(errorCallBack, "error");
    }
  }

  @override
  Future<dynamic> postAsync(
    String url, {
    String id = '',
    Map<String, dynamic>? queryParams,
    required Map<String, dynamic> body,
    required Function errorCallBack,
    required Function callBack,
    Function? message,
    Function? messageEn,
    CancelToken? cancelToken,
  }) async {
    if (await Utils.checkInternetConnections()) {
      Response response;
      try {
        response = await currentDio.post<void>(
          url,
          data: jsonEncode(body),
          options: Options(
            // headers: getHeader(id: id),
            // sendTimeout: sendTimeout,
            // receiveTimeout: receiveTimeout,
            validateStatus: (status) {
              return status! <= 500;
            },
          ),
          cancelToken: this.cancelToken,
          onSendProgress: (int sent, int total) {
            // print('onSendProgress');
          },
          onReceiveProgress: (int sent, int total) {
            // print('onReceiveProgress');
          },
        );
        // ignore: avoid_print
        print('onResponse: $response');

        _progressResponse(response,
            callBack: callBack,
            errorCallBack: errorCallBack,
            message: message,
            messageEn: messageEn);
      } on DioError catch (e) {
        _handError(errorCallBack, e.toString());
      } on SocketException catch (e) {
        _handError(errorCallBack, e.toString());
      } catch (e) {
        // _handError(errorCallBack, e.toString());
      }
    } else {
      _handError(errorCallBack, "error");
    }
  }

  @override
  Future<dynamic> putAsync(
    String url, {
    String id = '',
    Map<String, dynamic>? queryParams,
    required Map<String, dynamic> body,
    required Function errorCallBack,
    required Function callBack,
    CancelToken? cancelToken,
  }) async {
    if (await Utils.checkInternetConnections()) {
      Response response;
      try {
        response = await currentDio.put<void>(
          url,
          queryParameters: queryParams,
          data: jsonEncode(body),
          options: Options(
            headers: getHeader(id: id),
            // sendTimeout: sendTimeout,
            // receiveTimeout: receiveTimeout,
            validateStatus: (status) {
              return status! <= 500;
            },
          ),
          cancelToken: this.cancelToken,
          onSendProgress: (int sent, int total) {
            // print('onSendProgress');
          },
          onReceiveProgress: (int sent, int total) {
            // print('onReceiveProgress');
          },
        );
        // ignore: avoid_print
        print('onResponse: $response');

        _progressResponse(response,
            callBack: callBack, errorCallBack: errorCallBack);
      } on DioError catch (e) {
        _handError(errorCallBack, e.toString());
      } on SocketException catch (e) {
        _handError(errorCallBack, e.toString());
      } catch (e) {
        _handError(errorCallBack, e.toString());
      }
    } else {
      _handError(errorCallBack, "error");
    }
  }

  static void _handError(Function errorCallback, String errorMessage) {
    errorCallback(errorMessage);
  }

  static void _progressResponse(Response response,
      {required Function errorCallBack,
      required Function callBack,
      Function? message,
      Function? messageEn}) {
    if (!((response.statusCode! < HttpStatus.ok) ||
        (response.statusCode! >= HttpStatus.multipleChoices) ||
        (response.data == null))) {
      final Map<String, dynamic> jsonMap =
          response.data as Map<String, dynamic>;
      final ResponseModel result = ResponseModel.fromJson(jsonMap);

      if (result.errorCode == 0) {
        callBack(result.data);
        message!(result.message);
        messageEn!(result.messageEn);
      } else {
        final String errorMessage = result.message.toString();
        _handError(errorCallBack, errorMessage);
        return;
      }
    } else {
      final String errorMessage = response.statusCode.toString();
      _handError(errorCallBack, errorMessage);
      return;
    }
  }
}
