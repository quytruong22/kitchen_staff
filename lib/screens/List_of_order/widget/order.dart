import 'dart:async';

import 'package:chef_application/config/theme.dart';
import 'package:chef_application/repos/models/check_obj.dart';
import 'package:chef_application/screens/List_of_order/widget/item_in_order.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class OrderView extends StatefulWidget {
  CheckDTO check;

  OrderView({Key? key, required this.check}) : super(key: key);

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  late Timer timer;
  late DateTime checkTime;
  String countTime = "";

  @override
  void initState() {
    super.initState();
    // call timer
    checkTime = widget.check.runningsince;
    timer = Timer.periodic(const Duration(seconds: 1), ((timer) {
      setState(() {
        DateTime countUp = DateTime.now().subtract(Duration(
            hours: checkTime.hour,
            minutes: checkTime.minute,
            seconds: checkTime.second));
        countTime = DateFormat('HH:mm:ss').format(countUp);
      });
    }));
  }

  @override
  void dispose() {
    super.dispose();
    // break timer
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    checkTime = widget.check.runningsince;
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 0.2,
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: textLightColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: shadowColor,
              blurRadius: 3,
              offset: Offset(0, 3), // Shadow position
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 35,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: textColor),
                ),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    backgroundColor: activeColor),
                onPressed: (() {
                  setState(() {
                    bool confirm = true;
                    for (var checkdetail in widget.check.checkdetail) {
                      if (!checkdetail.isSelected) {
                        confirm = false;
                        break;
                      }
                    }
                    if (confirm) {
                      for (var checkdetail in widget.check.checkdetail) {
                        checkdetail.setIsSelected = false;
                      }
                    } else {
                      for (var checkdetail in widget.check.checkdetail) {
                        checkdetail.setIsSelected = true;
                      }
                    }
                  });
                }),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.check.checkno,
                        style: const TextStyle(
                            color: textLightColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    Text(countTime,
                        style: const TextStyle(
                            color: textLightColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            ...widget.check.checkdetail
                .map((e) => OrderItemView(checkDetail: e))
                .toList(),
          ],
        ));
  }
}
