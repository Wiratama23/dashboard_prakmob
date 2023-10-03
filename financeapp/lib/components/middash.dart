import 'package:financeapp/components/dates.dart';
import 'package:financeapp/components/piechart.dart';
import 'package:flutter/material.dart';

class MidDash extends StatefulWidget {
  @override
  _MidDash createState() => _MidDash();
}

class _MidDash extends State<MidDash> {
  bool isButtonActive = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //button upper date
        Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isButtonActive = true;
                      });
                    },
                    child: const Text("Expense"),
                    style: ElevatedButton.styleFrom(
                        foregroundColor: isButtonActive
                            ? Colors.black87
                            : Color.fromRGBO(164, 161, 101, 30),
                        backgroundColor: isButtonActive
                            ? Color.fromARGB(255, 235, 231, 137)
                            : Color.fromARGB(100, 164, 161, 101))),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isButtonActive = false;
                      });
                    },
                    child: const Text("Income"),
                    style: ElevatedButton.styleFrom(
                        foregroundColor: isButtonActive
                            ? Color.fromRGBO(164, 161, 101, 30)
                            : Colors.black87,
                        backgroundColor: isButtonActive
                            ? Color.fromARGB(100, 164, 161, 101)
                            : Color.fromARGB(255, 235, 231, 137))),
              ]),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_circle,
                    color: Colors.grey,
                    size: 40,
                  ))
            ],
          ),
        ),
        Dates(),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, child: Text("Day")),
                ElevatedButton(onPressed: () {}, child: Text("Week")),
                ElevatedButton(onPressed: () {}, child: Text("Month")),
                ElevatedButton(onPressed: () {}, child: Text("Year")),
                ElevatedButton(onPressed: () {}, child: Text("Period")),
              ],
            ),
          ),
        ),
        Container(height: 200, child: PieCharting()),
      ],
    );
  }
}
