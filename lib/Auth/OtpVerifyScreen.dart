import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager_getx/Controller/EmailVerifyController.dart';
import 'package:task_manager_getx/Theme/CustomStyles.dart';
import 'package:get/get.dart';

import '../Controller/OtpVerifyController.dart';

class OtpVerifyScreen extends StatelessWidget {

  final OtpVerifyController otpVerifyController = Get.put(OtpVerifyController());
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
                  Text("Pin Verification", style: Theme.of(context).textTheme.titleLarge,),
                  const SizedBox(height: 16.0),
                  Text( 'A 6 digit OTP has sent to your email address.', style: Theme.of(context).textTheme.titleSmall,),
                  const SizedBox(height: 24.0),
                  PinCodeTextField(
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    backgroundColor: Colors.white,
                    pinTheme: PinTheme(
                      inactiveColor: Colors.grey,
                      activeFillColor: Colors.white,
                      activeColor: Colors.green,
                      selectedFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    controller: otpVerifyController.otpTextController,
                    keyboardType: TextInputType.number,
                    onCompleted: (v) {
                      print("Completed");
                    },
                    onChanged: (value) {
                      print(value);
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    }, appContext: context,
                  ),
                  const SizedBox(height: 24.0),
                  SizedBox(
                    width: double.infinity,
                    child: Obx(() => Visibility(
                      visible: !otpVerifyController.isLoading(),
                      replacement: const Center( child: CircularProgressIndicator()),
                      child: ElevatedButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                            otpVerifyController.verifyOtp();
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
