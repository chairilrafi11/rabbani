import 'dart:io';

import 'package:chairil/core/app/app.dart';
import 'package:dio/adapter.dart';
import 'package:chairil/core/util/core_function.dart';
import 'package:chairil/core/app/app_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../presentation/component/component_dialog.dart';

class DioService {
  static late Dio dio;

  static Future<Dio> checkConnection({
    bool showMessage = true,
    bool isLoading = false,
    bool isProvince = false,
    bool isGeocode = false,
    required dynamic tryAgainMethod,
    dynamic stopLoadingMethod,
    List<dynamic>? params,
  }) async {
    if (isLoading) {
      ComponentDialog.dialogLoading();
    }
    return await CoreFunction.checkConnectivity().then((internet) async {
      if (internet) {
        return await settingUpDio(
          showMessage: showMessage,
          isLoading: isLoading,
          params: params,
          tryAgainMethod: tryAgainMethod,
          stopLoadingMethod: stopLoadingMethod,
          isProvince: isProvince,
        ).catchError((e) {
          CoreFunction.logPrint('catchError error catched settingUpDio', e.toString());
        });
      } else {
        if (isLoading) {
          Navigator.pop(navGK.currentContext!);
        }
        ComponentDialog.info("Tidak dapat terhubung", "Pastikan handphone anda memiliki koneksi internet");
        return Dio();
      }
    });
  }

  static Future<Dio> settingUpDio(
      {bool showMessage = true,
      bool isLoading = false,
      bool isProvince = false,
      dynamic tryAgainMethod,
      dynamic stopLoadingMethod,
      dynamic params}) async {
    dio = Dio(await baseOptions(isProvince));

    try {
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions? requestOptions, handler) async {
            CoreFunction.logPrint("============= onRequest =============", "");
            handler.next(requestOptions!);
          },
          onResponse: (Response? response, handler) async {
            if (isLoading) {
              Navigator.pop(navGK.currentContext!);
            }

            CoreFunction.logPrint("============= onResponse =============", "");
            CoreFunction.logPrint("Response", response!.toString());

            handler.next(response);
          },
          onError: (DioError e, handler) async {
            CoreFunction.logPrint("============= onError =============", "");

            if (isLoading) {
              Navigator.pop(navGK.currentContext!);
            }

            //? Stop Loading From Layout
            if (stopLoadingMethod != null) stopLoadingMethod();

            if (e.type == DioErrorType.connectTimeout || e.type == DioErrorType.receiveTimeout || e.type == DioErrorType.sendTimeout) {
              ComponentDialog.info("Request Time Out", "Pastikan handphone anda memiliki koneksi internet");
            } else if (e.type == DioErrorType.other) {
              ComponentDialog.info("Tidak dapat terhubung", "Pastikan handphone anda memiliki koneksi internet");
            } else if (e.type == DioErrorType.response) {
              CoreFunction.logPrint("Error", e.toString());
            }

            handler.next(e);
            throw e.error;
          },
        ),
      );
    } catch (e) {
      CoreFunction.logPrint('rethrowing error', e.toString());
      rethrow;
    }

    dio.interceptors.add(PrettyDioLogger(
      error: AppConfig.debug,
      request: AppConfig.debug,
      requestBody: AppConfig.debug,
      requestHeader: AppConfig.debug,
      responseBody: AppConfig.debug,
      responseHeader: AppConfig.debug,
      compact: AppConfig.debug,
      maxWidth: 500
    ));
    
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      
  return client;
};

    return dio;
  }

  static Future<BaseOptions> baseOptions(bool isProvince) async {
    return BaseOptions(
      baseUrl: baseURL(isProvince),
      connectTimeout: Constant.timeRequestApi.inMilliseconds,
      receiveTimeout: Constant.timeRequestApi.inMilliseconds,
      sendTimeout: Constant.timeRequestApi.inMilliseconds,
      headers: {
        'Cache-Control': AppConfig.cacheControl,
        'Content-Type': AppConfig.contentType,
      }
    );
  }

  static String baseURL(bool isProvince) {
    if(isProvince){
      return AppConfig.urlProvince;
    } else {
      return AppConfig.urlStagging;
    }
  }
}
