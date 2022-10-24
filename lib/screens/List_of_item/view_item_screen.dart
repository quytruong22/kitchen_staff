import 'dart:convert';

import 'package:chef_application/common/widgets/action_button.dart';
import 'package:chef_application/common/widgets/background.dart';
import 'package:chef_application/common/widgets/side_bar.dart';
import 'package:chef_application/repos/models/item_obj.dart';
import 'package:chef_application/repos/models/major_group_obj.dart';
import 'package:chef_application/repos/models/menu_obj.dart';
import 'package:chef_application/screens/List_of_item/widget/change_list_button.dart';
import 'package:chef_application/screens/List_of_item/widget/item_view.dart';
import 'package:chef_application/screens/List_of_item/widget/major_button.dart';
import 'package:chef_application/screens/List_of_item/widget/menu_button.dart';
import 'package:flutter/material.dart';

import 'package:chef_application/config/theme.dart';

class ListItem extends StatefulWidget {
  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool selectedList = false;
  String title = 'Danh sách món ăn hiện có';
  int selectedMajorIndex = -1;
  int selectedMenuIndex = -1;
  Color allbgColor = sideBarColor;
  Color alltxtColor = textLightColor;
  List<ItemDTO> listShow = [];
  List<ItemDTO> listItem = [
    ItemDTO(
        id: 1,
        name: 'Lẩu Cua Đồng',
        majorGroupid: 1,
        imageLink:
            'https://cdn.discordapp.com/attachments/900392963639750657/1033187975498047598/unknown.png'),
    ItemDTO(
        id: 2,
        name: 'Lẩu Bò',
        majorGroupid: 2,
        imageLink:
            'https://cdn.discordapp.com/attachments/900392963639750657/1033188022746877982/unknown.png'),
    ItemDTO(
        id: 3,
        name: 'Lẩu Thái',
        majorGroupid: 3,
        imageLink:
            'https://cdn.discordapp.com/attachments/900392963639750657/1033188064425689148/unknown.png'),
    ItemDTO(
        id: 4,
        name: 'Lẩu Cá Thác Lác',
        majorGroupid: 4,
        imageLink:
            'https://cdn.discordapp.com/attachments/900392963639750657/1033188104816824420/unknown.png'),
    ItemDTO(
        id: 5,
        name: 'Lẩu Cá Kèo',
        majorGroupid: 4,
        imageLink:
            'https://cdn.discordapp.com/attachments/900392963639750657/1033188922416713798/unknown.png'),
  ];
  List<MajorGroup> listMajor = [
    MajorGroup(name: 'MÓN KHAI VỊ', id: 0),
    MajorGroup(name: 'LẨU CUA', id: 1),
    MajorGroup(name: 'LẨU BÒ', id: 2),
    MajorGroup(name: 'LẨU THÁI', id: 3),
    MajorGroup(name: 'LẨU CÁ', id: 4),
    MajorGroup(name: 'MÓN NƯỚNG', id: 5),
    MajorGroup(name: 'MÓN TRÁNG MIỆNG', id: 6),
    MajorGroup(name: 'NƯỚC UỐNG', id: 7),
  ];

  List<Menu> listMenu = [
    Menu(name: 'MENU 1'),
    Menu(name: 'MENU 2'),
    Menu(name: 'MENU 3'),
  ];

  @override
  void initState() {
    listShow = listItem;
    super.initState();
  }

  Widget ActionBar(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (selectedList) {
      title = 'Danh sách món ăn hiện có';
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
                    for (var e in listItem) {
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
                text: "DANH SÁCH MÓN HIỆN CÓ",
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
      title = 'Danh sách món ăn đã hết';
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
                    for (var e in listItem) {
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
                text: "DANH SÁCH MÓN ĐÃ HẾT",
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

  List<CardItem> listItemWidget(BuildContext context, List<ItemDTO> list) {
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
                  height: size.height * 0.1,
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
                              press: () {
                                if (selectedMajorIndex != -1) {
                                  setState(() {
                                    listShow = listItem;
                                    selectedMajorIndex = -1;
                                    selectedMenuIndex = -1;
                                    alltxtColor = textLightColor;
                                    allbgColor = sideBarColor;
                                  });
                                }
                              },
                              txtColor: alltxtColor,
                              backgroundcolor: allbgColor),
                          ...listMajor.map((e) {
                            if (listMajor.indexOf(e) == selectedMajorIndex) {
                              return Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  MajorButton(
                                    text: e.name,
                                    press: () {},
                                    txtColor: textLightColor,
                                    backgroundcolor: sideBarColor,
                                  ),
                                ],
                              );
                            } else {
                              return Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  MajorButton(
                                    text: e.name,
                                    press: () {
                                      setState(() {
                                        selectedMajorIndex =
                                            listMajor.indexOf(e);
                                        allbgColor = textLightColor;
                                        alltxtColor = sideBarColor;
                                        listShow = [];
                                        for (var element in listItem) {
                                          if (element.majorGroupid == e.id) {
                                            listShow.add(element);
                                          }
                                        }
                                      });
                                    },
                                    backgroundcolor: textLightColor,
                                    txtColor: sideBarColor,
                                  ),
                                ],
                              );
                            }
                          }).toList(),
                        ]),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                SizedBox(
                  height: size.height * 0.07,
                  width: size.width - defaultPadding * 6,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ...listMenu.map((e) {
                            if (listMenu.indexOf(e) == selectedMenuIndex) {
                              return Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  MenuButton(
                                    text: e.name,
                                    press: () {},
                                    txtColor: textLightColor,
                                    backgroundcolor: sideBarColor,
                                  ),
                                ],
                              );
                            } else {
                              return Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  MenuButton(
                                    text: e.name,
                                    press: () {
                                      setState(() {
                                        selectedMenuIndex = listMenu.indexOf(e);
                                        allbgColor = textLightColor;
                                        alltxtColor = sideBarColor;
                                      });
                                    },
                                    backgroundcolor: textLightColor,
                                    txtColor: sideBarColor,
                                  ),
                                ],
                              );
                            }
                          }).toList(),
                        ]),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Expanded(
                    child: SizedBox(
                  width: size.width - defaultPadding * 6,
                  height: size.height * 0.58,
                  child: GridView.count(
                    crossAxisSpacing: 10,
                    crossAxisCount: 5,
                    children: [...listItemWidget(context, listShow)],
                  ),
                )),
                ActionBar(context)
              ],
            )
          ],
        )));
  }
}
