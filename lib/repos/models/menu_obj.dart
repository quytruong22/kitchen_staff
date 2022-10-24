class Menu {
  final String name;
  bool isSelected = false;

  Menu({required this.name});

  set setIsSeleceted(bool newValue) {
    isSelected = newValue;
  }

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(name: json['name']);
  }
}
