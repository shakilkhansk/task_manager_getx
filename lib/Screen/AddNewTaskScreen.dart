import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controller/ScreenControllers/AddNewTaskController.dart';
import '../Theme/CustomStyles.dart';

class AddNewTaskScreen extends StatelessWidget {
  final AddNewTaskController addNewTaskController = Get.put(AddNewTaskController());
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
                  Text("Add new task", style: Theme.of(context).textTheme.titleLarge,),
                  const SizedBox(height: 24.0),
                  TextFormField(
                    controller: addNewTaskController.subjectTextController,
                    decoration: const InputDecoration(
                      labelText: 'Subject',
                    ),
                    validator: (value) {
                      if(value==null || value.trim().isEmpty){
                        return 'Please enter subject';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    maxLines: 5,
                    controller: addNewTaskController.descriptionTextController,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                    ),
                    validator: (value) {
                      if(value==null || value.trim().isEmpty){
                        return 'Please enter description';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24.0),
                  SizedBox(
                    width: double.infinity,
                    child: Obx(() => Visibility(
                      visible: !addNewTaskController.isLoading(),
                      replacement: const Center( child: CircularProgressIndicator()),
                      child: ElevatedButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                            addNewTaskController.create();
                          }else{
                            print('invalid');
                          }
                        },
                        child: const Text('SAVE'),
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
