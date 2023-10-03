import 'package:flutter/material.dart';

class Wallet extends StatelessWidget {
  var balances;

  Wallet({required this.balances});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        margin: EdgeInsets.all(10),
        child: Card(
          color: Colors.yellow[100],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.all(10),
                      child:
                          Text("Your Wallet", style: TextStyle(fontSize: 17))),
                  Padding(
                      padding: EdgeInsets.all(2),
                      child: IconButton(
                        onPressed: () {
                          print("Clicked");
                        },
                        icon: Icon(Icons.light_mode,
                            size: 15, color: Colors.grey),
                      ))
                ],
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    Text("BALANCE", style: TextStyle(fontSize: 17)),
                    Text("Rp. $balances",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
