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
          width: 300,
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
          child: Row(
            children: [
              // const Spacer(),
              Expanded(
                flex: 8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                      'https://cdn.discordapp.com/attachments/900392963639750657/1034099310419267654/Logo.png'),
                ),
              ),
              // const Spacer(),
            ],
          ),
        ),
        const SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}
