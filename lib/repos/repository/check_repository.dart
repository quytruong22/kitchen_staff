import 'package:chef_application/config/routes.dart';
import 'package:chef_application/repos/models/check_obj.dart';
import 'package:chef_application/repos/models/checkdetail_obj.dart';
import 'package:http/http.dart';
import 'package:localstorage/localstorage.dart';
import 'dart:convert';

class CheckRespository {
  LocalStorage storage = LocalStorage('cookie');
  String uriConnect = uri;
  Map<String, String> headers = {};
  // get checks
  Future<List<CheckDTO>> getChecks() async {
    headers = storage.getItem('headers');
    Response res =
        await get(Uri.parse(uriConnect + '/kitchen/'), headers: headers);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<CheckDTO> list = ListCheck.fromJson(body).checks;
      return list;
    }
    return [];
  }

  Future<void> readyCheckdetails(List<CheckDTO> list) async {
    headers = storage.getItem('headers');
    List<CheckDetailDTO> selectlist = [];
    for (var check in list) {
      for (var checkdetail in check.checkdetail) {
        if (checkdetail.isSelected) {
          selectlist.add(checkdetail);
        }
      }
      if (selectlist.isNotEmpty) {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['detaillist'] = selectlist.map((item) => item.toJson()).toList();
        String json = jsonEncode(data);
        Response res = await put(
            Uri.parse(uriConnect + '/kitchen/notify/ready/'),
            headers: headers,
            body: json);
        if (res.statusCode == 200) {
          print(json);
        } else {
          print('ready error');
        }
      }
    }
  }

  Future<void> recallCheckdetails(List<CheckDTO> list) async {
    headers = storage.getItem('headers');
    List<CheckDetailDTO> selectlist = [];
    for (var check in list) {
      for (var checkdetail in check.checkdetail) {
        if (checkdetail.isSelected) {
          selectlist.add(checkdetail);
        }
      }
      if (selectlist.isNotEmpty) {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['detaillist'] = selectlist.map((item) => item.toJson()).toList();
        String json = jsonEncode(data);
        Response res = await put(
            Uri.parse(uriConnect + '/kitchen/notify/recall/'),
            headers: headers,
            body: json);
        if (res.statusCode == 200) {
          print(json);
        } else {
          print('ready error');
        }
      }
    }
  }
}
