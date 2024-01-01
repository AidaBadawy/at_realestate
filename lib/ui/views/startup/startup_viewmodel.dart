import 'package:aisu_realestate/services/authentication_service.dart';
import 'package:aisu_realestate/services/pocketbase_service.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:stacked/stacked.dart';
import 'package:aisu_realestate/app/app.locator.dart';
import 'package:aisu_realestate/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationService>();
  final _pocketBaseService = locator<PocketBaseService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));

    AsyncAuthStore asyncUser = await _pocketBaseService.isUserValid();

    if (asyncUser.isValid) {
      RecordModel data = asyncUser.model;

      _authenticationService.updateUserData(data, asyncUser.token);
      _navigationService.replaceWithWrapperView();
    } else {
      _navigationService.replaceWithLoginView();
    }

    // String userString = await UserPreferences().getUser();

    // _navigationService.replaceWithLoginView();

    // if (userString == "") {
    //   _navigationService.replaceWithLoginView();
    // } else {
    //   UserModel user = userModelFromJson(userString);

    //   _authenticationService.updateUser(user);

    //   _navigationService.replaceWithWrapperView();
    // }

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic
  }
}
