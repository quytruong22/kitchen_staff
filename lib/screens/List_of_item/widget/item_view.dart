import 'package:chef_application/config/theme.dart';
import 'package:flutter/material.dart';

class CardItem extends StatefulWidget {
  CardItem({required this.tap});

  final Function() tap;

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
      onTap: widget.tap,
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
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6.0),
                            topRight: Radius.circular(6.0)),
                        color: shadowColor))),
            Flexible(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Xúc xích chiên'),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: '10.000',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: ' VND')
                      ]))
                    ],
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}
