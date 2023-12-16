// RegistrationController.dart
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:task_manager_getx/Api/ApiService.dart';
import 'package:task_manager_getx/Theme/CustomSnackBar.dart';

import '../Api/Urls.dart';

class RegistrationController extends GetxController {

  final ApiService apiService = ApiService();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController firstNameTextController = TextEditingController();
  final TextEditingController lastNameTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController phoneTextController = TextEditingController();

  final RxBool isLoading = false.obs;

  Future<void> register() async {
      isLoading.value = true;
      // update();

      try {
        // Example API call using the ApiService
        final response = await apiService.post(Urls.registration, data: {
          'email': emailTextController.text,
          'password': passwordTextController.text,
          'phone': phoneTextController.text,
          'firstName': firstNameTextController.text,
          'lastName': lastNameTextController.text,
        });
        // Process the API response as needed
        log('API Response: $response');
        if(response.isSuccess){
          Snackbar.success('Registration is successful');
          // _clearInput();
        }else{
          Snackbar.error('Registration failed plz try again');
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
    firstNameTextController.clear();
    lastNameTextController.clear();
    phoneTextController.clear();
    passwordTextController.clear();
    update();
  }
}
