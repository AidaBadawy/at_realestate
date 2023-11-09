import 'package:aisu_realestate/models/user_model.dart';
import 'package:aisu_realestate/services/dio_client.dart';
import 'package:aisu_realestate/ui/common/api.url.dart';
import 'package:aisu_realestate/utils/env.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';

class AuthenticationService with ListenableServiceMixin {
  AuthenticationService() {
    listenToReactiveValues([
      _userData,
    ]);
  }

  final ReactiveValue<UserModel> _userData =
      ReactiveValue<UserModel>(defaultUser);
  UserModel get userData => _userData.value;

  late Dio _dio;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<bool> login() async {
    try {
      _dio = await DioClient().publicDio();
      final response = await _dio.get(
        "${env!.baseUrl}${RealEstateUrls.login}",
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;

        _userData.value = UserModel.fromJson(data);

        return true;
      }
    } on DioException catch (exception) {
      _errorMessage = exception.message.toString();
      Fluttertoast.showToast(
          msg: _errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    return false;
  }
}
