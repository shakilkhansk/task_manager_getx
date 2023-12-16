import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../Controller/ScreenControllers/NewTaskListController.dart';
import '../../Models/TaskModel.dart';

class TaskItemCard extends StatelessWidget {
  TaskItemCard({super.key,required this.task});
  final Task task;
  final NewTaskListController _newTaskListController = Get.put(NewTaskListController());
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title??'',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Text(task.description??''),
            Text('Date : ${task.createdDate}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text(task.status.toString().split('.').last,style: const TextStyle(color: Colors.white)),
                  backgroundColor: Colors.blue,
                ),
                Wrap(
                  children: [
                    IconButton(
                        onPressed: () {
                          _showStatusDialog(context, task);
                        },
                        icon: const Icon(Icons.edit)),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }


  Future<void> _showStatusDialog(BuildContext context, Task task) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Change Status'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButton<String>(
                value: task.status,
                onChanged: (newStatus) {
                  _newTaskListController.changeStatus(task, newStatus!);
                  _newTaskListController.changeStatus(task, newStatus!);
                  Get.back();
                },
                items: _newTaskListController.statusList
                    .map<DropdownMenuItem<String>>(
                      (status) => DropdownMenuItem<String>(
                    value: status,
                    child: Text(status),
                  ),
                )
                    .toList(),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(null);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
