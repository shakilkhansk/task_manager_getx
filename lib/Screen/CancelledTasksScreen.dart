import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_getx/Controller/ScreenControllers/CancelledTaskListController.dart';
import 'package:task_manager_getx/Screen/Widgets/ProfileSummaryCard.dart';
import 'package:task_manager_getx/Screen/Widgets/TaskItemCard.dart';

import '../Models/TaskCountSummaryListModel.dart';


class CancelledTasksScreen extends StatelessWidget {
  CancelledTasksScreen({super.key});
  final CancelledTaskListController _cancelledTaskListController = Get.put(CancelledTaskListController());
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
                    visible: !_cancelledTaskListController.isLoading(),
                    replacement: const Center(child: CircularProgressIndicator()),
                    child: RefreshIndicator(
                      onRefresh: _cancelledTaskListController.getNewTaskList,
                      child: ListView.builder(
                        itemCount: _cancelledTaskListController.tasks.length??0,
                        itemBuilder: (context, index) {
                          return TaskItemCard(task: _cancelledTaskListController.tasks[index]);
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
