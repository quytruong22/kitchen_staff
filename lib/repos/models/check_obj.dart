import 'package:chef_application/repos/models/checkdetail_obj.dart';
import 'package:intl/intl.dart';

class CheckDTO {
  final int checkid;
  final String checkno;
  final DateTime runningsince;
  final List<CheckDetailDTO> checkdetail;
  final int locationid;

  CheckDTO(
      {required this.checkid,
      required this.checkno,
      required this.checkdetail,
      required this.locationid,
      required this.runningsince});

  factory CheckDTO.fromJson(Map<String, dynamic> json) {
    return CheckDTO(
        checkid: json['checkid'] as int,
        checkno: json['checkno'] as String,
        locationid: json['locationid'] as int,
        runningsince: DateFormat('HH:mm:ss').parse(json['runningsince']),
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

  factory ListCheck.fromJsonList(Map<String, dynamic> json) {
    return ListCheck(checks: ListCheck.fromJson(json['checkInfo']).checks);
  }
}
