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
  @override
  Widget build(BuildContext context) {
    return Background(
      color: primaryColor,
      child: SingleChildScrollView(
        child: Responsive(
          tablet: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const LoginScreenImage(),
              Container(
                height: 390,
                width: 420,
                decoration: BoxDecoration(
                  color: textLightColor,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: const [
                    BoxShadow(
                      color: shadowColor,
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 360,
                      child: LoginForm(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
