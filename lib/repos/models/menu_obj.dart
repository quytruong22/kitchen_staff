class Menu {
  final String name;
  final int id;
  Menu({required this.name, required this.id});

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(name: json['name'], id: json['id']);
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
