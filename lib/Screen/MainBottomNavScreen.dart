import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/MainBottomNavController.dart';

class MainBottomNavScreen extends StatelessWidget {
  final MainBottomNavController controller = Get.put(MainBottomNavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.selectedScreen),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.selectedIndex(),
          onTap: (index) => controller.updateSelectedIndex(index),
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'New'),
            BottomNavigationBarItem(icon: Icon(Icons.change_circle_outlined), label: 'In Progress'),
            BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Completed'),
            BottomNavigationBarItem(icon: Icon(Icons.close), label: 'Cancelled'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { Get.toNamed('/add'); },
        child: const Icon(Icons.add,color: Colors.white,),
        backgroundColor: Colors.green,
      ),
    );
  }
}

