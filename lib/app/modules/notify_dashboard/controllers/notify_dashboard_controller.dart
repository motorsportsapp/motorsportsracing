import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:motor_sport_easy/api_services/contants.dart';


class NotifyDashboardController extends GetxController {
  final TextEditingController notificationController = TextEditingController();


  Future<void> createNotification()async{
    try {
      final notifyData = {

        'description': notificationController.text,
        "title": "Important announcement from MotorGp team!",
      };
      final response=await https.post(
        Uri.parse('$baseUrl/promotions/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(notifyData),
      );
      if (response.statusCode == 201) {
        Get.snackbar('Success', 'Notification created successfully');
        // Clear form fields
        notificationController.clear();
      } else {
        Get.snackbar('Error', 'Notification creation failed');
      }
    }catch(e){
      Get.snackbar('Error', 'Failed to create Notification: $e');
    }

  }

  @override
  void dispose() {
    notificationController.dispose();
    super.dispose();
  }
}
