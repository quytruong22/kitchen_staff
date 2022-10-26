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
                    Text(widget.check.runningsince,
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
