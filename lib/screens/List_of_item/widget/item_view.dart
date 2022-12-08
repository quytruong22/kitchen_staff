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
  Color backgroundColor() {
    if (widget.item.isSelected) {
      return activeColor;
    } else {
      return textLightColor;
    }
  }

  Color noteColor() {
    if (widget.item.isSelected) {
      return textLightColor;
    } else {
      return textColor;
    }
  }

  GestureDetector itemView() {
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
                  width: double.infinity,
                  color: backgroundColor(),
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.item.name,
                        style: TextStyle(color: noteColor()),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Map<String, String> statusMessage = {'EMPTY': 'Đã hết', 'WARNING': 'Sắp hết'};

  @override
  Widget build(BuildContext context) {
    String status = widget.item.status;
    if (statusMessage.containsKey(status)) {
      return ClipRRect(
        child: Banner(
          message: statusMessage[status]!,
          location: BannerLocation.topEnd,
          child: itemView(),
        ),
      );
    } else {
      return itemView();
    }
  }
}
