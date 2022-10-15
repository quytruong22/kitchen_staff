import 'package:chef_application/common/widgets/action_button.dart';
import 'package:chef_application/common/widgets/background.dart';
import 'package:chef_application/common/widgets/side_bar.dart';
import 'package:chef_application/screens/List_of_order/widget/list_location.dart';
import 'package:chef_application/screens/List_of_order/widget/order.dart';
import 'package:flutter/material.dart';

import 'package:chef_application/config/theme.dart';

class ListOrder extends StatefulWidget {
  @override
  State<ListOrder> createState() => _ListOrderState();
}

class _ListOrderState extends State<ListOrder> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        color: textLightColor,
        child: SafeArea(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SideBar(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(
                    child: Column(
                  children: [
                    Container(
                      width: size.width - defaultPadding * 6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OrderView(),
                          OrderView(),
                          OrderView(),
                          OrderView()
                        ],
                      ),
                    )
                  ],
                )),
                Container(
                  color: primaryColor,
                  width: size.width - defaultPadding * 6,
                  height: size.height * 0.14,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ActionButton(
                          text: "HOÀN THÀNH",
                          press: () {},
                          icon: Icons.fastfood,
                          color: warningColor),
                      ActionButton(
                          text: "TRẢ LẠI",
                          press: () {},
                          icon: Icons.no_food,
                          color: voidColor),
                      ListLocation()
                    ],
                  ),
                )
              ],
            )
          ],
        )));
  }
}
