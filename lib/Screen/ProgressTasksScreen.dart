import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_getx/Controller/ScreenControllers/ProgressTaskListController.dart';
import 'package:task_manager_getx/Screen/Widgets/ProfileSummaryCard.dart';
import 'package:task_manager_getx/Screen/Widgets/TaskItemCard.dart';

import '../Models/TaskCountSummaryListModel.dart';


class ProgressTasksScreen extends StatelessWidget {
  ProgressTasksScreen({super.key});
  final ProgressTaskListController _progressTaskListController = Get.put(ProgressTaskListController());
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
                    visible: !_progressTaskListController.isLoading(),
                    replacement: const Center(child: CircularProgressIndicator()),
                    child: RefreshIndicator(
                      onRefresh: _progressTaskListController.getNewTaskList,
                      child: ListView.builder(
                        itemCount: _progressTaskListController.tasks.length??0,
                        itemBuilder: (context, index) {
                          return TaskItemCard(task: _progressTaskListController.tasks[index]);
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
