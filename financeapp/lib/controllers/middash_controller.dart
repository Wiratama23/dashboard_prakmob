import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MidDashController extends GetxController {
  var button_num = 1.obs;
  var optdate = "This Week".obs;
  var pieStatus = "Expense".obs;
  var foreground_active = Colors.black87.obs;
  var background_active = Color.fromARGB(255, 235, 231, 137).obs;

  ButtonStyle activeStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.black87,
    backgroundColor: Color.fromARGB(255, 235, 231, 137),
  );

  ButtonStyle inactiveStyle = ElevatedButton.styleFrom(
    foregroundColor: Color.fromRGBO(164, 161, 101, 30),
    backgroundColor: Color.fromARGB(100, 164, 161, 101),
  );

  void setExpense() {
    button_num.value = 1;
    pieStatus.value = "Expense";
  }

  void setIncome() {
    button_num.value = 2;
    pieStatus.value = "Income";
  }

  void setOptDate(String date) {
    optdate.value = date;
  }
}
