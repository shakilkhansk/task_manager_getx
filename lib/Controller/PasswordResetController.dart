import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_manager_getx/Api/ApiService.dart';
import 'package:task_manager_getx/Theme/CustomSnackBar.dart';

import '../Api/Urls.dart';

class PasswordResetController extends GetxController {

  final ApiService apiService = ApiService();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController otpTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController confirmPasswordTextController = TextEditingController();

  final RxBool isLoading = false.obs;
  final box = GetStorage();

  Future<void> resetNow() async {
      // isLoading.value = true;
      emailTextController.text = box.read('recoveryEmail');
      otpTextController.text = box.read('otp');
      try {
        // Example API call using the ApiService
        final response = await apiService.post(Urls.registration, data: {
          'email': emailTextController.text,
          'otp': otpTextController.text,
          'password': passwordTextController.text,
          'confirmPassword': confirmPasswordTextController.text,
        });
        // Process the API response as needed
        log('API Response: $response');
        if(response.isSuccess){
          Snackbar.success('Password reset is successful');
          print(response.jsonResponse);
          _clearInput();
          box.erase();
          Get.offAllNamed('/login');
        }else{
          Snackbar.error('Password reset failed plz try again');
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
    otpTextController.clear();
  }
}
