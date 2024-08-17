import 'package:bts_manager_app/models/setting.dart';
import 'package:bts_manager_app/models/user.dart';

class AuthenticationProvider {
  User? user;
  Setting? setting;
  void setUser(User user) {
    this.user = user;
  }

  String? getAccessToken() {
    return user?.accessToken;
  }
  User? getUser() {
    return user;
  }

  void setSetting(Setting setting) {
    this.setting = setting;
  }

  Setting? getSetting() {
    return setting;
  }
}
