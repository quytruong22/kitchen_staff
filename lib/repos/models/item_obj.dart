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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['itemid'] = id;
    return data;
  }
}
