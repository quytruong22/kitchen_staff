import 'package:chef_application/common/widgets/location_button.dart';
import 'package:chef_application/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:chef_application/common/widgets/action_button.dart';

class ListLocation extends StatefulWidget {
  @override
  State<ListLocation> createState() => _ListLocationState();
}

class _ListLocationState extends State<ListLocation> {
  @override
  Widget build(BuildContext context) {
    List<String> listLocation = [
      'TẤT CẢ',
      'Lầu 1',
      'Lầu 2',
      'Lầu 3',
      'Lầu 4',
      'Lầu 5',
      'Lầu 6'
    ];
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.12,
        width: size.width * 0.6,
        decoration: BoxDecoration(
            border: const Border(
              top: BorderSide(color: shadowColor),
              left: BorderSide(color: shadowColor),
              right: BorderSide(color: shadowColor),
              bottom: BorderSide(color: shadowColor),
            ),
            borderRadius: BorderRadius.circular(5),
            color: primaryLightColor),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ActionButton(
                  text: "TẤT CẢ",
                  press: () {},
                  icon: Icons.list,
                  color: primaryColor),
              SizedBox(
                width: size.width * 0.05,
              ),
              LocationButton(
                text: "LẦU 1",
                press: () {},
                icon: Icons.place,
                color: primaryColor,
                isReminded: true,
              ),
              SizedBox(
                width: size.width * 0.05,
              ),
              LocationButton(
                text: "LẦU 2",
                press: () {},
                icon: Icons.place,
                color: primaryColor,
                isReminded: true,
              ),
              SizedBox(
                width: size.width * 0.05,
              ),
              LocationButton(
                text: "LẦU 2",
                press: () {},
                icon: Icons.place,
                color: primaryColor,
                isReminded: false,
              ),
              SizedBox(
                width: size.width * 0.05,
              ),
              LocationButton(
                text: "LẦU 2",
                press: () {},
                icon: Icons.place,
                color: primaryColor,
                isReminded: false,
              ),
              SizedBox(
                width: size.width * 0.05,
              ),
              LocationButton(
                text: "LẦU 2",
                press: () {},
                icon: Icons.place,
                color: primaryColor,
                isReminded: false,
              ),
              SizedBox(
                width: size.width * 0.05,
              ),
              LocationButton(
                text: "LẦU 2",
                press: () {},
                icon: Icons.place,
                color: primaryColor,
                isReminded: false,
              ),
              SizedBox(
                width: size.width * 0.05,
              ),
              LocationButton(
                text: "LẦU 2",
                press: () {},
                icon: Icons.place,
                color: primaryColor,
                isReminded: false,
              ),
              SizedBox(
                width: size.width * 0.05,
              ),
              LocationButton(
                text: "LẦU 2",
                press: () {},
                icon: Icons.place,
                color: primaryColor,
                isReminded: false,
              ),
            ],
          ),
        ));
  }
}
