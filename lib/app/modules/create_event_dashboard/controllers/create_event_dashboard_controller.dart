import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:motor_sport_easy/app/modules/single_race_event_dashboard/controllers/single_race_event_dashboard_controller.dart';
import 'package:motor_sport_easy/app/routes/app_pages.dart';

import '../../../../api_services/event_api_services/event_api_services.dart';

class CreateEventDashboardController extends GetxController {
final int raceID;
CreateEventDashboardController({required this.raceID});
  final singleRaceEventController=Get.find<SingleRaceEventDashboardController>();
  final formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController broadcastTvChanelController = TextEditingController();
  final TextEditingController broadcastRadioController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

// Date & Time Pickers
var selectedDate = Rxn<DateTime>();
var selectedTime = Rxn<TimeOfDay>();
  /// Pick Date
  Future<void> pickDate({required BuildContext context}) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      selectedDate.value = picked;
      dateController.text = DateFormat('dd/MM/yyyy').format(picked);
    }
  }

  /// Pick Time
  Future<void> pickTime({required BuildContext context}) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null && context.mounted) {
      selectedTime.value = pickedTime;
      timeController.text = pickedTime.format(context);
    }
  }


  /// Convert Date + Time -> ISO 8601 String (UTC)
  String? get startedAt {
    if (selectedDate.value != null && selectedTime.value != null) {
      final dt = DateTime(
        selectedDate.value!.year,
        selectedDate.value!.month,
        selectedDate.value!.day,
        selectedTime.value!.hour,
        selectedTime.value!.minute,
      );
      return dt.toUtc().toIso8601String(); // e.g. 2025-09-26T04:33:00.000Z
    }
    return null;
  }


  Future<void> createEvent()async{
    try{
      if (!formKey.currentState!.validate()) return;

      Map<String,dynamic> data={
        "tv_broadcast_chanel": broadcastTvChanelController.text,
        "radio_broadcast_chanel": broadcastRadioController.text,
        "location": locationController.text,
        "started_at": startedAt,
        "race_id": raceID
      };

      final response=await EventApiService.createEvent(data);
      if(response.statusCode==201){
        Get.snackbar('Success', 'Event created successfully');
        // Clear form fields
        broadcastTvChanelController.clear();
        broadcastRadioController.clear();
        locationController.clear();
        dateController.clear();
        timeController.clear();
        selectedDate.value = null;
        selectedTime.value = null;
        await singleRaceEventController.fetchRaceById(raceID);
        Get.offNamed(Routes.RACE_ADMIN);
      }
      else{
        Get.snackbar('Error', 'Event creation failed');
      }

    }catch(e){
      throw Exception('Failed to create event $e');
    }
  }



  @override
  void dispose() {
    broadcastTvChanelController.dispose();
    broadcastRadioController.dispose();
    locationController.dispose();
    dateController.dispose();
    timeController.dispose();
    super.dispose();
  }
}