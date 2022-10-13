import 'package:chef_application/config/theme.dart';
import 'package:flutter/material.dart';

class OrderView extends StatefulWidget {
  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 0.20,
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
              margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              decoration: const BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: textColor),
              )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Check#1',
                      style: TextStyle(
                          color: textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  Text('12:20',
                      style: TextStyle(
                          color: textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(5, 2, 5, 2),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: size.width * 0.015,
                      margin: const EdgeInsets.only(right: 5),
                      child: Text('21',
                          style: TextStyle(
                              color: textColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      width: size.width * 0.20 - size.width * 0.04,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Xúc xích chiên',
                            style: TextStyle(
                                color: textColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            'Chiên vừa, Nhiều sốt',
                            style: TextStyle(color: textColor, fontSize: 12),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            'Cắt thành nhiều miếng nhỏ',
                            style: TextStyle(color: textColor, fontSize: 12),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    )
                  ]),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(5, 2, 5, 2),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: size.width * 0.015,
                      margin: const EdgeInsets.only(right: 5),
                      child: Text('2',
                          style: TextStyle(
                              color: textColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      width: size.width * 0.20 - size.width * 0.04,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Xúc xích chiên',
                            style: TextStyle(
                                color: textColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            'Chiên vừa, Nhiều sốt',
                            style: TextStyle(color: textColor, fontSize: 12),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            'Cắt thành nhiều miếng nhỏ',
                            style: TextStyle(color: textColor, fontSize: 12),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    )
                  ]),
            )
          ],
        ));
  }
}
