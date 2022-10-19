class SpecialRequestDTO {
  final String name;

  SpecialRequestDTO({required this.name});

  factory SpecialRequestDTO.fromJson(Map<String, dynamic> json) {
    return SpecialRequestDTO(name: json['name']);
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
}
