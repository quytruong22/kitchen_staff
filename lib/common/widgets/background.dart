import 'package:flutter/material.dart';
import 'package:chef_application/config/theme.dart';

class Background extends StatelessWidget {
  final Widget child;
  final Color color;

  const Background({Key? key, required this.child, required this.color
      // this.topImage = "",
      // this.bottomImage = "",
      })
      : super(key: key);

  // final String topImage, bottomImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: color,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            // Positioned(
            //   top: 0,
            //   left: 0,
            //   child: Image.asset(
            //     topImage,
            //     width: 120,
            //   ),
            // ),
            // Positioned(
            //   bottom: 0,
            //   right: 0,
            //   child: Image.asset(bottomImage, width: 120),
            // ),
            SafeArea(child: child),
          ],
        ),
      ),
    );
  }
}