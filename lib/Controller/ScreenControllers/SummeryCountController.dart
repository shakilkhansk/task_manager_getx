import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_manager_getx/Api/ApiService.dart';
import 'package:task_manager_getx/Models/TaskCountSummaryListModel.dart';
import 'package:task_manager_getx/Models/TaskListModel.dart';
import 'package:task_manager_getx/Theme/CustomSnackBar.dart';

import '../../Api/Urls.dart';
import '../../Models/TaskModel.dart';


class SummeryCountController extends GetxController {

  final ApiService apiService = ApiService();

  final RxBool isLoading = false.obs;
  final box = GetStorage();
  RxList<Map<String, dynamic>> statusCount = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    getSummery();
  }
  Future<void> getSummery() async {
    isLoading.value = true;
    try {
      // Example API call using the ApiService
      final response = await apiService.get(Urls.getTaskStatusCount);
      // Process the API response as needed
      // print(response.jsonResponse);
      if(response.isSuccess){
        final List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(response.jsonResponse['data']);
        statusCount.assignAll(data);
        // statusCount = response.jsonResponse['data'];
        update();
        // _clearInput();
        // Get.toNamed('otpVerify');
      }else{
        Snackbar.error('Summery count failed plz try again');
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
