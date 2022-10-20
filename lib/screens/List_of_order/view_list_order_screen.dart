import 'dart:convert';

import 'package:chef_application/common/widgets/action_button.dart';
import 'package:chef_application/common/widgets/background.dart';
import 'package:chef_application/common/widgets/side_bar.dart';
import 'package:chef_application/repos/models/cooking_item_obj.dart';
import 'package:chef_application/repos/models/order_obj.dart';
import 'package:chef_application/screens/List_of_order/widget/order_copy.dart';
import 'package:flutter/material.dart';

import 'package:chef_application/config/theme.dart';

class ListOrder extends StatefulWidget {
  @override
  State<ListOrder> createState() => _ListOrderState();
}

class _ListOrderState extends State<ListOrder> {
  List<Widget> listCheck(BuildContext context, List<CheckDTO> list) {
    return list.map((e) => OrderView(check: e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    var myData = json.decode(data);
    List<CheckDTO> list = ListCheck.fromJson(myData).checks;
    Size size = MediaQuery.of(context).size;
    return Background(
        color: textLightColor,
        child: SafeArea(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SideBar(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(
                    child: Column(
                  children: [
                    Container(
                      width: size.width - defaultPadding * 6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [...listCheck(context, list)],
                      ),
                    )
                  ],
                )),
                Container(
                  color: primaryColor,
                  width: size.width - size.width / 14,
                  height: size.height * 0.12,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ActionButton(
                          text: "HOÀN THÀNH",
                          press: () {
                            List<CheckDetailDTO> selectlist = [];
                            for (var e in list) {
                              for (var a in e.checkdetail) {
                                if (a.isSelected) {
                                  selectlist.add(a);
                                }
                              }
                            }
                            String jsonList = jsonEncode(selectlist);
                            print(jsonList);
                          },
                          icon: Icons.fastfood,
                          color: warningColor),
                      ActionButton(
                          text: "TRẢ LẠI",
                          press: () {
                            List<CheckDetailDTO> selectlist = [];
                            for (var e in list) {
                              for (var a in e.checkdetail) {
                                if (a.isSelected) {
                                  selectlist.add(a);
                                }
                              }
                            }
                            String jsonList = jsonEncode(selectlist);
                            print(jsonList);
                          },
                          icon: Icons.no_food,
                          color: voidColor),
                    ],
                  ),
                )
              ],
            )
          ],
        )));
  }

  String data = '''
[
    {
        "checkid": 5,
        "checkno": "ARdKoYfK",
        "runningsince": null,
        "checkdetail": [
            {
                "checkdetailid": 24,
                "itemname": "item 2",
                "quantity": 2,
                "note": "Add more nuts",
                "isreminded": true,
                "specialrequest": [
                    {
                        "name": "add beef 1"
                    }
                ]
            },
            {
                "checkdetailid": 26,
                "itemname": "item 2",
                "quantity": 2,
                "note": "Add more nuts",
                "isreminded": false,
                "specialrequest": [
                    {
                        "name": "add beef 1"
                    }
                ]
            },
            {
                "checkdetailid": 27,
                "itemname": "item 2",
                "quantity": 3,
                "note": "Add more nuts",
                "isreminded": false,
                "specialrequest": [
                    {
                        "name": "add ice 1"
                    },
                    {
                        "name": "add tea 1"
                    }
                ]
            }
        ]
    },
    {
        "checkid": 6,
        "checkno": "om41ymDP",
        "runningsince": null,
        "checkdetail": [
            {
                "checkdetailid": 28,
                "itemname": "item 2",
                "quantity": 2,
                "note": "Add more nuts",
                "isreminded": false,
                "specialrequest": [
                    {
                        "name": "add beef 1"
                    }
                ]
            },
            {
                "checkdetailid": 29,
                "itemname": "item 2",
                "quantity": 3,
                "note": "Add more nuts",
                "isreminded": false,
                "specialrequest": [
                    {
                        "name": "add ice 1"
                    },
                    {
                        "name": "add tea 1"
                    }
                ]
            }
        ]
    }
]
''';
}
