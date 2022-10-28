import 'dart:convert';

import 'package:chef_application/repos/models/major_group_obj.dart';
import 'package:http/http.dart';

class HttpService {
  String uri = "http://192.168.1.119:5000";
  //String uri = "http://localhost:5000";
  //
  HttpService();

  // login
  Future<bool> login(String user, String password) async {
    bool result = false;
    Map data = {"username": user, "password": password};
    var body = json.encode(data);
    print(body);
    Response res = await post(Uri.parse(uri + 'login'),
        headers: {"Content-Type": "application/json"}, body: body);
    if (res.statusCode == 200) {
      result = true;
    } else {
      print(res.body);
    }
    return result;
  }

  // get Major group
  Future<List<MajorGroup>> getMajorGroup() async {
    Response res = await get(Uri.parse(uri + 'kitchen/majorgroup/'));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<MajorGroup> list = body.map((e) => MajorGroup.fromJson(e)).toList();
      return list;
    }
    return [];
  }
}
