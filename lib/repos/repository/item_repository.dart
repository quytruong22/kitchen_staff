import 'dart:convert';
import 'dart:io';

import 'package:chef_application/config/routes.dart';
import 'package:chef_application/repos/models/item_obj.dart';
import 'package:chef_application/repos/models/major_group_obj.dart';
import 'package:chef_application/repos/models/menu_obj.dart';
import 'package:chef_application/screens/List_of_item/view_item_screen.dart';
import 'package:http/http.dart';
import 'package:localstorage/localstorage.dart';

class ItemRepository {
  LocalStorage storage = LocalStorage('cookie');
  String uriConnect = uri;
  Map<String, String> headers = {};
  // get Major group
  Future<List<MajorGroup>> getMajorGroup() async {
    if (storage.getItem('headers') != null) {
      headers = storage.getItem('headers');
      Response res = await get(Uri.parse(uriConnect + '/kitchen/majorgroup/'),
          headers: headers);
      if (res.statusCode == 200) {
        print('get major success');
        List<dynamic> body = jsonDecode(res.body);
        List<MajorGroup> list = ListMajorGroup.fromJson(body).list;
        return list;
      } else {
        print('get major fail ' + res.body);
        return [];
      }
    }

    print('no cookie found');
    return [];
  }

  // get Menu
  Future<List<Menu>> getMenu() async {
    headers = storage.getItem('headers');
    Response res =
        await get(Uri.parse(uriConnect + '/kitchen/menu/'), headers: headers);
    if (res.statusCode == 200) {
      print('get menu success');
      List<dynamic> body = jsonDecode(res.body);
      List<Menu> list = ListMenu.fromJson(body).list;
      return list;
    } else {
      print('get menu fail ' + res.body);
      return [];
    }
  }

  // get Item
  Future<List<ItemDTO>> getItem() async {
    headers = storage.getItem('headers');
    Response res = await get(
        Uri.parse(uriConnect + '/kitchen/menu/:id/instock/'),
        headers: headers);
    if (res.statusCode == 200) {
      print('get item success');
      List<dynamic> body = jsonDecode(res.body);
      List<ItemDTO> list = ListItem.fromJson(body).list;
      return list;
    } else {
      print('get item fail ' + res.body);
      return [];
    }
  }

  // get out of stock item
  Future<List<ItemDTO>> getOutOfItem() async {
    headers = storage.getItem('headers');
    Response res = await get(
        Uri.parse(uriConnect + '/kitchen/menu/:id/outofstock/'),
        headers: headers);
    if (res.statusCode == 200) {
      print('get out of stock item success');
      List<dynamic> body = jsonDecode(res.body);
      List<ItemDTO> list = ListItem.fromJson(body).list;
      return list;
    } else {
      print('get out of stock item fail ' + res.body);
      return [];
    }
  }
  // out of stock item
  // restock item
}
