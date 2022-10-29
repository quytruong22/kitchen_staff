class ItemDTO {
  final int id;
  final String imageLink;
  final String name;
  final int majorGroupid;
  bool isSelected = false;

  ItemDTO(
      {required this.id,
      required this.imageLink,
      required this.name,
      required this.majorGroupid});

  set setIsSelected(bool newValue) {
    isSelected = newValue;
  }

  factory ItemDTO.fromjson(Map<String, dynamic> json) {
    return ItemDTO(
        id: json['itemid'] as int,
        imageLink: json['image'] as String,
        majorGroupid: json['majorGroupId'] as int,
        name: json['name'] as String);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['itemid'] = id;
    return data;
  }
}

class ListItem {
  final List<ItemDTO> list;

  ListItem({required this.list});

  factory ListItem.fromJson(List<dynamic> parseJson) {
    List<ItemDTO> list = parseJson.map((e) => ItemDTO.fromjson(e)).toList();
    return ListItem(list: list);
  }
}
