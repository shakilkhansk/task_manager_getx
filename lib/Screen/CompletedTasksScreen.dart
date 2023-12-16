import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_getx/Controller/ScreenControllers/CompletedTaskListController.dart';
import 'package:task_manager_getx/Screen/Widgets/ProfileSummaryCard.dart';
import 'package:task_manager_getx/Screen/Widgets/TaskItemCard.dart';

import '../Models/TaskCountSummaryListModel.dart';


class CompletedTasksScreen extends StatelessWidget {
  CompletedTasksScreen({super.key});
  final CompletedTaskListController _completedTaskListController = Get.put(CompletedTaskListController());
  TaskCountSummaryListModel taskCountSummaryListModel = TaskCountSummaryListModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ProfileSummaryCard(),
            Expanded(
                child: Obx(
                      () => Visibility(
                    visible: !_completedTaskListController.isLoading(),
                        replacement: const Center(child: CircularProgressIndicator()),
                    child: RefreshIndicator(
                      onRefresh: _completedTaskListController.getNewTaskList,
                      child: ListView.builder(
                        itemCount: _completedTaskListController.tasks.length??0,
                        itemBuilder: (context, index) {
                          return TaskItemCard(task: _completedTaskListController.tasks[index]);
                        },),
                    ),
                  ),
                )
            )

          ],
        ),
      ),
    );
  }
}
