import 'package:aisu_realestate/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<bool> saveFirstTimeUser(bool isFirstTime) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isFirstTime', isFirstTime);
    return true;
  }

  getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userName =
        prefs.getString("name") != null ? prefs.getString("name")! : "";
    return userName;
  }

  Future<void> saveUser(UserModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = userModelToJson(user);

    prefs.setString('user_model', data);
  }

  getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user = prefs.getString("user_model") != null
        ? prefs.getString("user_model")!
        : "";
    return user;
  }
}
