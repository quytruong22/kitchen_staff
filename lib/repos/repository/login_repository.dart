import 'package:chef_application/config/routes.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:localstorage/localstorage.dart';

class LoginRepository {
  String uriConnect = uri;
  final LocalStorage storage = LocalStorage('cookie');
  //login
  Future<String> login(String user, String password) async {
    String result = "";
    Map data = {"username": user, "password": password};
    var body = json.encode(data);
    print(body);
    Response res = await post(Uri.parse(uriConnect + '/login/'),
        headers: {"Content-Type": "application/json"}, body: body);
    if (res.statusCode == 200) {
      result = jsonDecode(res.body)['role'] as String;
      storage.setItem('user', user);
      storage.setItem('password', password);
      _updateCookie(res);
    } else {
      result = jsonDecode(res.body)['msg'] as String;
    }
    return result;
  }

  // logout
  Future<bool> logout() async {
    bool result = false;
    Map<String, String> head = storage.getItem("headers");
    String user = storage.getItem("user");
    String password = storage.getItem("password");
    Map data = {"username": user, "password": password};
    var body = json.encode(data);
    print(body);
    Response res = await post(Uri.parse(uriConnect + '/logout/'),
        headers: head, body: body);
    if (res.statusCode == 200) {
      result = true;
      storage.clear();
      print("logout");
    } else {
      print(res.body);
    }
    return result;
  }

  // cookie
  Map<String, String> headers = {"content-type": "application/json"};
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

        cookies[key] = value;
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

  // check logged in
  bool checkLoggedIn() {
    Map<String, String> head = {};
    head = storage.getItem("headers") ?? {};
    if (head.isNotEmpty) {
      return true;
    }
    return false;
  }
}
