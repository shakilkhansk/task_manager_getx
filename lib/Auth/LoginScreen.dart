import 'package:flutter/material.dart';
import 'package:task_manager_getx/Controller/LoginController.dart';
import 'package:task_manager_getx/Theme/CustomStyles.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());
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
                  Text("Get Started With", style: Theme.of(context).textTheme.titleLarge,),
                  const SizedBox(height: 16.0),
                  Text( 'Please log in to continue.', style: Theme.of(context).textTheme.titleSmall,),
                  const SizedBox(height: 24.0),
                  TextFormField(
                    controller: _loginController.emailTextController,
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
                  Obx(() => TextFormField(
                    controller: _loginController.passwordTextController,
                    obscureText: _loginController.obscureText.value,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _loginController.obscureText.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          _loginController.togglePasswordVisibility();
                        },
                      ),
                    ),
                    validator: (value) {
                      if(value==null || value.trim().isEmpty){
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  )),
                  const SizedBox(height: 24.0),
                  SizedBox(
                    width: double.infinity,
                    child: Obx(() => Visibility(
                      visible: !_loginController.isLoading(),
                      replacement: const Center( child: CircularProgressIndicator()),
                      child: ElevatedButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                            _loginController.login();
                          }else{
                            print('invalid');
                          }
                        },
                        child: const Text('Login'),
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
                              Get.toNamed('emailVerify');
                            },
                            child: Text('Forget Password?', style: boldText(),)
                        ),

                        const SizedBox(height: 15),

                        InkWell(
                            onTap: (){
                              Get.toNamed('/registration');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Don't have an account? "),
                                Text("Sign Up",style: boldText(),)
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
