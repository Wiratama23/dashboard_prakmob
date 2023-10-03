import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Dates extends StatefulWidget {
  @override
  _Dates createState() => _Dates();
}

class _Dates extends State<Dates> {
  DateTime currentDate = DateTime.now();
  bool dateend = true;

  void goToPreviousMonth() {
    setState(() {
      currentDate = DateTime(currentDate.year, currentDate.month - 1, 1);
      dateend = false;
    });
  }

  void goToNextMonth() {
    final DateTime currentDateTime = DateTime.now();
    final DateTime nextMonth =
        DateTime(currentDate.year, currentDate.month + 1, 1);

    if (nextMonth.month == currentDateTime.month) {
      // If the next month is the same as the current month, display the current local date range
      setState(() {
        currentDate = DateTime(
            currentDateTime.year, currentDateTime.month, currentDateTime.day);
        dateend = true;
      });
    } else {
      // If the next month is different, update currentDate to the next month with the latest day
      setState(() {
        currentDate = DateTime(nextMonth.year, nextMonth.month + 1, 0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final DateTime firstDateOfMonth =
        DateTime(currentDate.year, currentDate.month, 1);
    final DateTime lastDateOfMonth =
        DateTime(currentDate.year, currentDate.month + 1, 0);

    final currentDateTime = DateTime.now();
    final isCurrentMonth = currentDate.year == currentDateTime.year &&
        currentDate.month == currentDateTime.month;

    return Card(
      margin: EdgeInsets.only(left: 10, right: 10),
      color: Color.fromARGB(100, 43, 45, 48),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: goToPreviousMonth,
                icon: Icon(
                  Icons.navigate_before_sharp,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              Text(
                isCurrentMonth
                    ? '${DateFormat('MMM d, yyyy').format(firstDateOfMonth)} - ${DateFormat('MMM d, yyyy').format(currentDateTime)}'
                    : '${DateFormat('MMM d, yyyy').format(firstDateOfMonth)} - ${DateFormat('MMM d, yyyy').format(lastDateOfMonth)}',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              IconButton(
                onPressed: isCurrentMonth ? null : goToNextMonth,
                // Disable the button for the current month
                icon: Icon(
                  Icons.navigate_next_sharp,
                  size: 30,
                  color: dateend ? Colors.black12 : Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
