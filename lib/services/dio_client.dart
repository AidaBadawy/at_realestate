import 'package:aisu_realestate/utils/env.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  var tokenDio = Dio();
  final _publicDio = Dio();

  // Future<Dio> initDio() async {
  //   _dio.interceptors.add(
  //     PrettyDioLogger(
  //       requestHeader: true,
  //       requestBody: true,
  //       responseBody: true,
  //       responseHeader: false,
  //       compact: false,
  //     ),
  //   );

  //   _dio.options.baseUrl = env!.baseUrl;
  //   tokenDio.options = _dio.options;

  //   // if (tokenTime == '') {
  //   //   tokenDio
  //   //       .post('auth/refresh-tokens',
  //   //           data: json.encode({'refreshToken': refreshToken}))
  //   //       .then((d) {
  //   //     UserPreferences().setTokens(d.data);
  //   //     UserPreferences().setTokenTimeSaved(DateTime.now().toString());
  //   //   });
  //   // } else if (DateTime.now().difference(DateTime.parse(tokenTime)).inMinutes >=
  //   //     58) {
  //   //   tokenDio
  //   //       .post('auth/refresh-tokens',
  //   //           data: json.encode({'refreshToken': refreshToken}))
  //   //       .then((d) {
  //   //     UserPreferences().setTokens(d.data);
  //   //     UserPreferences().setTokenTimeSaved(DateTime.now().toString());
  //   //   });
  //   // }

  //   String? accessToken = await UserPreferences().getAccessToken();

  //   // print('accessToken Before ===>>>>' + accessToken);
  //   // print('Date Difference' +
  //   //     DateTime.now()
  //   //         .difference(DateTime.parse(tokenTime))
  //   //         .inMinutes
  //   //         .toString());

  //   _dio.interceptors.add(QueuedInterceptorsWrapper(
  //     onRequest: (options, handler) {
  //       print(
  //           'send request：path:${options.path}，baseURL:${options.baseUrl} accessToken:$accessToken');
  //       if (accessToken == "" ||
  //           accessToken == null ||
  //           DateTime.now().difference(DateTime.parse(tokenTime)).inMinutes >=
  //               30) {
  //         print('no token，request token firstly...');
  //         tokenDio
  //             .post('auth/refresh-tokens',
  //                 data: json.encode({'refreshToken': refreshToken}))
  //             .then((d) {
  //           UserPreferences().setTokens(d.data);
  //           UserPreferences().setTokenTimeSaved(DateTime.now().toString());
  //           options.headers['Authorization'] = accessToken =
  //               "Bearer ${d.data['data']['tokens']['access']['token']}";
  //           refreshToken = d.data['data']['tokens']['refresh']['token'];
  //           handler.next(options);
  //         }).catchError((error, stackTrace) {
  //           handler.reject(error, true);
  //         });
  //       } else {
  //         print(tokenTime);
  //         print('Has token $accessToken');
  //         options.headers['Authorization'] = "Bearer $accessToken";
  //         return handler.next(options);
  //       }
  //     },
  //     onError: (error, handler) {
  //       //print(error);
  //       // Assume 401 stands for token expired
  //       if (error.response?.statusCode == 401) {
  //         var options = error.response!.requestOptions;
  //         var bearerToken = "Bearer $accessToken";
  //         // If the token has been updated, repeat directly.
  //         if (bearerToken != options.headers['Authorization']) {
  //           options.headers['Authorization'] = bearerToken;
  //           //repeat
  //           _dio.fetch(options).then(
  //             (r) => handler.resolve(r),
  //             onError: (e) {
  //               handler.reject(e);
  //             },
  //           );
  //           return;
  //         }
  //         print('${json.encode({'refreshToken': refreshToken})} JSON TOKEN');
  //         tokenDio
  //             .post('auth/refresh-tokens',
  //                 data: json.encode({'refreshToken': refreshToken}))
  //             .then((d) {
  //           //update csrfToken
  //           // options.headers['csrfToken'] = csrfToken = d.data['data']['token'];
  //           print('${d.data} d.data');

  //           UserPreferences().setTokens(d.data);
  //           UserPreferences().setTokenTimeSaved(DateTime.now().toString());

  //           accessToken = d.data['data']['tokens']['access']['token'];
  //           refreshToken = d.data['data']['tokens']['refresh']['token'];
  //           options.headers['Authorization'] = "Bearer $accessToken";
  //         }).then((e) {
  //           //repeat
  //           _dio.fetch(options).then(
  //             (r) => handler.resolve(r),
  //             onError: (e) {
  //               handler.reject(e);
  //             },
  //           );
  //         }).catchError((err) {
  //           print('catchError $err');
  //           handler.reject(err);
  //         });
  //         return;
  //       }
  //       return handler.next(error);
  //     },
  //   ));

  //   return _dio;
  // }

  Future<Dio> publicDio() async {
    _publicDio.interceptors.addAll([
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
      ),
      CustomInterceptors()
    ]);

    _publicDio.options.baseUrl = env!.baseUrl;
    _publicDio.options.connectTimeout = const Duration(seconds: 10);
    _publicDio.options.receiveTimeout = const Duration(seconds: 10);

    return _publicDio;
  }
}

// import 'package:dio/dio.dart';
class CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
