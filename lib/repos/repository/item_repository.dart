import 'dart:convert';

import 'package:chef_application/config/routes.dart';
import 'package:chef_application/repos/models/item_obj.dart';
import 'package:chef_application/repos/models/major_group_obj.dart';
import 'package:chef_application/repos/models/menu_obj.dart';
import 'package:http/http.dart';
import 'package:localstorage/localstorage.dart';

class ItemRepository {
  LocalStorage storage = LocalStorage('cookie');
  String uriConnect = uri;
  Map<String, String> headers = {};

  Future<List<MajorGroup>> getMajorGroup() async {
    if (storage.getItem('headers') != null) {
      headers = storage.getItem('headers');
      Response res = await get(Uri.parse(uriConnect + '/kitchen/majorgroup/'),
          headers: headers);
      if (res.statusCode == 200) {
        List<dynamic> body = jsonDecode(res.body);
        List<MajorGroup> list = ListMajorGroup.fromJson(body).list;
        return list;
      } else {
        return [];
      }
    }
    return [];
  }

  Future<List<Menu>> getMenu() async {
    headers = storage.getItem('headers');
    Response res =
        await get(Uri.parse(uriConnect + '/kitchen/menu/'), headers: headers);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Menu> list = ListMenu.fromJson(body).list;
      return list;
    } else {
      return [];
    }
  }

  Future<List<ItemDTO>> getItem(int id) async {
    headers = storage.getItem('headers');
    Response res = await get(
        Uri.parse(uriConnect + '/kitchen/menu/' + id.toString() + '/instock/'),
        headers: headers);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<ItemDTO> list = ListItem.fromJson(body).list;
      return list;
    } else {
      return [];
    }
  }

  Future<List<ItemDTO>> getOutOfItem(int id) async {
    headers = storage.getItem('headers');
    Response res = await get(
      Uri.parse(uriConnect + '/kitchen/menu/' + id.toString() + '/outofstock/'),
      headers: headers,
    );
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<ItemDTO> list = ListItem.fromJson(body).list;
      return list;
    } else {
      return [];
    }
  }

  Future<bool> setEmpty(var body) async {
    headers = storage.getItem('headers');
    Response res = await post(
        Uri.parse(uriConnect + '/kitchen/add/outofstock/empty'),
        headers: headers,
        body: body);
    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> setWarning(var body) async {
    headers = storage.getItem('headers');
    Response res = await post(
        Uri.parse(uriConnect + '/kitchen/add/outofstock/warning'),
        headers: headers,
        body: body);
    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> setInstock(var body) async {
    headers = storage.getItem('headers');
    Response res = await delete(
        Uri.parse(uriConnect + '/kitchen/remove/outofstock/'),
        headers: headers,
        body: body);
    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
