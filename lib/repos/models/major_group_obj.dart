class MajorGroup {
  final int id;
  final String name;

  MajorGroup({required this.name, required this.id});

  factory MajorGroup.fromJson(Map<String, dynamic> json) {
    return MajorGroup(name: json['name'], id: json['id']);
  }
}

class ListMajorGroup {
  final List<MajorGroup> list;
  ListMajorGroup({required this.list});

  factory ListMajorGroup.fromJson(List<dynamic> parseJson) {
    List<MajorGroup> list =
        parseJson.map((e) => MajorGroup.fromJson(e)).toList();
    return ListMajorGroup(list: list);
  }
}
