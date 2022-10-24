class MajorGroup {
  final int id;
  final String name;
  bool isSelected = false;

  MajorGroup({required this.name, required this.id});

  set setIsSeleceted(bool newValue) {
    isSelected = newValue;
  }

  factory MajorGroup.fromJson(Map<String, dynamic> json) {
    return MajorGroup(name: json['name'], id: json['id']);
  }
}
