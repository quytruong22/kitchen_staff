import 'package:chef_application/config/theme.dart';
import 'package:chef_application/repos/models/item_obj.dart';
import 'package:flutter/material.dart';

class CardItem extends StatefulWidget {
  final ItemDTO item;

  const CardItem({Key? key, required this.item}) : super(key: key);

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  Color backgroundColor(BuildContext context) {
    if (widget.item.isSelected) {
      return activeColor;
    } else {
      return textLightColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (() {
        setState(() {
          if (widget.item.isSelected) {
            widget.item.setIsSelected = false;
          } else {
            widget.item.setIsSelected = true;
          }
        });
      }),
      child: Card(
        elevation: 0.4,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
                flex: 3,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(6.0),
                            topRight: Radius.circular(6.0)),
                        image: DecorationImage(
                          image: NetworkImage(widget.item.imageLink),
                          fit: BoxFit.cover,
                        )))),
            Flexible(
                flex: 2,
                child: Container(
                  color: backgroundColor(context),
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.item.name),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
