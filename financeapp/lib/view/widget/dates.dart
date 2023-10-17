import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../models/date_model.dart';

class DatesView extends StatelessWidget {
  final DateModel model = Get.put(DateModel());

  @override
  Widget build(BuildContext context) {
    final model = Get.find<DateModel>();

    return Obx(
      () {
        final DateTime firstDateOfMonth = DateTime(
          model.currentDate.value.year,
          model.currentDate.value.month,
          1,
        );
        final DateTime lastDateOfMonth = DateTime(
          model.currentDate.value.year,
          model.currentDate.value.month + 1,
          0,
        );

        final currentDateTime = DateTime.now();
        final isCurrentMonth =
            model.currentDate.value.year == currentDateTime.year &&
                model.currentDate.value.month == currentDateTime.month;

        return Card(
          margin: EdgeInsets.only(left: 10, right: 10),
          color: Color.fromARGB(100, 43, 45, 48),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: model.goToPreviousMonth,
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
                    onPressed: model.dateEnd.value ? null : model.goToNextMonth,
                    icon: Icon(
                      Icons.navigate_next_sharp,
                      size: 30,
                      color:
                          model.dateEnd.value ? Colors.black12 : Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
