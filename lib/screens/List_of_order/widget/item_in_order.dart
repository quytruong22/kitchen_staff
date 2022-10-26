import 'package:chef_application/config/theme.dart';
import 'package:chef_application/repos/models/cooking_item_obj.dart';
import 'package:flutter/material.dart';

class OrderItemView extends StatefulWidget {
  final CheckDetailDTO checkDetail;

  OrderItemView({required this.checkDetail});

  @override
  State<OrderItemView> createState() => _OrderItemViewState();
}

class _OrderItemViewState extends State<OrderItemView> {
  Color backgroundColor(BuildContext context) {
    if (widget.checkDetail.isSelected) {
      return activeColor;
    } else {
      return widget.checkDetail.isreminded ? warningColor : textLightColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.25,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          backgroundColor: backgroundColor(context),
          elevation: 0,
        ),
        onPressed: (() {
          setState(() {
            if (widget.checkDetail.isSelected) {
              widget.checkDetail.setIsSelected = false;
            } else {
              widget.checkDetail.setIsSelected = true;
            }
          });
        }),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: size.width * 0.02,
                child: Text(
                  widget.checkDetail.quantity.toString(),
                  style: const TextStyle(
                      color: textColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: size.width * 0.18 - 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.checkDetail.itemname,
                      style: const TextStyle(
                          color: textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    Text.rich(TextSpan(
                        children: widget.checkDetail.specialrequest
                            .map((e) => TextSpan(
                                  text: e.name + ', ',
                                  style: const TextStyle(
                                      color: textColor, fontSize: 12),
                                ))
                            .toList())),
                    Text(
                      widget.checkDetail.note,
                      style: const TextStyle(color: textColor, fontSize: 12),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
