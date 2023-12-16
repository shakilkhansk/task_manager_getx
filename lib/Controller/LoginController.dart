// RegistrationController.dart
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:task_manager_getx/Api/ApiService.dart';
import 'package:task_manager_getx/Controller/AuthController.dart';
import 'package:task_manager_getx/Theme/CustomSnackBar.dart';

import '../Api/Urls.dart';
import '../Models/UserModel.dart';

class LoginController extends GetxController {
  final AuthController _authController = Get.put(AuthController());
  final ApiService apiService = ApiService();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  final RxBool isLoading = false.obs;
  final RxBool obscureText = true.obs;

  void togglePasswordVisibility() {
    obscureText.toggle();
  }

  Future<void> login() async {
      isLoading.value = true;
      // update();

      try {
        // Example API call using the ApiService
        final response = await apiService.post(Urls.login, data: {
          'email': emailTextController.text,
          'password': passwordTextController.text,
        });
        // Process the API response as needed
        // log('API Response: $response');
        if(response.isSuccess){
          print(response.jsonResponse['data']);
          await _authController.SaveUserData(response.jsonResponse['token'],
              UserModel.fromJson(response.jsonResponse['data']));
          Get.offNamedUntil('home', (route) => false);
          // _clearInput();
        }else{
          Snackbar.error('Email/Password is incorrect');
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
    // passwordTextController.clear();
    update();
  }
}
