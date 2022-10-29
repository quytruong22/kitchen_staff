import 'package:chef_application/repos/models/item_obj.dart';

class Menu {
  final String name;
  final List<ItemDTO> listItem;
  Menu({required this.name, required this.listItem});

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(name: json['name'], listItem: json['dada']);
  }
}

class ListMenu {
  final List<Menu> list;
  ListMenu({required this.list});

  factory ListMenu.fromJson(List<dynamic> parseJson) {
    List<Menu> list = parseJson.map((e) => Menu.fromJson(e)).toList();
    return ListMenu(list: list);
  }
}
