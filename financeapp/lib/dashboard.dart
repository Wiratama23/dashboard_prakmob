import 'dart:convert';

import 'package:financeapp/components/wallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/middash.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List _user = [];
  String username = "";
  static var balances = 0;
  var abc = DateTime.now();

  //fetch data from json
  Future<void> readJson() async {
    print(abc);
    final String response = await rootBundle.loadString('lib/assets/data.json');
    final data = await json.decode(response);
    setState(() {
      _user = data["user"];
      username = _user.isNotEmpty ? _user[0]["name"] : "";
      balances = _user.isNotEmpty ? _user[0]["balances"] : 0;
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello $username"),
        backgroundColor: Color(0xFF171814),
        elevation: 0,
        leading: Container(
          padding: EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            child: Image.asset('lib/images/profile.jpg'),
          ),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
      ),
      body: Container(
        color: Color(0xFF171814),
        child: Column(
          children: [
            Wallet(balances: balances),
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
