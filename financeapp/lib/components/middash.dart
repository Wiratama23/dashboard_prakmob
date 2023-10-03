import 'package:financeapp/components/dates.dart';
import 'package:financeapp/components/piechart.dart';
import 'package:flutter/material.dart';

class MidDash extends StatefulWidget {
  @override
  _MidDash createState() => _MidDash();
}

class _MidDash extends State<MidDash> {
  bool isButtonActive = false;
  String optdate = "Week";

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 58,
                height: 30,
                // padding: EdgeInsets.all(5),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      optdate = "Today";
                    });
                  },
                  child: Text("Day", style: TextStyle(fontSize: 10)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(100, 43, 45, 48)),
                ),
              ),
              Container(
                width: 58,
                height: 30,
                // padding: EdgeInsets.all(5),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      optdate = "This Week";
                    });
                  },
                  child: Text("Week", style: TextStyle(fontSize: 10)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(100, 43, 45, 48)),
                ),
              ),
              Container(
                width: 58,
                height: 30,
                // padding: EdgeInsets.all(5),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      optdate = "This Month";
                    });
                  },
                  child: Text("Month", style: TextStyle(fontSize: 10)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(100, 43, 45, 48)),
                ),
              ),
              Container(
                width: 58,
                height: 30,
                // padding: EdgeInsets.all(5),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      optdate = "This Year";
                    });
                  },
                  child: Text("Year", style: TextStyle(fontSize: 10)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(100, 43, 45, 48)),
                ),
              ),
              Container(
                width: 58,
                height: 30,
                // padding: EdgeInsets.all(5),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      optdate = "This Period";
                    });
                  },
                  child: Text("Period", style: TextStyle(fontSize: 9)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(100, 43, 45, 48)),
                ),
              ),
            ],
          ),
        ),
        Container(height: 200, child: PieCharting(optdate: optdate)),
      ],
    );
  }
}
