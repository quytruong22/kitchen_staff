import 'dart:convert';

import 'package:chef_application/common/widgets/action_button.dart';
import 'package:chef_application/repos/models/item_obj.dart';
import 'package:chef_application/repos/models/major_group_obj.dart';
import 'package:chef_application/repos/models/menu_obj.dart';
import 'package:chef_application/repos/service/item_service.dart';
import 'package:chef_application/screens/List_of_item/widget/change_list_button.dart';
import 'package:chef_application/screens/List_of_item/widget/item_view.dart';
import 'package:chef_application/screens/List_of_item/widget/major_button.dart';
import 'package:chef_application/screens/List_of_item/widget/menu_button.dart';
import 'package:flutter/material.dart';

import 'package:chef_application/config/theme.dart';

class ListItemScreen extends StatefulWidget {
  final List<MajorGroup> listMajor;
  final List<Menu> listMenu;
  final List<ItemDTO> listItem;
  const ListItemScreen(
      {Key? key,
      required this.listMajor,
      required this.listMenu,
      required this.listItem})
      : super(key: key);

  @override
  State<ListItemScreen> createState() => _ListItemScreenState();
}

class _ListItemScreenState extends State<ListItemScreen> {
  bool changelist = false;
  String title = 'Danh sách món ăn hiện có';
  String searchName = '';
  int selectedMajorIndex = -1;
  int selectedMenuIndex = -1;
  Color allbgColor = sideBarColor;
  Color alltxtColor = textLightColor;
  Color allMajorbgColor = sideBarColor;
  Color allMajortxtColor = textLightColor;
  List<ItemDTO> listShow = [];
  List<MajorGroup> listMajor = [];
  List<Menu> listMenu = [];
  List<ItemDTO> listItem = [];
  List<ItemDTO> listOutOfStock = [];
  ItemService service = ItemService();

  Future<List<ItemDTO>> updateListByMenu() async {
    listItem = [];

    if (!changelist) {
      if (selectedMenuIndex != -1) {
        listItem =
            await service.getItem(listMenu.elementAt(selectedMenuIndex).id);
      } else {
        listItem = await service.getItem(0);
      }
    } else {
      if (selectedMenuIndex != -1) {
        listItem = await service
            .getOutOfItem(listMenu.elementAt(selectedMenuIndex).id);
      } else {
        listItem = await service.getOutOfItem(0);
      }
    }
    updateList();
    return listShow;
  }

  void updateList() {
    for (var item in listShow) {
      item.setIsSelected = false;
    }

    listShow = listItem;

    if (selectedMajorIndex != -1) {
      List<ItemDTO> list = [];
      for (var item in listShow) {
        if (item.majorGroupid == listMajor.elementAt(selectedMajorIndex).id) {
          list.add(item);
        }
      }
      listShow = list;
    }

    if (searchName != '') {
      List<ItemDTO> listSearch = [];
      String search = searchName.toLowerCase().trim();
      for (var item in listShow) {
        String itemsearched = item.name.toLowerCase();
        if (itemsearched.contains(search)) {
          listSearch.add(item);
        }
      }
      listShow = listSearch;
    }
  }

  Widget actionBar(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (changelist) {
      return Container(
        color: primaryColor,
        width: size.width - 75,
        height: 75,
        child: Row(
          children: [
            Container(
              width: size.width - 150,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  instockButton(),
                  warningButton(),
                ],
              ),
            ),
            ChangeListButton(
                text: "DANH SÁCH MÓN HIỆN CÓ",
                press: () async {
                  changelist = false;
                  await updateListByMenu();
                  setState(() {
                    title = 'Danh sách món ăn hiện có';
                  });
                },
                icon: Icons.book,
                color: activeColor),
          ],
        ),
      );
    } else {
      return Container(
        color: primaryColor,
        width: size.width - 75,
        height: 75,
        child: Row(
          children: [
            Container(
              width: size.width - 150,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  emptyButton(),
                  warningButton(),
                  instockButton(),
                ],
              ),
            ),
            ChangeListButton(
                text: "DANH SÁCH MÓN ĐÃ HẾT",
                press: () async {
                  changelist = true;
                  await updateListByMenu();
                  setState(() {
                    title = 'Danh sách món ăn đã hết';
                  });
                },
                icon: Icons.book,
                color: voidColor),
          ],
        ),
      );
    }
  }

  // action buttons
  ActionButton warningButton() {
    return ActionButton(
        text: "SẮP HẾT",
        press: () async {
          List<ItemDTO> selectList = [];
          for (var e in listShow) {
            if (e.isSelected) {
              selectList.add(e);
            }
          }
          if (selectList != []) {
            ListItem encode = ListItem(list: selectList);
            String jsonList = jsonEncode(encode);
            await service.setWarning(jsonList);
          }
          await updateListByMenu();
          setState(() {});
        },
        icon: Icons.shopping_cart_outlined,
        color: warningColor);
  }

  ActionButton emptyButton() {
    return ActionButton(
        text: "ĐÃ HẾT",
        press: () async {
          List<ItemDTO> selectList = [];
          for (var e in listShow) {
            if (e.isSelected) {
              selectList.add(e);
            }
          }
          if (selectList != []) {
            ListItem encode = ListItem(list: selectList);
            String jsonList = jsonEncode(encode);
            await service.setEmpty(jsonList);
          }
          await updateListByMenu();
          setState(() {});
        },
        icon: Icons.remove_shopping_cart_outlined,
        color: voidColor);
  }

  ActionButton instockButton() {
    return ActionButton(
        text: "NHẬP HÀNG",
        press: () async {
          List<ItemDTO> selectList = [];
          for (var e in listShow) {
            if (e.isSelected) {
              selectList.add(e);
            }
          }
          if (selectList != []) {
            ListItem encode = ListItem(list: selectList);
            String jsonList = jsonEncode(encode);
            await service.setInstock(jsonList);
          }
          await updateListByMenu();
          setState(() {});
        },
        icon: Icons.add_shopping_cart,
        color: activeColor);
  }

  @override
  void initState() {
    super.initState();
    listMenu = widget.listMenu;
    listMajor = widget.listMajor;
    listItem = widget.listItem;
    listShow = listItem;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: size.width - 75,
          height: 50,
          color: textLightColor,
          child: Row(
            children: [
              SizedBox(
                width: (size.width - 75) * 0.25,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: (size.width - 75) * 0.6,
                height: 40,
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      searchName = value;
                      updateList();
                    });
                  },
                  textInputAction: TextInputAction.next,
                  cursorColor: primaryColor,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    fillColor: deactiveLightColor,
                    hintText: "Tìm kiếm tên món ăn",
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
        const SizedBox(
          height: 5,
        ),
        SizedBox(
            height: 75,
            width: size.width - 75,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                const SizedBox(
                  width: 10,
                ),
                MenuButton(
                    text: 'TẤT CẢ MENU',
                    press: () async {
                      if (selectedMenuIndex != -1) {
                        selectedMenuIndex = -1;
                        await updateListByMenu();
                        setState(() {
                          alltxtColor = textLightColor;
                          allbgColor = sideBarColor;
                        });
                      }
                    },
                    txtColor: alltxtColor,
                    backgroundcolor: allbgColor),
                ...listMenu.map((e) {
                  if (listMenu.indexOf(e) == selectedMenuIndex) {
                    return Row(
                      children: [
                        const SizedBox(
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
                        const SizedBox(
                          width: 10,
                        ),
                        MenuButton(
                          text: e.name,
                          press: () async {
                            selectedMenuIndex = listMenu.indexOf(e);
                            await updateListByMenu();
                            setState(() {
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
            )),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
            height: 50,
            width: size.width - 75,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                const SizedBox(
                  width: 10,
                ),
                MajorButton(
                    text: 'Tất cả nhóm',
                    press: () {
                      if (selectedMajorIndex != -1) {
                        setState(() {
                          selectedMajorIndex = -1;
                          updateList();
                          allMajortxtColor = textLightColor;
                          allMajorbgColor = sideBarColor;
                        });
                      }
                    },
                    txtColor: allMajortxtColor,
                    backgroundcolor: allMajorbgColor),
                ...listMajor.map((e) {
                  if (listMajor.indexOf(e) == selectedMajorIndex) {
                    return Row(
                      children: [
                        const SizedBox(
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
                        const SizedBox(
                          width: 10,
                        ),
                        MajorButton(
                          text: e.name,
                          press: () {
                            setState(() {
                              selectedMajorIndex = listMajor.indexOf(e);
                              updateList();
                              allMajorbgColor = textLightColor;
                              allMajortxtColor = sideBarColor;
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
            )),
        const SizedBox(
          height: 5,
        ),
        Expanded(
            child: SizedBox(
                width: size.width - 75,
                child: GridView.count(
                  crossAxisSpacing: 10,
                  crossAxisCount: 5,
                  children: [
                    ...listShow.map((e) => CardItem(item: e)).toList()
                  ],
                ))),
        actionBar(context)
      ],
    );
  }
}
