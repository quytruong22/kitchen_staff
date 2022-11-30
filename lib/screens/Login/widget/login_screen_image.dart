import 'package:chef_application/repos/service/login_service.dart';
import 'package:flutter/material.dart';

import '../../../config/theme.dart';

class LoginScreenImage extends StatelessWidget {
  const LoginScreenImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: defaultPadding * 2),
        Container(
          width: 390,
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
            children: [
              Expanded(
                flex: 8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: FutureBuilder(
                      future: LoginService().getRestaurantImage(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          String imageLink = snapshot.requireData;
                          if (imageLink != "") {
                            return Image.network(imageLink);
                          } else {
                            return const Icon(Icons.error);
                          }
                        }
                        return const Center(child: CircularProgressIndicator());
                      }),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}
