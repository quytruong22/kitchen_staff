import 'package:chef_application/config/routes.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:localstorage/localstorage.dart';

class LoginRepository {
  String uriConnect = uri;
  //login
  Future<bool> login(String user, String password) async {
    bool result = false;
    Map data = {"username": user, "password": password};
    var body = json.encode(data);
    print(body);
    Response res = await post(Uri.parse(uriConnect + '/login/'),
        headers: {"Content-Type": "text/json"}, body: body);
    if (res.statusCode == 200) {
      result = true;
      _updateCookie(res);
      print("login thành công" + res.body);
    } else {
      print(res.body);
    }
    return result;
  }

  // cookie
  final LocalStorage storage = LocalStorage('cookie');
  Map<String, String> headers = {"content-type": "text/json"};
  Map<String, String> cookies = {};
  void _updateCookie(Response response) {
    String? allSetCookie = response.headers['set-cookie'];

    if (allSetCookie != null) {
      var setCookies = allSetCookie.split(',');

      for (var setCookie in setCookies) {
        var cookies = setCookie.split(';');

        for (var cookie in cookies) {
          _setCookie(cookie);
        }
      }

      headers['cookie'] = _generateCookieHeader();
      storage.setItem('headers', headers);
      storage.setItem('cookies', cookies);
    }
  }

  void _setCookie(String rawCookie) {
    if (rawCookie.isNotEmpty) {
      var keyValue = rawCookie.split('=');
      if (keyValue.length == 2) {
        var key = keyValue[0].trim();
        var value = keyValue[1];

        // ignore keys that aren't cookies
        if (key == 'path' || key == 'expires') return;

        this.cookies[key] = value;
      }
    }
  }

  String _generateCookieHeader() {
    String cookie = "";

    for (var key in cookies.keys) {
      if (cookie.isNotEmpty) cookie += ";";
      cookie += key + "=" + cookies[key]!;
    }

    return cookie;
  }
}
