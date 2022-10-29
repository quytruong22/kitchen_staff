import 'package:chef_application/repos/service/login_service.dart';
import 'package:flutter/material.dart';
import '../../config/theme.dart';

class SideBar extends StatefulWidget {
  final int selectedIndex;
  SideBar({required this.selectedIndex});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  LoginService service = LoginService();

  @override
  Widget build(BuildContext context) {
    Color order = deactiveColor;
    Color item = deactiveColor;
    if (widget.selectedIndex == 1) {
      order = textLightColor;
    }
    if (widget.selectedIndex == 2) {
      item = textLightColor;
    }
    return Stack(
      children: <Widget>[
        Container(
          color: sideBarColor,
          child: SizedBox(
            height: MediaQuery.of(context).size.height - defaultPadding * 1.5,
            width: MediaQuery.of(context).size.width / 14,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/order');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: sideBarColor,
                      ),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.shower,
                            size: 50,
                            color: order,
                          ),
                          Text(
                            "MÓN ĐANG NẤU",
                            style: TextStyle(
                              fontSize: 10.5,
                              fontWeight: FontWeight.w700,
                              color: order,
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
                      ),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.book,
                            size: 50,
                            color: item,
                          ),
                          Text(
                            "DANH SÁCH MÓN ĂN",
                            style: TextStyle(
                              fontSize: 10.5,
                              fontWeight: FontWeight.w700,
                              color: item,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () async {
                    if (await service.logout()) {
                      Navigator.of(context).pushReplacementNamed('/login');
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: sideBarColor,
                  ),
                  child: Column(
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
