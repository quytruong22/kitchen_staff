class ItemDTO {
  final String id;
  bool isSelected = false;

  ItemDTO({required this.id});

  set setIsSeleceted(bool newValue) {
    isSelected = newValue;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['itemid'] = id;
    return data;
  }
}
