import 'package:chef_application/config/theme.dart';
import 'package:flutter/material.dart';

class MajorButton extends StatelessWidget {
  final String text;
  final Function() press;
  final Color backgroundcolor;
  final Color txtColor;

  const MajorButton(
      {Key? key,
      required this.text,
      required this.press,
      required this.backgroundcolor,
      required this.txtColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      width: 75,
      height: 50,
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
