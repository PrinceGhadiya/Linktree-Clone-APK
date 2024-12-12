import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Home Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 6),
            TextField(
              onChanged: controller.updateSearchText,
              decoration: InputDecoration(
                hintText: "Search for items",
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.blue[300]!, width: 3),
                ),
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.blue[300]!, width: 3),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }

                if (controller.errorMessage.value.isNotEmpty) {
                  return Center(
                    child: Text("ERROR: ${controller.errorMessage.value}"),
                  );
                }

                if (controller.users.isEmpty) {
                  return const Center(
                    child: Text("User Not Found"),
                  );
                }

                return ListView.builder(
                  itemCount: controller.users.length,
                  itemBuilder: (context, index) {
                    final user = controller.users[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed("/detail", arguments: user);
                      },
                      child: ListTile(
                        leading: const CircleAvatar(),
                        title: Text(user['name']),
                        subtitle: Text(user['desc']),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          Get.toNamed("/addUser");
        },
        child: const Icon(
          CupertinoIcons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
