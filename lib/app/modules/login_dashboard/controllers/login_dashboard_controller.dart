import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:motor_sport_easy/app/routes/app_pages.dart';

class LoginDashboardController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var obscureText = true.obs;

  void changeObscureText() {
    obscureText.value = !obscureText.value;
    refresh();
  }

  void login({required BuildContext context}) {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {

      if(email=="stewartbrown195111@gmail.com" && password=="stewartbrown195111"){
        Get.offAndToNamed(Routes.RACE_ADMIN);
        Get.snackbar("Wow", "Successfully Login");
      }else{
        Get.snackbar("Error", "Invalid email or password");
      }

    } else {
      Get.snackbar("Error", "Please enter email and password");
    }
  }
}
