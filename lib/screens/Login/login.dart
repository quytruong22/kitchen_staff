import 'package:chef_application/repos/socket.dart';
import 'package:flutter/material.dart';
import 'package:chef_application/config/theme.dart';

import '../../common/widgets/background.dart';
import '../../common/widgets/responsive.dart';
import 'widget/login_form.dart';
import 'widget/login_screen_image.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Socket socket = Socket();

  @override
  void initState() {
    super.initState();
    socket.declareSocket();
    socket.connectServer();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      color: primaryColor,
      child: SingleChildScrollView(
        child: Responsive(
          tablet: Row(
            children: [
              const Expanded(
                child: LoginScreenImage(),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: textLightColor,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: const [
                      BoxShadow(
                        color: shadowColor,
                        blurRadius: 4,
                        offset: Offset(0, 4), // Shadow position
                      ),
                    ],
                  ),
                  height: 390,
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 390,
                        child: LoginForm(socket: socket),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: defaultPadding * 3),
            ],
          ),
        ),
      ),
    );
  }
}
