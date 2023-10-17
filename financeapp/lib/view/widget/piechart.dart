import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieCharting extends StatelessWidget {
  final String optdate;
  final String pieStatus;

  PieCharting({required this.optdate, required this.pieStatus});

  @override
  Widget build(BuildContext context) {
    var value1 = 45.0;
    var value2 = 20.0;
    var value3 = 15.0;
    var maxVal = 100.0;
    return Container(
      // padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.only(top: 140),
      child: Stack(children: [
        PieChart(
          PieChartData(
            sections: [
              PieChartSectionData(
                color: Color.fromARGB(255, 181, 221, 218),
                value: value1,
                title: "",
                radius: 40,
              ),
              PieChartSectionData(
                color: Color.fromARGB(255, 235, 231, 137),
                value: value2,
                title: "",
                radius: 40,
              ),
              PieChartSectionData(
                color: Colors.lightGreenAccent,
                value: value3,
                title: "",
                radius: 40,
              ),
              PieChartSectionData(
                color: Color.fromARGB(100, 43, 45, 48),
                value: maxVal - (value1 + value2 + value3),
                title: "",
                radius: 20.8,
              ),
            ],
            borderData: FlBorderData(
              show: false,
            ),
            centerSpaceRadius: 100,
            sectionsSpace: 0,
            startDegreeOffset: -90,
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${(value1 + value2 + value3).toInt()}%",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w500)),
              Text("${pieStatus} ${optdate}",
                  style: TextStyle(
                      color: Color.fromARGB(255, 48, 48, 48), fontSize: 15))
            ],
          ),
        )
      ]),
    );
  }
}
