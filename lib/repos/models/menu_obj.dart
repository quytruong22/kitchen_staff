import 'package:chef_application/repos/models/item_obj.dart';

class Menu {
  final String name;
  final List<ItemDTO> listItem;
  Menu({required this.name, required this.listItem});

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(name: json['name'], listItem: json['dada']);
  }
}
