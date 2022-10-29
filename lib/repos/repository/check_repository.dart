import 'package:chef_application/config/routes.dart';
import 'package:chef_application/repos/models/check_obj.dart';
import 'package:chef_application/repos/models/checkdetail_obj.dart';
import 'package:chef_application/repos/models/link_checkdetail_check.dart';
import 'package:chef_application/repos/models/link_location_checkdetail.dart';
import 'package:chef_application/repos/models/link_location_checkdetailcheck.dart';
import 'package:chef_application/repos/models/location_obj.dart';
import 'package:http/http.dart';
import 'dart:convert';

class CheckRespository {
  String uriConnect = uri;
  // get checks
  Future<List<CheckDTO>> getChecks() async {
    Response res = await get(Uri.parse(uriConnect + '/kitchen/'));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<CheckDTO> list = ListCheck.fromJson(body).checks;
      return list;
    }
    return [];
  }

  // ready
  void readyCheckdetails(List<CheckDTO> list) {
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
        print(json);
      }
    }
  }

  // recall
  void recallCheckdetails(List<CheckDTO> list) {
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
      print(json);
    }
  }
}
