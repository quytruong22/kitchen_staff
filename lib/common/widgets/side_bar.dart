import 'package:flutter/material.dart';
import '../../config/routes.dart';
import '../../config/theme.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: sideBarColor,
          child: SizedBox(
            height: MediaQuery.of(context).size.height - defaultPadding * 1.5,
            // width: defaultPadding * 6,
            width: MediaQuery.of(context).size.width / 14,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // mainAxisSize: MainAxisSize.max,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/order');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: sideBarColor,
                        // textStyle: GoogleFonts.fredokaOne(),
                      ),
                      // color: sideBarColor,
                      // padding: const EdgeInsets.all(20),
                      child: Column(
                        // Replace with a Row for horizontal icon + text
                        children: const <Widget>[
                          Icon(
                            Icons.shower,
                            size: 50,
                            color: textLightColor,
                          ),
                          Text(
                            "MÓN ĐANG NẤU",
                            style: TextStyle(
                              fontSize: 10.5,
                              fontWeight: FontWeight.w700,
                              color: textLightColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/item');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: sideBarColor,
                        // textStyle: GoogleFonts.fredokaOne(),
                      ),
                      // color: sideBarColor,
                      // padding: const EdgeInsets.all(20),
                      child: Column(
                        // Replace with a Row for horizontal icon + text
                        children: const <Widget>[
                          Icon(
                            Icons.book,
                            size: 50,
                            color: textLightColor,
                          ),
                          Text(
                            "DANH SÁCH MÓN ĂN",
                            style: TextStyle(
                              fontSize: 10.5,
                              fontWeight: FontWeight.w700,
                              color: textLightColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop('/login');
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: sideBarColor,
                  ),
                  // color: sideBarColor,
                  // padding: const EdgeInsets.all(20),
                  child: Column(
                    // Replace with a Row for horizontal icon + text
                    children: const <Widget>[
                      Icon(
                        Icons.logout,
                        size: 50,
                        color: textLightColor,
                      ),
                      Text(
                        'ĐĂNG XUẤT',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: textLightColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
