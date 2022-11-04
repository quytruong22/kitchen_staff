import 'package:chef_application/screens/Login/login.dart';
import 'package:flutter/material.dart';

import 'package:chef_application/screens/List_of_order/view_list_order_screen.dart';
import 'package:chef_application/screens/List_of_item/view_item_screen.dart';

const String uri = "http://192.168.1.11:5000";

class NowRoutes {
  static Map<String, Widget Function(BuildContext)> pageroutes =
      <String, WidgetBuilder>{
    '/order': (BuildContext context) => const ListOrderScreen(),
    '/item': (BuildContext context) => const ListItemScreen(),
    '/login': (BuildContext context) => const LoginScreen()
  };
}
