class SpecialRequestDTO {
  final String name;

  SpecialRequestDTO({required this.name});

  factory SpecialRequestDTO.fromJson(Map<String, dynamic> json) {
    return SpecialRequestDTO(name: json['name'] as String);
  }
}

class ListSpecialRequest {
  final List<SpecialRequestDTO> specialRequests;

  ListSpecialRequest({required this.specialRequests});

  factory ListSpecialRequest.fromJson(List<dynamic> parseJson) {
    List<SpecialRequestDTO> specialRequests =
        parseJson.map((e) => SpecialRequestDTO.fromJson(e)).toList();
    return ListSpecialRequest(specialRequests: specialRequests);
  }

  String toSpecicalRequests() {
    String result = '';
    for (var e in specialRequests) {
      result += e.name + ', ';
    }
    return result;
  }
}
