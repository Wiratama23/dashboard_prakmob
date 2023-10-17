import 'package:get/get.dart';

class DateModel extends GetxController {
  Rx<DateTime> currentDate = DateTime.now().obs;
  RxBool dateEnd = true.obs;

  void goToPreviousMonth() {
    currentDate.value = DateTime(
      currentDate.value.year,
      currentDate.value.month - 1,
      1,
    );
    dateEnd.value = false;
  }

  void goToNextMonth() {
    final DateTime nextMonth = DateTime(
      currentDate.value.year,
      currentDate.value.month + 1,
      1,
    );
    final DateTime currentDateTime = DateTime.now();

    if (nextMonth.month == currentDateTime.month) {
      currentDate.value = DateTime(
        currentDateTime.year,
        currentDateTime.month,
        currentDateTime.day,
      );
      dateEnd.value = true;
    } else {
      currentDate.value = DateTime(
        nextMonth.year,
        nextMonth.month + 1,
        0,
      );
    }
  }
}
