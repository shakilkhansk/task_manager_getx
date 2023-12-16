import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_getx/Controller/ScreenControllers/NewTaskListController.dart';
import 'package:task_manager_getx/Controller/ScreenControllers/SummeryCountController.dart';
import 'package:task_manager_getx/Screen/Widgets/ProfileSummaryCard.dart';
import 'package:task_manager_getx/Screen/Widgets/SummaryCard.dart';
import 'package:task_manager_getx/Screen/Widgets/TaskItemCard.dart';

import '../Models/TaskCountSummaryListModel.dart';


class NewTasksScreen extends StatelessWidget {
  NewTasksScreen({super.key});
  final NewTaskListController _newTaskListController = Get.put(NewTaskListController());
  final SummeryCountController _summeryCountController = Get.put(SummeryCountController());
  TaskCountSummaryListModel taskCountSummaryListModel = TaskCountSummaryListModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ProfileSummaryCard(),
            Obx( () => Visibility(
                visible: !_newTaskListController.isLoading(),
                replacement: const Center(child: LinearProgressIndicator()),
                child: SizedBox(
                  height: 100,
                  child: Obx(
                    () => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount : _summeryCountController.statusCount.length,
                      itemBuilder: (context, index) {
                        return FittedBox(
                          child: Obx(
                            () => SummaryCard(
                              count: _summeryCountController.statusCount[index]['sum'].toString(),
                              title: _summeryCountController.statusCount[index]['_id'],
                            ),
                          ),);
                      },),
                  ),
                ),
              ),
            ),
            Expanded(
                child: Obx(
                      () => Visibility(
                        visible: !_newTaskListController.isLoading(),
                        replacement: const Center(child: CircularProgressIndicator()),
                        child: RefreshIndicator(
                          onRefresh: _newTaskListController.getNewTaskList,
                          child: ListView.builder(
                        itemCount: _newTaskListController.tasks.length??0,
                        itemBuilder: (context, index) {
                          return TaskItemCard(task: _newTaskListController.tasks[index]);
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
