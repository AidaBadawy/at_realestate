import 'package:aisu_realestate/app/app.locator.dart';
import 'package:aisu_realestate/services/authentication_service.dart';
import 'package:aisu_realestate/ui/views/login/login_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SettingsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  final _authenticationService = locator<AuthenticationService>();

  logout() {
    _authenticationService.logoutPocket();
    _navigationService.clearStackAndShowView(const LoginView());
  }
}
