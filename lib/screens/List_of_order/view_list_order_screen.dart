import 'dart:convert';

import 'package:chef_application/common/widgets/action_button.dart';
import 'package:chef_application/common/widgets/background.dart';
import 'package:chef_application/common/widgets/side_bar.dart';
import 'package:chef_application/repos/models/check_obj.dart';
import 'package:chef_application/repos/service/check_service.dart';
import 'package:chef_application/screens/List_of_order/widget/order.dart';
import 'package:flutter/material.dart';

import 'package:chef_application/config/theme.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';

class ListOrderScreen extends StatefulWidget {
  @override
  State<ListOrderScreen> createState() => _ListOrderScreenState();
}

class _ListOrderScreenState extends State<ListOrderScreen> {
  CheckService service = CheckService();
  List<Widget> listCheck(BuildContext context, List<CheckDTO> list) {
    return list.map((e) => OrderView(check: e)).toList();
  }

  List<CheckDTO> list = [];

  @override
  void initState() {
    var myData = json.decode(data);
    list = ListCheck.fromJson(myData).checks;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        color: bgColor,
        child: SafeArea(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SideBar(selectedIndex: 1),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: size.width - size.width / 14,
                    height: size.height * 0.8,
                    child: SingleChildScrollView(
                        child: MasonryView(
                      itemRadius: 0,
                      itemPadding: 0,
                      itemBuilder: (item) {
                        return item;
                      },
                      numberOfColumn: 4,
                      listOfItem: listCheck(context, list),
                    ))),
                Container(
                  color: primaryColor,
                  width: size.width - size.width / 14,
                  height: size.height * 0.12,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ActionButton(
                          text: "HOÀN THÀNH",
                          press: () {
                            service.readyCheckDetail(list);
                          },
                          icon: Icons.fastfood,
                          color: warningColor),
                      ActionButton(
                          text: "TRẢ LẠI",
                          press: () {
                            service.recallCheckDetail(list);
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
        "locationid": 2,
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
        "locationid": 1,
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
