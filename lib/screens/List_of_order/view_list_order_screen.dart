import 'dart:async';

import 'package:chef_application/common/widgets/action_button.dart';
import 'package:chef_application/common/widgets/background.dart';
import 'package:chef_application/common/widgets/side_bar.dart';
import 'package:chef_application/repos/models/check_obj.dart';
import 'package:chef_application/repos/repository/socket.dart';
import 'package:chef_application/repos/service/check_service.dart';
import 'package:chef_application/screens/List_of_order/widget/order.dart';
import 'package:flutter/material.dart';
import 'package:chef_application/config/theme.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';

class ListOrderScreen extends StatefulWidget {
  const ListOrderScreen({Key? key}) : super(key: key);

  @override
  State<ListOrderScreen> createState() => _ListOrderScreenState();
}

class _ListOrderScreenState extends State<ListOrderScreen> {
  CheckService service = CheckService();
  List<CheckDTO> list = [];
  Socket socket = Socket();
  late Timer timer;

  List<Widget> listCheck(List<CheckDTO> list) {
    return list.map((e) => OrderView(check: e)).toList();
  }

  @override
  void initState() {
    super.initState();

    socket.declareSocket();
    socket.connectServer();
    socket.socket.on('update-kds-kitchen', (data) {
      setState(() {});
    });
    timer = Timer.periodic(const Duration(seconds: 30), ((timer) {
      setState(() {
        if (socket.socket.disconnected) {
          print('reload - disconnected');
          socket.connectServer();
        } else {
          print('reload - connected');
        }
      });
    }));
  }

  @override
  void dispose() {
    super.dispose();
    socket.disconnectServer();
    socket.socket.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        color: bgColor,
        child: SafeArea(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SideBar(selectedIndex: 1),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: size.width - 75,
                    height: size.height - 99,
                    child: FutureBuilder(
                        future: service.getChecks(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            list = snapshot.requireData;
                            return SingleChildScrollView(
                                child: MasonryView(
                              itemRadius: 0,
                              itemPadding: 0,
                              itemBuilder: (item) {
                                return item;
                              },
                              numberOfColumn: 4,
                              listOfItem: listCheck(list),
                            ));
                          }
                          if (snapshot.hasError) {}
                          return const Center(
                              child: CircularProgressIndicator());
                        })),
                Container(
                  color: primaryColor,
                  width: size.width - 75,
                  height: 75,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ActionButton(
                          text: "HOÀN THÀNH",
                          press: () async {
                            await service.readyCheckDetail(list);
                            setState(() {});
                          },
                          icon: Icons.fastfood,
                          color: warningColor),
                      ActionButton(
                          text: "ĐÃ HẾT",
                          press: () async {
                            await service.recallCheckDetail(list);
                            setState(() {});
                          },
                          icon: Icons.no_food,
                          color: voidColor),
                    ],
                  ),
                )
              ],
            )
          ],
        )));
  }
}
