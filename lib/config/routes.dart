import 'package:chef_application/screens/Login/login.dart';
import 'package:flutter/material.dart';

import 'package:chef_application/screens/List_of_order/view_list_order_screen.dart';
import 'package:chef_application/screens/List_of_item/view_item_screen.dart';

class NowRoutes {
  static Map<String, Widget Function(BuildContext)> pageroutes =
      <String, WidgetBuilder>{
    '/order': (BuildContext context) => ListOrder(),
    '/item': (BuildContext context) => ListItem(),
    '/login': (BuildContext context) => LoginScreen()
  };
}
