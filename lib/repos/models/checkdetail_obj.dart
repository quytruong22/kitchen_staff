import 'package:chef_application/repos/models/special_request_obj.dart';

class CheckDetailDTO {
  final int checkdetailid;
  final String itemname;
  final int quantity;
  final String note;
  final bool isreminded;
  final List<SpecialRequestDTO> specialrequest;
  bool isSelected = false;

  CheckDetailDTO(
      {required this.checkdetailid,
      required this.itemname,
      required this.quantity,
      required this.note,
      required this.isreminded,
      required this.specialrequest});

  set setIsSelected(bool newValue) {
    isSelected = newValue;
  }

  factory CheckDetailDTO.fromJson(Map<String, dynamic> json) {
    return CheckDetailDTO(
        checkdetailid: json['checkdetailid'] as int,
        itemname: json['itemname'] as String,
        quantity: json['quantity'] as int,
        note: json['note'] as String,
        isreminded: json['isreminded'] as bool,
        specialrequest: ListSpecialRequest.fromJson(json['specialrequest'])
            .specialRequests);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['detailid'] = checkdetailid;
    return data;
  }
}

class ListCheckDetail {
  final List<CheckDetailDTO> checkDetails;

  ListCheckDetail({required this.checkDetails});

  factory ListCheckDetail.fromJson(List<dynamic> parseJson) {
    List<CheckDetailDTO> checkDetails =
        parseJson.map((e) => CheckDetailDTO.fromJson(e)).toList();
    return ListCheckDetail(checkDetails: checkDetails);
  }
}
