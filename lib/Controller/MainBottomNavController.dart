import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_getx/Screen/CancelledTasksScreen.dart';
import 'package:task_manager_getx/Screen/CompletedTasksScreen.dart';
import 'package:task_manager_getx/Screen/NewTasksScreen.dart';
import 'package:task_manager_getx/Screen/ProgressTasksScreen.dart';

class MainBottomNavController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  List<Widget> screens = [
    NewTasksScreen(),
    ProgressTasksScreen(),
    CompletedTasksScreen(),
    CancelledTasksScreen(),
  ];

  Widget get selectedScreen => screens[selectedIndex.value];

  void updateSelectedIndex(int index) {
    selectedIndex.value = index;
    print(index);
  }
}

