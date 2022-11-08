import 'package:chef_application/common/widgets/warning_popup.dart';
import 'package:chef_application/repos/service/login_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../config/theme.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  static const List<String> roles = ['WAITER', 'CASHIER'];

  Future<String> loginToSystem(String user, String password) async {
    LoginService service = LoginService();
    String result = await service.login(user, password);
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
                backgroundColor: activeColor,
              ),
              onPressed: () async {
                String result = await loginToSystem(user, password);
                if (result == "KITCHEN_STAFF") {
                  Navigator.of(context).pushReplacementNamed('/order');
                } else if (roles.contains(result)) {
                  showDialog(
                      context: context,
                      builder: (context) => WarningPopUp(
                          msg: 'Vai trò của tài khoản không phù hợp.'));
                } else {
                  showDialog(
                      context: context,
                      builder: (context) => WarningPopUp(msg: result));
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
                backgroundColor: voidColor,
              ),
              onPressed: () {
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
