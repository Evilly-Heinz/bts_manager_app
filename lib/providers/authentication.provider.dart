import 'package:bts_manager_app/models/user.dart';

class AuthenticationProvider {
  User? user;
  void setUser(User user) {
    this.user = user;
  }

  String? getAccessToken() {
    return user?.accessToken;
  }
  User? getUser() {
    return user;
  }
}
