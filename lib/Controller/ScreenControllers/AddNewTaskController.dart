// AddNewTaskController.dart
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:task_manager_getx/Api/ApiService.dart';
import 'package:task_manager_getx/Controller/ScreenControllers/NewTaskListController.dart';
import 'package:task_manager_getx/Controller/ScreenControllers/SummeryCountController.dart';
import 'package:task_manager_getx/Theme/CustomSnackBar.dart';

import '../../Api/Urls.dart';


class AddNewTaskController extends GetxController {

  final ApiService apiService = ApiService();
  final TextEditingController subjectTextController = TextEditingController();
  final TextEditingController descriptionTextController = TextEditingController();

  final RxBool isLoading = false.obs;

  Future<void> create() async {
    isLoading.value = true;
    // update();

    try {
      // Example API call using the ApiService
      final response = await apiService.post(Urls.createNewTask, data: {
        'title': subjectTextController.text,
        'description': descriptionTextController.text,
        "status":"New"
      });
      // Process the API response as needed
      log('API Response: $response');
      if(response.isSuccess){
        Snackbar.success('Task create is successful');
        update();
        _clearInput();
      }else{
        Snackbar.error('Task create failed plz try again');
      }
    } catch (error) {
      log('API call error: $error');
      Snackbar.error('Request failed plz try again');
    } finally {
      isLoading.value = false;
    }
  }

  void _clearInput() {
    subjectTextController.clear();
    descriptionTextController.clear();
    update();
  }
}
