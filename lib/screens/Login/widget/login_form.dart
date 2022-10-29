import 'package:chef_application/repos/service/login_service.dart';
import 'package:chef_application/repos/repository/socket.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../config/theme.dart';

class LoginForm extends StatelessWidget {
  Socket socket;
  LoginForm({Key? key, required this.socket}) : super(key: key);

  Future<bool> loginToSystem(String user, String password) async {
    LoginService service = LoginService();
    bool result = await service.login(user, password);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    String user = "";
    String password = "";
    return Form(
      child: Column(
        children: [
          const SizedBox(height: defaultPadding * 3),
          TextFormField(
            onChanged: (value) {
              user = value;
            },
            textInputAction: TextInputAction.next,
            cursorColor: primaryColor,
            decoration: const InputDecoration(
              fillColor: deactiveLightColor,
              hintText: "Tài khoản",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              onChanged: (value) {
                password = value;
              },
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: textColor,
              decoration: const InputDecoration(
                fillColor: deactiveLightColor,
                hintText: "Mật khẩu",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: activeColor,
              ),
              onPressed: () async {
                if (await loginToSystem(user, password)) {
                  Navigator.of(context).pushNamed('/order', arguments: socket);
                }
              },
              child: Text(
                "Đăng nhập".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "close_btn",
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: voidColor,
              ),
              onPressed: () {
                socket.disconnectServer();
                SystemNavigator.pop();
              },
              child: Text(
                "Thoát".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}
