import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_manager_getx/Api/ApiService.dart';
import 'package:task_manager_getx/Theme/CustomSnackBar.dart';

import '../Api/Urls.dart';

class OtpVerifyController extends GetxController {

  final ApiService apiService = ApiService();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController otpTextController = TextEditingController();

  final RxBool isLoading = false.obs;
  final box = GetStorage();

  Future<void> verifyOtp() async {
      // isLoading.value = true;
      emailTextController.text = box.read('recoveryEmail');
      try {
        // Example API call using the ApiService
        final response = await apiService.get(Urls.verifyOtp(emailTextController.text,otpTextController.text));
        // Process the API response as needed
        print(response.jsonResponse);
        if(response.isSuccess){
          Snackbar.success('OTP verification successful');
          box.write('otp', otpTextController.text);
          _clearInput();
          Get.toNamed('/passwordReset');
        }else{
          Snackbar.error('OTP verification failed plz try again');
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
