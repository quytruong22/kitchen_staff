import 'package:chef_application/repos/models/checkdetail_obj.dart';

class CheckDTO {
  final int checkid;
  final String checkno;
  final String runningsince = '12:00';
  final List<CheckDetailDTO> checkdetail;
  final int locationid;
  CheckDTO(
      {required this.checkid,
      required this.checkno,
      required this.checkdetail,
      required this.locationid});

  factory CheckDTO.fromJson(Map<String, dynamic> json) {
    return CheckDTO(
        checkid: json['checkid'] as int,
        checkno: json['checkno'] as String,
        locationid: json['locationid'] as int,
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
