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

  // ready
  /*void readyCheckdetails(List<CheckDTO> list) async {
    headers = storage.getItem('headers');
    List<LocationDTO> selectlocation = [];
    List<CheckdetailCheck> selectlist = [];
    for (var check in list) {
      for (var checkdetail in check.checkdetail) {
        if (checkdetail.isSelected) {
          selectlist.add(CheckdetailCheck(
              checkid: check.checkid, detailid: checkdetail.checkdetailid));
          bool confirm = true;
          for (var location in selectlocation) {
            if (location.id == check.locationid) {
              confirm = false;
              break;
            }
          }
          if (confirm) {
            selectlocation.add(LocationDTO(id: check.locationid));
          }
        }
      }
      if (selectlocation.isNotEmpty && selectlist.isNotEmpty) {
        LocationCheckdetailCheck selected = LocationCheckdetailCheck(
            listLocation: selectlocation, listCheckdetailCheck: selectlist);
        String json = jsonEncode(selected);
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
  } */

  void readyCheckdetails(List<CheckDTO> list) async {
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

  // recall
  /*void recallCheckdetails(List<CheckDTO> list) async {
    headers = storage.getItem('headers');
    List<LocationDTO> selectlocation = [];
    List<CheckDetailDTO> selectlist = [];
    for (var check in list) {
      for (var checkdetail in check.checkdetail) {
        if (checkdetail.isSelected) {
          selectlist.add(checkdetail);
          bool confirm = true;
          for (var location in selectlocation) {
            if (location.id == check.locationid) {
              confirm = false;
              break;
            }
          }
          if (confirm) {
            selectlocation.add(LocationDTO(id: check.locationid));
          }
        }
      }
    }
    if (selectlocation.isNotEmpty && selectlist.isNotEmpty) {
      LocationCheckdetail selected = LocationCheckdetail(
          listLocation: selectlocation, listCheckdetail: selectlist);
      String json = jsonEncode(selected);
      Response res = await put(
          Uri.parse(uriConnect + '/kitchen/notify/recall/'),
          headers: headers,
          body: json);
      if (res.statusCode == 200) {
        print(json);
      } else {
        print('recall error');
      }
    }
  } */
  void recallCheckdetails(List<CheckDTO> list) async {
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
