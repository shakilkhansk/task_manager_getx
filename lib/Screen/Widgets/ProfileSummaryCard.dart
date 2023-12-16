import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_manager_getx/Controller/AuthController.dart';

class ProfileSummaryCard extends StatelessWidget {
  ProfileSummaryCard({super.key});
  final AuthController _authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.toNamed('/profile'),
      title: Text(_authController.getUserData('name')??'', style: TextStyle(color: Colors.white , fontWeight: FontWeight.w700),),
      subtitle: Text(_authController.getUserData('email')??'', style: TextStyle(color: Colors.white),),
      leading: CircleAvatar(child: Icon(Icons.person)),
      trailing: IconButton(onPressed: () {
        _authController.clearAuthData();
      }, icon: Icon(Icons.logout)),
      tileColor: Colors.green,
    );
  }
}
