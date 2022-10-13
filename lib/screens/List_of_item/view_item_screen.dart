import 'package:chef_application/common/widgets/background.dart';
import 'package:chef_application/common/widgets/side_bar.dart';
import 'package:flutter/material.dart';

import 'package:chef_application/config/theme.dart';

class ListItem extends StatefulWidget {
  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SafeArea(
            child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SideBar(),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Row(),
            ),
            Container(
              color: activeColor,
              width: size.width - defaultPadding * 6,
              height: size.height * 0.15,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Text('data'), Text('data')],
              ),
            )
          ],
        )
      ],
    )));
  }
}
