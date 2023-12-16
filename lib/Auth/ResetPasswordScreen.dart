import 'package:flutter/material.dart';
import 'package:task_manager_getx/Controller/PasswordResetController.dart';
import 'package:task_manager_getx/Theme/CustomStyles.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {

  final PasswordResetController passwordResetController = Get.put(PasswordResetController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Set Password", style: Theme.of(context).textTheme.titleLarge,),
                  const SizedBox(height: 16.0),
                  Text( 'Minimum password length should be more than 8 letters', style: Theme.of(context).textTheme.titleSmall,),
                  const SizedBox(height: 24.0),
                  TextFormField(
                    controller: passwordResetController.passwordTextController,
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
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: passwordResetController.confirmPasswordTextController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Confirm password',
                    ),
                    validator: (value) {
                      if(value==null || value.trim().isEmpty){
                        return 'Please enter your confirm password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                          passwordResetController.resetNow();
                        }
                      },
                      child: const Text('SAVE'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        const SizedBox(height: 25),
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
