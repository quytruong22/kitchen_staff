import 'package:chef_application/common/widgets/action_button.dart';
import 'package:chef_application/common/widgets/background.dart';
import 'package:chef_application/common/widgets/side_bar.dart';
import 'package:chef_application/screens/List_of_item/widget/item_view.dart';
import 'package:chef_application/screens/List_of_item/widget/major_button.dart';
import 'package:flutter/material.dart';

import 'package:chef_application/config/theme.dart';

class ListItem extends StatefulWidget {
  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool selectedList = false;

  Widget ActionBar(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (selectedList) {
      return Container(
        color: primaryColor,
        width: size.width - size.width / 14,
        height: size.height * 0.12,
        child: Row(
          children: [
            Container(
              width: size.width - size.width / 14 - size.height * 0.12,
              alignment: Alignment.center,
              child: ActionButton(
                  text: "ĐÃ HẾT",
                  press: () {},
                  icon: Icons.remove_shopping_cart_outlined,
                  color: voidColor),
            ),
            ActionButton(
                text: "MÓN ĐÃ HẾT",
                press: () {
                  setState(() {
                    selectedList = false;
                  });
                },
                icon: Icons.book,
                color: voidColor),
          ],
        ),
      );
    } else
      return Container(
        color: primaryColor,
        width: size.width - size.width / 14,
        height: size.height * 0.12,
        child: Row(
          children: [
            Container(
              width: size.width - size.width / 14 - size.height * 0.12,
              alignment: Alignment.center,
              child: ActionButton(
                  text: "NHẬP HÀNG",
                  press: () {},
                  icon: Icons.add_shopping_cart,
                  color: activeColor),
            ),
            ActionButton(
                text: "MÓN HIỆN CÓ",
                press: () {
                  setState(() {
                    selectedList = true;
                  });
                },
                icon: Icons.book,
                color: activeColor),
          ],
        ),
      );
  }

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
                SizedBox(
                  width: size.width * 0.65,
                  height: size.height * 0.06,
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    cursorColor: primaryColor,
                    decoration: const InputDecoration(
                      fillColor: deactiveLightColor,
                      hintText: "Tìm kiếm món ăn",
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(0),
                        child: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                SizedBox(
                  height: size.height * 0.15,
                  width: size.width - defaultPadding * 6,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        MajorButton(
                            text: 'TẤT CẢ',
                            press: () {},
                            icon: Icons.restaurant_menu,
                            color: textLightColor),
                        SizedBox(
                          width: 10,
                        ),
                        MajorButton(
                            text: 'Khai vị',
                            press: () {},
                            icon: Icons.brunch_dining,
                            color: textLightColor),
                        SizedBox(
                          width: 10,
                        ),
                        MajorButton(
                            text: 'Món chính',
                            press: () {},
                            icon: Icons.rice_bowl,
                            color: textLightColor),
                        SizedBox(
                          width: 10,
                        ),
                        MajorButton(
                            text: 'Tráng miệng',
                            press: () {},
                            icon: Icons.cake,
                            color: textLightColor),
                        SizedBox(
                          width: 10,
                        ),
                        MajorButton(
                            text: 'Nước uống',
                            press: () {},
                            icon: Icons.local_drink,
                            color: textLightColor),
                        SizedBox(
                          width: 10,
                        ),
                        MajorButton(
                            text: 'Burger',
                            press: () {},
                            icon: Icons.lunch_dining,
                            color: textLightColor),
                        SizedBox(
                          width: 10,
                        ),
                        MajorButton(
                            text: 'Pizza',
                            press: () {},
                            icon: Icons.local_pizza,
                            color: textLightColor),
                        SizedBox(
                          width: 10,
                        ),
                        MajorButton(
                            text: 'Món nướng',
                            press: () {},
                            icon: Icons.kebab_dining,
                            color: textLightColor),
                        SizedBox(
                          width: 10,
                        ),
                        MajorButton(
                            text: 'Hải sản',
                            press: () {},
                            icon: Icons.set_meal,
                            color: textLightColor),
                        SizedBox(
                          width: 10,
                        ),
                        MajorButton(
                            text: 'Phở/Mì',
                            press: () {},
                            icon: Icons.ramen_dining,
                            color: textLightColor),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Expanded(
                    child: SizedBox(
                  width: size.width - defaultPadding * 6,
                  height: size.height * 0.65,
                  child: GridView.count(
                    crossAxisSpacing: 10,
                    crossAxisCount: 5,
                    children: [
                      CardItem(tap: () {}),
                      CardItem(tap: () {}),
                      CardItem(tap: () {}),
                      CardItem(tap: () {}),
                      CardItem(tap: () {}),
                      CardItem(tap: () {}),
                      CardItem(tap: () {}),
                      CardItem(tap: () {}),
                      CardItem(tap: () {}),
                      CardItem(tap: () {}),
                      CardItem(tap: () {}),
                      CardItem(tap: () {}),
                      CardItem(tap: () {}),
                      CardItem(tap: () {}),
                      CardItem(tap: () {}),
                      CardItem(tap: () {}),
                    ],
                  ),
                )),
                ActionBar(context)
              ],
            )
          ],
        )));
  }
}
