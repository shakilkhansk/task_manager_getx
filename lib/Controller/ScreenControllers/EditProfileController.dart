// EditProfileController.dart
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_manager_getx/Api/ApiService.dart';
import 'package:task_manager_getx/Theme/CustomSnackBar.dart';

import '../../Api/Urls.dart';
import '../AuthController.dart';

class EditProfileController extends GetxController {
  final AuthController _authController = Get.put(AuthController());
  final ApiService apiService = ApiService();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController firstNameTextController = TextEditingController();
  final TextEditingController lastNameTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController phoneTextController = TextEditingController();

  XFile? photo;

  final RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    emailTextController.text = _authController.getUserData('email')??'';
    firstNameTextController.text = _authController.getUserData('firstName')??'';
    lastNameTextController.text = _authController.getUserData('lastName')??'';
    phoneTextController.text = _authController.getUserData('phone')??'';
  }
  Future<void> updateProfile() async {
      isLoading.value = true;
      // update();

      try {
        // Example API call using the ApiService
        final response = await apiService.post(Urls.updateProfile, data: {
          'email': emailTextController.text,
          'password': passwordTextController.text,
          'phone': phoneTextController.text,
          'firstName': firstNameTextController.text,
          'lastName': lastNameTextController.text,
        });
        // Process the API response as needed
        log('API Response: $response');
        if(response.isSuccess){
          Snackbar.success('Profile update is successful');
          // _clearInput();
        }else{
          Snackbar.error('Profile update failed plz try again');
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

  Container photoPickerField() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 60,
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  )),
              alignment: Alignment.center,
              child: const Text(
                'Photo',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: InkWell(
              onTap: () async {
                final XFile? image = await ImagePicker()
                    .pickImage(source: ImageSource.camera, imageQuality: 50);
                if (image != null) {
                  photo = image;
                }
              },
              child: Container(
                padding: const EdgeInsets.only(left: 16),
                child: Visibility(
                  visible: photo == null,
                  replacement: Text(photo?.name ?? ''),
                  child: const Text('Select a photo'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
