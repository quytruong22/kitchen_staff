import 'package:chef_application/config/theme.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String text;
  final Function() press;
  final Color backgroundcolor;
  final Color txtColor;

  const MenuButton(
      {Key? key,
      required this.text,
      required this.press,
      required this.backgroundcolor,
      required this.txtColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      height: 75,
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
