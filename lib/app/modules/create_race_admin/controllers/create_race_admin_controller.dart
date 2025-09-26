import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../api_services/race_api_services/race_api_services.dart';

class CreateRaceAdminController extends GetxController {
  final formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController raceNameController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();

  Future<void> createRace() async {
    if (!formKey.currentState!.validate()) return;
    try {
      // Create race data
      final raceData = {
        'name': raceNameController.text,
        'image_logo': imageUrlController.text.trim(),
      };
      final response = await RaceApiService.createRace(raceData);
      if (response.statusCode == 201) {
        Get.snackbar('Success', 'race created successfully');
        // Clear form fields
        raceNameController.clear();
        imageUrlController.clear();
        formKey.currentState!.reset();
      } else {
        Get.snackbar('Error', 'race creation failed');
        print("error: ${response.statusCode}");
        print("error: ${response.body}");
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to create event: $e');
      print("error: $e");
    }
  }

  @override
  void dispose() {
    raceNameController.dispose();
    imageUrlController.dispose();
    super.dispose();
  }
}
