import 'package:chef_application/config/theme.dart';
import 'package:flutter/material.dart';

class MajorButton extends StatelessWidget {
  final String text;
  final Function() press;
  final Color backgroundcolor;
  final Color txtColor;

  MajorButton(
      {required this.text,
      required this.press,
      required this.backgroundcolor,
      required this.txtColor});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.zero,
      width: size.height * 0.12,
      height: size.height * 0.07,
      child: ElevatedButton(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: txtColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
        onPressed: press,
        style: ElevatedButton.styleFrom(
            shadowColor: shadowColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            backgroundColor: backgroundcolor,
            elevation: 2,
            padding: EdgeInsets.zero),
      ),
    );
  }
}
