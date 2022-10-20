import 'dart:convert';

import 'package:chef_application/common/widgets/action_button.dart';
import 'package:chef_application/common/widgets/background.dart';
import 'package:chef_application/common/widgets/side_bar.dart';
import 'package:chef_application/repos/models/item_obj.dart';
import 'package:chef_application/screens/List_of_item/widget/change_list_button.dart';
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
  String title = 'Các món ăn hiện có';
  List<ItemDTO> list = [
    ItemDTO(id: '1'),
    ItemDTO(id: '2'),
    ItemDTO(id: '3'),
    ItemDTO(id: '4'),
    ItemDTO(id: '5'),
    ItemDTO(id: '6'),
    ItemDTO(id: '7'),
    ItemDTO(id: '8'),
    ItemDTO(id: '9'),
    ItemDTO(id: '10'),
    ItemDTO(id: '11'),
  ];

  Widget ActionBar(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (selectedList) {
      title = 'Các món ăn hiện có';
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
                  press: () {
                    List<ItemDTO> selectList = [];
                    for (var e in list) {
                      if (e.isSelected) {
                        selectList.add(e);
                      }
                    }
                    String jsonList = jsonEncode(selectList);
                    print(jsonList);
                  },
                  icon: Icons.remove_shopping_cart_outlined,
                  color: activeColor),
            ),
            ChangeListButton(
                text: "MÓN HIỆN CÓ",
                press: () {
                  setState(() {
                    selectedList = false;
                  });
                },
                icon: Icons.book,
                color: activeColor),
          ],
        ),
      );
    } else {
      title = 'Các món ăn đã hết';
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
                  press: () {
                    List<ItemDTO> selectList = [];
                    for (var e in list) {
                      if (e.isSelected) {
                        selectList.add(e);
                      }
                    }
                    String jsonList = jsonEncode(selectList);
                    print(jsonList);
                  },
                  icon: Icons.add_shopping_cart,
                  color: voidColor),
            ),
            ChangeListButton(
                text: "MÓN ĐÃ HẾT",
                press: () {
                  setState(() {
                    selectedList = true;
                  });
                },
                icon: Icons.book,
                color: voidColor),
          ],
        ),
      );
    }
  }

  List<CardItem> listCheck(BuildContext context, List<ItemDTO> list) {
    return list.map((e) => CardItem(item: e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        color: bgColor,
        child: SafeArea(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SideBar(selectedIndex: 2),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: size.width - defaultPadding * 6,
                  height: size.height * 0.06,
                  color: textLightColor,
                  child: Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.25,
                        child: Text(
                          title,
                          style: TextStyle(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.6,
                        height: size.height * 0.05,
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          cursorColor: primaryColor,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            fillColor: deactiveLightColor,
                            hintText: "Tìm kiếm món ăn",
                            prefixIcon: Padding(
                              padding: EdgeInsets.zero,
                              child: Icon(Icons.search),
                            ),
                          ),
                        ),
                      ),
                    ],
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
                    children: [...listCheck(context, list)],
                  ),
                )),
                ActionBar(context)
              ],
            )
          ],
        )));
  }
}
