import 'package:chef_application/common/widgets/background.dart';
import 'package:chef_application/common/widgets/side_bar.dart';
import 'package:chef_application/config/theme.dart';
import 'package:chef_application/repos/models/item_obj.dart';
import 'package:chef_application/repos/models/major_group_obj.dart';
import 'package:chef_application/repos/models/menu_obj.dart';
import 'package:chef_application/repos/service/item_service.dart';
import 'package:chef_application/screens/List_of_item/view_item_screen.dart';
import 'package:flutter/material.dart';

class LoadViewItemScreen extends StatefulWidget {
  const LoadViewItemScreen({Key? key}) : super(key: key);

  @override
  State<LoadViewItemScreen> createState() => _LoadViewItemScreenState();
}

class _LoadViewItemScreenState extends State<LoadViewItemScreen> {
  List<MajorGroup> listMajor = [];
  List<Menu> listMenu = [];
  ItemService service = ItemService();
  List<ItemDTO> listItem = [];
  Future<bool> getData() async {
    bool result = true;
    listMajor = await service.getMajorGroup();
    listMenu = await service.getMenu();
    listItem = await service.getItem(0);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      color: bgColor,
      child: SafeArea(
        child: Row(
          children: [
            const SideBar(selectedIndex: 2),
            FutureBuilder(
                future: getData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    bool result = snapshot.requireData;
                    if (result) {
                      return ListItemScreen(
                        listMajor: listMajor,
                        listMenu: listMenu,
                        listItem: listItem,
                      );
                    }
                  }
                  return const Center(child: CircularProgressIndicator());
                }),
          ],
        ),
      ),
    );
  }
}
