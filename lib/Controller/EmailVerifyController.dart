import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_manager_getx/Api/ApiService.dart';
import 'package:task_manager_getx/Theme/CustomSnackBar.dart';

import '../Api/Urls.dart';

class EmailVerifyController extends GetxController {

  final ApiService apiService = ApiService();
  final TextEditingController emailTextController = TextEditingController();

  final RxBool isLoading = false.obs;
  final box = GetStorage();

  Future<void> verifyEmail() async {
      isLoading.value = true;
      // update();

      try {
        // Example API call using the ApiService
        final response = await apiService.get(Urls.verifyEmail(emailTextController.text));
        // Process the API response as needed
        print(response.jsonResponse);
        if(response.isSuccess){
          Snackbar.success('OTP successfully sent');
          box.write('recoveryEmail', emailTextController.text);
          _clearInput();
          Get.toNamed('otpVerify');
        }else{
          Snackbar.error('OTP send failed plz try again');
        }
      } catch (error) {
        log('API call error: $error');
        Snackbar.error('Request failed plz try again');
      } finally {
        isLoading.value = false;
      }
  }

  void _clearInput() {
    emailTextController.clear();
  }
}
