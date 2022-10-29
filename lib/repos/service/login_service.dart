import 'package:chef_application/repos/repository/login_repository.dart';

class LoginService {
  LoginRepository respo = LoginRepository();

  Future<bool> login(String user, String password) async {
    return respo.login(user, password);
  }

  Future<bool> logout() async {
    return respo.logout();
  }

  bool checkLoggedIn() {
    return respo.checkLoggedIn();
  }
}
