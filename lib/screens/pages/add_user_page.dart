import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/add_user_controller.dart';

class AddUserPage extends StatelessWidget {
  const AddUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AddUserController controller = Get.put(AddUserController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
        child: Column(
          children: [
            MyField(
              controller: controller.nameController,
              hintText: "Enter Name",
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            MyField(
              controller: controller.descriptionController,
              hintText: "Enter Description",
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: controller.links.length,
                    itemBuilder: (context, index) {
                      final link = controller.links[index];
                      final nameController = link.keys.first;
                      final urlController = link.values.first;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: MyField(
                                controller: nameController,
                                hintText: "Enter Name",
                                onChanged: (value) {},
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              flex: 5,
                              child: MyField(
                                controller: urlController,
                                hintText: "Enter URL",
                                onChanged: (value) {},
                              ),
                            ),
                            IconButton(
                              onPressed: () => controller.removeLink(index),
                              icon: const Icon(Icons.cancel, color: Colors.red),
                            ),
                          ],
                        ),
                      );
                    },
                  )),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[300]!,
                    ),
                    onPressed: controller.addLink,
                    child: const Text("Add Link"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[300]!,
                    ),
                    onPressed: controller.saveUser,
                    child: const Text("Save"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyField extends StatelessWidget {
  final Function(String value)? onChanged;
  final String hintText;
  final TextEditingController? controller;

  const MyField({
    super.key,
    required this.onChanged,
    required this.hintText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Colors.blue[300]!, width: 3),
        ),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Colors.blue[300]!, width: 3),
        ),
      ),
    );
  }
}
