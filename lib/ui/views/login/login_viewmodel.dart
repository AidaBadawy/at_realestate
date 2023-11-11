import 'package:aisu_realestate/app/app.locator.dart';
import 'package:aisu_realestate/app/app.router.dart';
import 'package:aisu_realestate/models/login_payload.dart';
import 'package:aisu_realestate/services/authentication_service.dart';
import 'package:aisu_realestate/ui/common/enums.dart';
import 'package:aisu_realestate/ui/views/login/login_view.form.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();

  final _authenticationService = locator<AuthenticationService>();

  bool _showPassword = true;
  bool get showPassword => _showPassword;

  bool _isKeyboardOpen = false;
  bool get isKeyboardOpen => _isKeyboardOpen;

  StatusEnum _status = StatusEnum.idle;
  StatusEnum get status => _status;

  final loginKey = GlobalKey<FormState>();

  setIsKeyboardOpen(bool value) {
    _isKeyboardOpen = value;
  }

  setShowPassword() {
    _showPassword = !_showPassword;
    notifyListeners();
  }

  setStatus(StatusEnum value) {
    _status = value;
    notifyListeners();
  }

  String? validateEmail(String value) {
    // Regular expression for basic email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Please Enter a valid email';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty || value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  loginFunc() async {
    if (loginKey.currentState!.validate()) {
      setStatus(StatusEnum.busy);
      LoginPayload payload =
          LoginPayload(identity: emailValue!, password: passwordValue!);
      bool isLogin = await _authenticationService.login(payload);

      if (isLogin) {
        _navigationService.replaceWithWrapperView();
      }

      setStatus(StatusEnum.idle);
    }
  }
}
