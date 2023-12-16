import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_manager_getx/Api/ApiService.dart';
import 'package:task_manager_getx/Models/TaskListModel.dart';
import 'package:task_manager_getx/Theme/CustomSnackBar.dart';

import '../../Api/Urls.dart';
import '../../Models/TaskModel.dart';


class CompletedTaskListController extends GetxController {

  final ApiService apiService = ApiService();

  final RxBool isLoading = false.obs;
  final box = GetStorage();
  final RxList<Task> tasks = <Task>[].obs;
  final RxList statusList = ['New', 'Progress', 'Completed','Cancelled'].obs;

  Future<void> changeStatus(Task task, String newStatus) async {
    task.status = newStatus;
    final response = await apiService.get(Urls.updateTaskStatus(task.sId.toString(),newStatus));
    print(response.jsonResponse);
    if(response.isSuccess){
      getNewTaskList();
      update();
    }else{
      Snackbar.error('Update failed plz try again');
    }
    update();
  }
  @override
  void onInit() {
    super.onInit();
    getNewTaskList();
  }
  Future<void> getNewTaskList() async {
    isLoading.value = true;
    try {
      final response = await apiService.get(Urls.getCompletedTasks);
      if(response.isSuccess){
        final List<dynamic> data = response.jsonResponse['data'];
        tasks.assignAll(data.map((json) => Task.fromJson(json)).toList());
        update();

        // _clearInput();
        // Get.toNamed('otpVerify');
      }else{
        Snackbar.error('Tasklist failed plz try again');
      }
    } catch (error) {
      log('API call error: $error');
      Snackbar.error('Request failed plz try again');
    } finally {
      isLoading.value = false;
    }
  }

  void _clearInput() {
    // emailTextController.clear();
  }
}
