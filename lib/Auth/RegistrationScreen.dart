import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:task_manager_getx/Controller/RegistrationController.dart';
import 'package:task_manager_getx/Theme/CustomStyles.dart';

class RegistrationScreen extends StatelessWidget {

  final RegistrationController registrationController = Get.put(RegistrationController());
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
                  Text("Join With Us", style: Theme.of(context).textTheme.titleLarge,),
                  const SizedBox(height: 16.0),
                  Text( 'Please enter your details', style: Theme.of(context).textTheme.titleSmall,),
                  const SizedBox(height: 24.0),
                  TextFormField(
                    controller: registrationController.emailTextController,
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
                    controller: registrationController.firstNameTextController,
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
                    controller: registrationController.lastNameTextController,
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
                    controller: registrationController.phoneTextController,
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
                    controller: registrationController.passwordTextController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if(value==null || value.trim().isEmpty){
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24.0),
                  SizedBox(
                    width: double.infinity,
                    child: Obx(() => Visibility(
                      visible: !registrationController.isLoading(),
                      replacement: const Center( child: CircularProgressIndicator()),
                      child: ElevatedButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                            registrationController.register();
                          }else{
                            print('invalid');
                          }
                        },
                        child: const Text('Register'),
                      ),
                    )),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, "/emailVerification");
                            },
                            child: Text('Forget Password?', style: boldText(),)
                        ),

                        const SizedBox(height: 15),

                        InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, "/login");
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Already have an account? "),
                                Text("Login",style: boldText(),)
                              ],
                            )
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
