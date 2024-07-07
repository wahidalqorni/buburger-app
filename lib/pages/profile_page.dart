import 'package:buburger_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    final authC = Get.put(AuthController());

     return Scaffold(
      appBar: AppBar(
        title: Text(SpUtil.getString("email_user").toString()),
      ),
      body: InkWell(
        onTap: () {
          authC.logout();
        },
        child: Center(
          child: Text("Logout"),
        ),
      ),
    );
  }
}