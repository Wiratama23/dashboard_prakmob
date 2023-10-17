import 'package:financeapp/view/widget/middash.dart';
import 'package:financeapp/view/widget/profile.dart';
import 'package:financeapp/view/widget/wallet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/readjson.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var abc = DateTime.now();
  final DataController dataController = DataController();

  @override
  void initState() {
    super.initState();
    dataController.readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text("Hello ${dataController.username.value}")),
        backgroundColor: Color(0xFF171814),
        elevation: 0,
        leading: Container(padding: EdgeInsets.all(10), child: Profile()),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
      ),
      body: Container(
        color: Color(0xFF171814),
        child: Column(
          children: [
            Obx(() => Wallet(balances: dataController.balances.value)),
            MidDash(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 181, 221, 218),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.home)),
            IconButton(onPressed: () {}, icon: Icon(Icons.calendar_month)),
            IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
            IconButton(onPressed: () {}, icon: Icon(Icons.person)),
          ],
        ),
      ),
    );
  }
}
