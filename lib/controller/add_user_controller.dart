import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linktree_prinx/helper/api_helper.dart';
import 'package:linktree_prinx/screens/pages/home_page.dart';

class AddUserController extends GetxController {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final links = <Map<TextEditingController, TextEditingController>>[].obs;

  @override
  void onInit() {
    super.onInit();
    addLink(); // Start with one link field
  }

  void addLink() {
    links.add({
      TextEditingController(): TextEditingController(),
    });
  }

  void removeLink(int index) {
    links.removeAt(index);
  }

  void saveUser() async {
    final name = nameController.text.trim();
    final description = descriptionController.text.trim();
    final linkData = links
        .map((link) => {
              'name': link.keys.first.text.trim(),
              'url': link.values.first.text.trim(),
            })
        .toList();

    if (name.isNotEmpty && description.isNotEmpty && linkData.isNotEmpty) {
      // Perform the save operation or API call
      log("Name: $name");
      log("Description: $description");
      log("Links: $linkData");
      await ApiHelper.apiHelper
          .insertUser(name: name, desc: description, links: linkData.toList())
          .then(
        (value) {
          Get.snackbar("Success", "User saved successfully!");
          // Navigate to the dashboard or go back to the previous screen
          Get.offAll(const HomePage());
        },
      );
    } else {
      Get.snackbar("Error", "Please fill all fields");
    }
  }
}
