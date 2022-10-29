import 'package:chef_application/repos/models/item_obj.dart';
import 'package:chef_application/repos/models/major_group_obj.dart';
import 'package:chef_application/repos/models/menu_obj.dart';
import 'package:chef_application/repos/repository/item_repository.dart';

class ItemService {
  ItemRepository respo = ItemRepository();
  // get major
  Future<List<MajorGroup>> getMajorGroup() async {
    return respo.getMajorGroup();
  }

  // get Menu
  Future<List<Menu>> getMenu() async {
    return respo.getMenu();
  }

  // get Item
  Future<List<ItemDTO>> getItem() async {
    return respo.getItem();
  }

  // get out of stock item
  Future<List<ItemDTO>> getOutOfItem() async {
    return respo.getOutOfItem();
  }
}
