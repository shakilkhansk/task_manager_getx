import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

import '../Models/UserModel.dart';

class AuthController extends GetxController {
  String? token;
  UserModel? user;
  final box = GetStorage();

  //save user data
  Future<void> SaveUserData (String t, UserModel model) async {
    print(model);
    await box.write('token', t);
    await box.write('user', jsonEncode(model));
    token = t;
    user = model;
    print(user);
  }
  //erase user data
  Future<void> clearAuthData() async {
    await box.erase();
    token = null;
    Get.offNamedUntil('login', (route) => false);
  }
  //erase user data
  getUserData(String key) {
    var profile = jsonDecode(box.read('user'));

    if(key == 'name'){
      return '${profile['firstName']} ${profile['lastName']}';
    }

    return profile[key];
  }
}