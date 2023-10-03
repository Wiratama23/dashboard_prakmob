import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieCharting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.only(top: 140),
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              color: const Color(0xFF02BB9F),
              value: 40,
              title: "Hobby",
              radius: 70,
            ),
            PieChartSectionData(
              color: const Color(0xFFAA69E5),
              value: 30,
              title: "Kebutuhan",
              radius: 70,
            ),
            PieChartSectionData(
              color: const Color(0xFFFFA232),
              value: 20,
              title: "Investasi",
              radius: 70,
            ),
            PieChartSectionData(
              color: const Color(0xFFFE4D78),
              value: 10,
              title: "Dana Darurat",
              radius: 70,
            ),
          ],
          borderData: FlBorderData(
            show: false,
          ),
          centerSpaceRadius: 65,
          sectionsSpace: 0,
          startDegreeOffset: -90,
          // pieTouchData: PieTouchData(
          //   touchCallback: (FlTouchEvent event, pieTouchResponse) {},
          // ),
        ),
      ),
    );
  }
}
