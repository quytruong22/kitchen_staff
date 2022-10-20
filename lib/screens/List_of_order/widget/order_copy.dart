import 'package:chef_application/config/theme.dart';
import 'package:chef_application/repos/models/order_obj.dart';
import 'package:chef_application/screens/List_of_order/widget/item_in_order.dart';
import 'package:flutter/material.dart';

class OrderView extends StatefulWidget {
  final CheckDTO check;

  OrderView({required this.check});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 0.2,
        margin: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
            border: Border(
          top: BorderSide(color: textColor),
          left: BorderSide(color: textColor),
          right: BorderSide(color: textColor),
          bottom: BorderSide(color: textColor),
        )),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              decoration: const BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: textColor),
              )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.check.checkno,
                      style: const TextStyle(
                          color: textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  Text(widget.check.runningsince,
                      style: const TextStyle(
                          color: textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            ...widget.check.checkdetail
                .map((e) => OrderItemView(checkDetail: e))
                .toList(),
          ],
        ));
  }
}
