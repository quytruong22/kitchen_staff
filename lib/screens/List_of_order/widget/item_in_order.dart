import 'package:chef_application/config/theme.dart';
import 'package:chef_application/repos/models/checkdetail_obj.dart';
import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

class OrderItemView extends StatefulWidget {
  final CheckDetailDTO checkDetail;

  const OrderItemView({Key? key, required this.checkDetail}) : super(key: key);

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

  // Widget quantitySelect(BuildContext context) {
  //   Size size = MediaQuery.of(context).size;
  //   if (widget.checkDetail.isSelected) {
  //     num limit = widget.checkDetail.quantity;
  //     return Container(
  //       height: 56,
  //       width: 12,
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           SizedBox(
  //             height: 56 / 3,
  //             child: IconButton(
  //                 padding: EdgeInsets.zero,
  //                 alignment: Alignment.center,
  //                 onPressed: (() {
  //                   if (widget.checkDetail.quantitySelected < limit) {
  //                     setState(() {
  //                       widget.checkDetail.increaseQuantitySelected();

  //                       quantity =
  //                           widget.checkDetail.quantitySelected.toString();
  //                     });
  //                   }
  //                 }),
  //                 icon: const Icon(
  //                   Icons.arrow_upward,
  //                   size: 12,
  //                 )),
  //           ),
  //           SizedBox(
  //             height: 56 / 3,
  //             child: Text(
  //               quantity,
  //               textAlign: TextAlign.center,
  //             ),
  //           ),
  //           SizedBox(
  //             height: 56 / 3,
  //             child: IconButton(
  //                 padding: EdgeInsets.zero,
  //                 alignment: Alignment.center,
  //                 onPressed: (() {
  //                   if (widget.checkDetail.quantitySelected > 1) {
  //                     setState(() {
  //                       widget.checkDetail.decreaseQuantitySelected();

  //                       quantity =
  //                           widget.checkDetail.quantitySelected.toString();
  //                     });
  //                   }
  //                 }),
  //                 icon: const Icon(
  //                   Icons.arrow_downward,
  //                   size: 12,
  //                 )),
  //           ),
  //         ],
  //       ),
  //     );
  //   } else {
  //     return SizedBox();
  //   }
  // }

  List<Widget> checkDetailShow(BuildContext context) {
    List<Widget> list = [];
    list.add(Text(
      widget.checkDetail.itemname,
      style: const TextStyle(
          color: textColor, fontSize: 14, fontWeight: FontWeight.bold),
      textAlign: TextAlign.left,
    ));
    if (widget.checkDetail.specialrequest.isNotEmpty) {
      list.add(Text.rich(TextSpan(
          children: widget.checkDetail.specialrequest
              .map((e) => TextSpan(
                    text: e.name + ', ',
                    style: const TextStyle(color: textColor, fontSize: 12),
                  ))
              .toList())));
    }
    if (widget.checkDetail.note != "") {
      list.add(Text(
        widget.checkDetail.note,
        style: const TextStyle(color: textColor, fontSize: 12),
        textAlign: TextAlign.left,
      ));
    }
    return list;
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
            SizedBox(
              width: size.width * 0.02,
              child: Text(
                widget.checkDetail.quantity.toString() + 'x',
                style: const TextStyle(
                    color: textColor,
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
            SizedBox(
              height: 56,
            )
            //quantitySelect(context)
          ]),
    );
  }
}
