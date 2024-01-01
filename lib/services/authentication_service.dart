import 'package:aisu_realestate/app/app.locator.dart';
import 'package:aisu_realestate/models/login_payload.dart';
import 'package:aisu_realestate/models/user_model.dart';
import 'package:aisu_realestate/services/pocketbase_service.dart';
import 'package:aisu_realestate/ui/common/app_colors.dart';
import 'package:aisu_realestate/ui/common/box_text.dart';
import 'package:aisu_realestate/utils/env.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthenticationService with ListenableServiceMixin {
  AuthenticationService() {
    listenToReactiveValues([
      _userData,
    ]);
  }

  final ReactiveValue<UserModel> _userData =
      ReactiveValue<UserModel>(defaultUser);
  UserModel get userData => _userData.value;

  final _pocketBaseService = locator<PocketBaseService>();

  late Dio _dio;
  final String _errorMessage = '';
  String get errorMessage => _errorMessage;

  updateUser(UserModel value) {
    _userData.value = value;
    notifyListeners();
  }

  // Future<bool> login(LoginPayload payload) async {
  //   try {
  //     _dio = await DioClient().publicDio();
  //     final response = await _dio.post(
  //       "${env!.baseUrl}${RealEstateUrls.login}",
  //       data: payload.toJson(),
  //       options: Options(
  //         headers: {
  //           'Content-Type': 'application/json',
  //         },
  //       ),
  //     );
  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> data = response.data;

  //       _userData.value = UserModel.fromJson(data);

  //       UserPreferences().saveUser(_userData.value);

  //       return true;
  //     }
  //   } on DioException catch (exception) {
  //     _errorMessage = exception.response!.data["message"].toString();

  //     if (_errorMessage.contains("Failed")) {
  //       _errorMessage = "$_errorMessage Check credentials";
  //     }
  //     // Fluttertoast.showToast(
  //     //     msg: _errorMessage,
  //     //     toastLength: Toast.LENGTH_SHORT,
  //     //     gravity: ToastGravity.BOTTOM,
  //     //     timeInSecForIosWeb: 1,
  //     //     backgroundColor: Colors.red,
  //     //     textColor: Colors.white,
  //     //     fontSize: 16.0);

  //     ScaffoldMessenger.of(StackedService.navigatorKey!.currentContext!)
  //         .showSnackBar(
  //       SnackBar(
  //         content: ManropeText.medium(_errorMessage, 14, kcWhiteColor),
  //         duration: const Duration(seconds: 2),
  //         backgroundColor: kcRedColor,
  //       ),
  //     );
  //   }

  //   return false;
  // }

  updateUserData(RecordModel data, token) {
    _userData.value.token = token.toString();
    _userData.value.record = Record.fromJson(data.toJson());

    notifyListeners();
  }

  Future<bool> loginPocket(LoginPayload payload) async {
    try {
      final landlordPocket = await _pocketBaseService.pb
          .collection('users')
          .authWithPassword(payload.identity, payload.password);

      if (landlordPocket.record == null) {
        return false;
      }
      final prefs = await SharedPreferences.getInstance();

      final store = AsyncAuthStore(
        save: (String data) async => prefs.setString('pb_auth', data),
        initial: prefs.getString('pb_auth'),
      );
      _pocketBaseService.pb = PocketBase(env!.baseUrl, authStore: store);
      _userData.value = UserModel.fromJson(landlordPocket.toJson());

      String dataShared = userModelToJson(_userData.value);

      prefs.setString('user_shared', dataShared);

      // String userModelToJson(UserModel data) => json.encode(data.toJson());

      return true;
    } on ClientException catch (e) {
      ScaffoldMessenger.of(StackedService.navigatorKey!.currentContext!)
          .showSnackBar(
        SnackBar(
          content: ManropeText.medium(e.response["message"], 14, kcWhiteColor),
          duration: const Duration(seconds: 2),
          backgroundColor: kcRedColor,
        ),
      );
      // Fluttertoast.showToast(
      //     msg: e.response["message"],
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 5,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
      return false;
    }
  }

  Future<bool> logoutPocket() async {
    try {
      _pocketBaseService.pb.authStore.clear();

      // if (landlordPocket.record == null) {
      //   return false;
      // }
      final prefs = await SharedPreferences.getInstance();

      prefs.clear();

      // final store = AsyncAuthStore(
      //   save: (String data) async => prefs.setString('pb_auth', data),
      //   initial: prefs.getString('pb_auth'),
      // );
      // _pocketBaseService.pb = PocketBase(env!.baseUrl, authStore: store);
      // _userData.value = UserModel.fromJson(landlordPocket.toJson());

      // String dataShared = userModelToJson(_userData.value);

      // prefs.setString('user_shared', dataShared);

      // String userModelToJson(UserModel data) => json.encode(data.toJson());

      return true;
    } on ClientException catch (e) {
      ScaffoldMessenger.of(StackedService.navigatorKey!.currentContext!)
          .showSnackBar(
        SnackBar(
          content: ManropeText.medium(e.response["message"], 14, kcWhiteColor),
          duration: const Duration(seconds: 2),
          backgroundColor: kcRedColor,
        ),
      );
      // Fluttertoast.showToast(
      //     msg: e.response["message"],
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 5,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
      return false;
    }
  }
}
