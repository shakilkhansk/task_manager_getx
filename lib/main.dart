import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_manager_getx/Auth/EmailVerifyScreen.dart';
import 'package:task_manager_getx/Auth/LoginScreen.dart';
import 'package:task_manager_getx/Auth/OtpVerifyScreen.dart';
import 'package:task_manager_getx/Auth/RegistrationScreen.dart';
import 'package:task_manager_getx/Auth/ResetPasswordScreen.dart';
import 'package:task_manager_getx/Auth/SpalshScreen.dart';
import 'package:task_manager_getx/Screen/AddNewTaskScreen.dart';
import 'package:task_manager_getx/Screen/EditProfileScreen.dart';
import 'package:task_manager_getx/Screen/MainBottomNavScreen.dart';
import 'Theme/CustomButtonTheme.dart';
import 'Theme/CustomInputDecorationTheme.dart';
import 'Theme/CustomTextTheme.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const TaskManager());
}

class TaskManager extends StatelessWidget {
  const TaskManager({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'Task Manager App',
      initialRoute: '/',
      getPages: myPages(),
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(103, 58, 183, 100),
        textTheme: customTextTheme(),
        elevatedButtonTheme: customButtonTheme(),
        inputDecorationTheme: customInputDecorationTheme(),
      ),
    );

  }

  List<GetPage> myPages() {
    return [
      GetPage(name: '/', page: () => const SplashScreen()),
      GetPage(name: '/home', page: () => MainBottomNavScreen(),transition: Transition.rightToLeft),
      GetPage(name: '/login', page: () => LoginScreen(),transition: Transition.rightToLeft),
      GetPage(name: '/registration', page: () => RegistrationScreen(),transition: Transition.rightToLeft),
      GetPage(name: '/emailVerify', page: () => EmailVerifyScreen(),transition: Transition.rightToLeft),
      GetPage(name: '/otpVerify', page: () => OtpVerifyScreen(),transition: Transition.rightToLeft),
      GetPage(name: '/passwordReset', page: () => ResetPasswordScreen(),transition: Transition.rightToLeft),
      GetPage(name: '/add', page: () => AddNewTaskScreen(),transition: Transition.rightToLeft),
      GetPage(name: '/profile', page: () => EditProfileScreen(),transition: Transition.rightToLeft),
    ];
  }


}

