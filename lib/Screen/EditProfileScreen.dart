import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_manager_getx/Theme/CustomStyles.dart';

import '../Controller/ScreenControllers/EditProfileController.dart';

class EditProfileScreen extends StatelessWidget {

  final EditProfileController editProfileController = Get.put(EditProfileController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 60.0),
                  Text("Update Profile", style: Theme.of(context).textTheme.titleLarge,),
                  const SizedBox(height: 16.0),
                  Text( 'Please enter your details', style: Theme.of(context).textTheme.titleSmall,),
                  const SizedBox(height: 24.0),
                  const SizedBox(
                    height: 32,
                  ),
                  editProfileController.photoPickerField(),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: editProfileController.emailTextController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if(value==null || value.trim().isEmpty){
                        return 'Please enter your email address';
                      }
                      if(!GetUtils.isEmail(value)){
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: editProfileController.firstNameTextController,
                    decoration: const InputDecoration(
                      labelText: 'First name',
                    ),
                    validator: (value) {
                      if(value==null || value.trim().isEmpty){
                        return 'Please enter first name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: editProfileController.lastNameTextController,
                    decoration: const InputDecoration(
                      labelText: 'Last name',
                    ),
                    validator: (value) {
                      if(value==null || value.trim().isEmpty){
                        return 'Please enter last name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: editProfileController.phoneTextController,
                    decoration: const InputDecoration(
                      labelText: 'Phone',
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if(value==null || value.trim().isEmpty){
                        return 'Please enter your phone';
                      }
                      if(!value.startsWith('01') && !RegExp(r'^\d{11}$').hasMatch(value)){
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: editProfileController.passwordTextController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  SizedBox(
                    width: double.infinity,
                    child: Obx(() => Visibility(
                      visible: !editProfileController.isLoading(),
                      replacement: const Center( child: CircularProgressIndicator()),
                      child: ElevatedButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                            editProfileController.updateProfile();
                          }else{
                            print('invalid');
                          }
                        },
                        child: const Text('Update'),
                      ),
                    )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}
