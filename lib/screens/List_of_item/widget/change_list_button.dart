import 'package:flutter/material.dart';

class ChangeListButton extends StatelessWidget {
  final String text;
  final Function() press;
  final IconData icon;
  final Color color;

  const ChangeListButton(
      {Key? key,
      required this.text,
      required this.press,
      required this.icon,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.height * 0.1,
      height: size.height * 0.1,
      child: ElevatedButton(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
              size: 34,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          ],
        ),
        onPressed: press,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            backgroundColor: color,
            elevation: 1,
            padding: EdgeInsets.zero),
      ),
    );
  }
}
