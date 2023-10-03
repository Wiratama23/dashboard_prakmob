import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieCharting extends StatelessWidget {
  String optdate = "Week";

  PieCharting({required this.optdate});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.only(top: 140),
      child: Stack(children: [
        PieChart(
          PieChartData(
            sections: [
              PieChartSectionData(
                color: Color.fromARGB(255, 181, 221, 218),
                value: 50,
                title: "",
                radius: 40,
              ),
              PieChartSectionData(
                color: Color.fromARGB(255, 235, 231, 137),
                value: 15,
                title: "",
                radius: 40,
              ),
              PieChartSectionData(
                color: Colors.lightGreenAccent,
                value: 10,
                title: "",
                radius: 40,
              ),
              PieChartSectionData(
                color: Color.fromARGB(100, 43, 45, 48),
                value: 25,
                title: "",
                radius: 20,
              ),
            ],
            borderData: FlBorderData(
              show: false,
            ),
            centerSpaceRadius: 100,
            sectionsSpace: 0,
            startDegreeOffset: -90,
            // pieTouchData: PieTouchData(
            //   touchCallback: (FlTouchEvent event, pieTouchResponse) {},
            // ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("90%",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w500)),
              Text("Expenses ${optdate}",
                  style: TextStyle(
                      color: Color.fromARGB(255, 48, 48, 48), fontSize: 15))
            ],
          ),
        )
      ]),
    );
  }
}
