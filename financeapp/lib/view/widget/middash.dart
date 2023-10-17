import 'package:financeapp/controllers/middash_controller.dart';
import 'package:financeapp/view/widget/dates.dart';
import 'package:financeapp/view/widget/piechart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MidDash extends StatefulWidget {
  @override
  _MidDash createState() => _MidDash();
}

class _MidDash extends State<MidDash> {
  final MidDashController controller = Get.put(MidDashController());

  ButtonStyle active = ElevatedButton.styleFrom(
    foregroundColor: Colors.black87,
    backgroundColor: Color.fromARGB(255, 235, 231, 137),
  );

  ButtonStyle inactive = ElevatedButton.styleFrom(
    foregroundColor: Color.fromRGBO(164, 161, 101, 30),
    backgroundColor: Color.fromARGB(100, 164, 161, 101),
  );

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
                Obx(() => ElevatedButton(
                      onPressed: () {
                        controller.setExpense();
                      },
                      child: const Text("Expense"),
                      style:
                          controller.button_num.value == 1 ? active : inactive,
                    )),
                Obx(
                  () => ElevatedButton(
                      onPressed: () {
                        controller.setIncome();
                      },
                      child: const Text("Income"),
                      style:
                          controller.button_num.value == 2 ? active : inactive),
                ),
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
        DatesView(),
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
                    controller.setOptDate("Today");
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
                    controller.setOptDate("This Week");
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
                    controller.setOptDate("This Month");
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
                    controller.setOptDate("This Year");
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
                    controller.setOptDate("This Period");
                  },
                  child: Text("Period", style: TextStyle(fontSize: 9)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(100, 43, 45, 48)),
                ),
              ),
            ],
          ),
        ),
        Container(
            height: 200,
            child: Obx(() => PieCharting(
                  optdate: controller.optdate.value,
                  pieStatus: controller.pieStatus.value,
                ))),
      ],
    );
  }
}
