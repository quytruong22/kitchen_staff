import 'package:chef_application/config/theme.dart';
import 'package:flutter/material.dart';

class LocationButton extends StatelessWidget {
  final String text;
  final Function() press;
  final IconData icon;
  final Color color;
  final bool isReminded;

  LocationButton(
      {required this.text,
      required this.press,
      required this.icon,
      required this.color,
      required this.isReminded});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.height * 0.1,
      height: size.height * 0.1,
      child: ElevatedButton(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Reminded(context)],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 34,
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        onPressed: press,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          backgroundColor: color,
          elevation: 1,
        ),
      ),
    );
  }

  Widget Reminded(BuildContext context) {
    if (isReminded) {
      return Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: voidColor),
      );
    } else
      return SizedBox(
        height: 10,
      );
  }
}
