import 'package:flutter/material.dart';
import 'package:task_manager_getx/Controller/EmailVerifyController.dart';
import 'package:task_manager_getx/Theme/CustomStyles.dart';
import 'package:get/get.dart';

class EmailVerifyScreen extends StatelessWidget {

  final EmailVerifyController emailVerifyController = Get.put(EmailVerifyController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
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
                  Text("Your Email Address", style: Theme.of(context).textTheme.titleLarge,),
                  const SizedBox(height: 16.0),
                  Text( 'A 6 digit OTP will be sent to your email address.', style: Theme.of(context).textTheme.titleSmall,),
                  const SizedBox(height: 24.0),
                  TextFormField(
                    controller: emailVerifyController.emailTextController,
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
                  const SizedBox(height: 24.0),
                  SizedBox(
                    width: double.infinity,
                    child: Obx(() => Visibility(
                      visible: !emailVerifyController.isLoading(),
                      replacement: const Center( child: CircularProgressIndicator()),
                      child: ElevatedButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                            emailVerifyController.verifyEmail();
                          }else{
                            print('invalid');
                          }
                        },
                        child: const Icon(Icons.arrow_circle_right_outlined),
                      ),
                    )),
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
