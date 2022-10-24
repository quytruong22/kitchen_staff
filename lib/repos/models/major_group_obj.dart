class MajorGroup {
  final int id;
  final String name;

  MajorGroup({required this.name, required this.id});

  factory MajorGroup.fromJson(Map<String, dynamic> json) {
    return MajorGroup(name: json['name'], id: json['id']);
  }
}
