class LocationDTO {
  final int id;
  LocationDTO({required this.id});

  factory LocationDTO.fromJson(Map<String, dynamic> json) {
    return LocationDTO(id: json['id']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

class ListLocation {
  final List<LocationDTO> list;
  ListLocation({required this.list});

  factory ListLocation.fromJson(List<dynamic> parseJson) {
    List<LocationDTO> list =
        parseJson.map((e) => LocationDTO.fromJson(e)).toList();
    return ListLocation(list: list);
  }
}
