import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  final user = <Map<String, dynamic>>[].obs;
  final username = ''.obs;
  final balances = 0.obs;

  // @override
  // void onInit() {
  //   readJson();
  //   super.onInit();
  // }

  //fetch data from json
  Future<void> readJson() async {
    try {
      final String response =
          await rootBundle.loadString('lib/assets/data.json');
      final data = json.decode(response);

      user.value = (data["user"] as List).cast<Map<String, dynamic>>();
      username.value = user.isNotEmpty ? user[0]["name"] : "";
      balances.value = user.isNotEmpty ? user[0]["balances"] : 0;
      print("User: $user, Username: $username, Balances: $balances");
    } catch (e) {
      print("Error loading JSON: $e");
    }
  }
}
