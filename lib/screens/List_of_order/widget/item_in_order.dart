import 'package:chef_application/config/theme.dart';
import 'package:chef_application/repos/models/checkdetail_obj.dart';
import 'package:flutter/material.dart';

class OrderItemView extends StatefulWidget {
  final CheckDetailDTO checkDetail;

  const OrderItemView({Key? key, required this.checkDetail}) : super(key: key);

  @override
  State<OrderItemView> createState() => _OrderItemViewState();
}

class _OrderItemViewState extends State<OrderItemView> {
  List<String> specialRequests = [];
  Color backgroundColor() {
    if (widget.checkDetail.isSelected) {
      return activeColor;
    } else {
      return widget.checkDetail.isreminded ? warningColor : textLightColor;
    }
  }

  Color noteColor() {
    if (widget.checkDetail.isSelected) {
      return textLightColor;
    } else {
      return textColor;
    }
  }

  List<Widget> checkDetailShow(BuildContext context) {
    List<Widget> list = [];
    list.add(Text(
      widget.checkDetail.itemname,
      style: TextStyle(
          color: noteColor(), fontSize: 14, fontWeight: FontWeight.bold),
      textAlign: TextAlign.left,
    ));
    if (specialRequests != []) {
      list.add(Text(
        specialRequests.join(", "),
        style: TextStyle(color: noteColor(), fontSize: 12),
      ));
    }

    if (widget.checkDetail.note != "") {
      list.add(Text(
        widget.checkDetail.note,
        style: TextStyle(color: noteColor(), fontSize: 12),
        textAlign: TextAlign.left,
      ));
    }
    return list;
  }

  @override
  void initState() {
    super.initState();
    if (widget.checkDetail.specialrequest.isNotEmpty) {
      for (var specialRequest in widget.checkDetail.specialrequest) {
        specialRequests.add(specialRequest.name);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(size.width * 0.25, 56),
        maximumSize: Size(size.width * 0.25, double.infinity),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        backgroundColor: backgroundColor(),
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
            SizedBox(
              width: size.width * 0.02,
              child: Text(
                widget.checkDetail.quantity.toString() + 'x',
                style: TextStyle(
                    color: noteColor(),
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: size.width * 0.18 - 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: checkDetailShow(context),
              ),
            ),
            const SizedBox(
              height: 56,
            )
            //quantitySelect(context)
          ]),
    );
  }
}
