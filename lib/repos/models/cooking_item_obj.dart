import 'package:chef_application/repos/models/special_request_obj.dart';

class CheckDetailDTO {
  final int checkdetailid;
  final String itemname;
  final int quantity;
  final String note;
  final bool isreminded;
  final List<SpecialRequestDTO> specialrequest;

  CheckDetailDTO(
      {required this.checkdetailid,
      required this.itemname,
      required this.quantity,
      required this.note,
      required this.isreminded,
      required this.specialrequest});

  factory CheckDetailDTO.fromJson(Map<String, dynamic> json) {
    return CheckDetailDTO(
        checkdetailid: json['checkdetailid'] as int,
        itemname: json['itemname'],
        quantity: json['quantity'] as int,
        note: json['note'],
        isreminded: json['isreminded'] == 'false' ? false : true,
        specialrequest: ListSpecialRequest.fromJson(json['specialrequest'])
            .specialRequests);
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
