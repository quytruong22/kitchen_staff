import 'package:chef_application/repos/models/cooking_item_obj.dart';

class CheckDTO {
  final int checkid;
  final String checkno;
  final String runningsince = '12:00';
  final List<CheckDetailDTO> checkdetail;

  CheckDTO(
      {required this.checkid,
      required this.checkno,
      required this.checkdetail});

  factory CheckDTO.fromJson(Map<String, dynamic> json) {
    return CheckDTO(
        checkid: json['checkid'] as int,
        checkno: json['checkno'] as String,
        checkdetail:
            ListCheckDetail.fromJson(json['checkdetail']).checkDetails);
  }
}

class ListCheck {
  final List<CheckDTO> checks;

  ListCheck({required this.checks});

  factory ListCheck.fromJson(List<dynamic> parseJson) {
    List<CheckDTO> checks = parseJson.map((e) => CheckDTO.fromJson(e)).toList();
    return ListCheck(checks: checks);
  }
}
