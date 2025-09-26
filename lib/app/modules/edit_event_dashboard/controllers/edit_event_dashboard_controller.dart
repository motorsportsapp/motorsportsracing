import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:motor_sport_easy/app/routes/app_pages.dart';
import '../../../../api_services/event_api_services/event_api_services.dart';

class EditEventDashboardController extends GetxController {
  // Form Key
  final formKey = GlobalKey<FormState>();

  // Controllers
  final tvBroadcastController = TextEditingController();
  final radioBroadcastController = TextEditingController();
  final locationController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();

  // Date & Time
  var selectedDate = Rxn<DateTime>();
  var selectedTime = Rxn<TimeOfDay>();

  // Event Data
  final RxMap<String, dynamic> eventData = <String, dynamic>{}.obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeFromArguments();
  }

  void _initializeFromArguments() {
    try {
      // Get data from Get.arguments
      final dynamic arguments = Get.arguments;

      print('=== Arguments Received ===');
      print('Full arguments: $arguments');
      print('Arguments type: ${arguments.runtimeType}');

      if (arguments != null && arguments is Map<String, dynamic>) {
        eventData.value = arguments;

        // Debug print all keys and values
        arguments.forEach((key, value) {
          print('$key: $value (type: ${value.runtimeType})');
        });
      } else {
        // Fallback to parameters if needed
        final parameters = Get.parameters;
        eventData.value = {
          'event_id': int.tryParse(parameters['event_id'] ?? '') ?? 0,
          'tv_broadcast_chanel': parameters['tv_broadcast_chanel'] ?? '',
          'radio_broadcast_chanel': parameters['radio_broadcast_chanel'] ?? '',
          'location': parameters['location'] ?? '',
          'race_id': int.tryParse(parameters['race_id'] ?? '') ?? 0,
        };
      }

      print("=== After Event Data ===");
      print('eventData: ${eventData.value}');

      _populateFields();
    } catch (e) {
      print('Error initializing event data: $e');
      Get.snackbar('Error', 'Failed to load event data');
    } finally {
      isLoading.value = false;
    }
  }

  void _populateFields() {
    final data = eventData.value;

    print('=== Populating Fields ===');
    print('race_id from eventData: ${data['race_id']}');
    print('event_id from eventData: ${data['event_id']}');

    // Text fields - Use correct key names from your map
    tvBroadcastController.text = data['tv_broadcast_chanel'] ?? '';
    radioBroadcastController.text = data['radio_broadcast_chanel'] ?? '';
    locationController.text = data['location'] ?? '';

    // Handle date - Check multiple possible keys
    if (data['started_at'] != null && data['started_at'].toString().isNotEmpty) {
      try {
        final DateTime parsedDate = DateTime.parse(data['started_at']);
        selectedDate.value = parsedDate;
        selectedTime.value = TimeOfDay.fromDateTime(parsedDate);
        dateController.text = DateFormat('dd/MM/yyyy').format(parsedDate);
        timeController.text = DateFormat('HH:mm').format(parsedDate);
      } catch (e) {
        print('Error parsing started_at: $e');
      }
    } else if (data['date'] != null) {
      // Fallback to 'date' key
      try {
        if (data['date'] is DateTime) {
          selectedDate.value = data['date'];
          dateController.text = DateFormat('dd/MM/yyyy').format(data['date']);
        } else if (data['date'] is String) {
          final DateTime parsedDate = DateTime.parse(data['date']);
          selectedDate.value = parsedDate;
          dateController.text = DateFormat('dd/MM/yyyy').format(parsedDate);
        }
      } catch (e) {
        print('Error parsing date: $e');
      }
    }

    // Handle time - Check multiple possible keys
    if (data['time'] != null) {
      try {
        if (data['time'] is TimeOfDay) {
          selectedTime.value = data['time'];
          timeController.text = data['time'].format(Get.context!);
        }
      } catch (e) {
        print('Error parsing time: $e');
      }
    }
  }

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

  Future<void> pickTime({required BuildContext context}) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime.value ?? TimeOfDay.now(),
    );

    if (pickedTime != null) {
      selectedTime.value = pickedTime;
      timeController.text = pickedTime.format(context);
    }
  }

  // Combine date and time into ISO string
  String _getCombinedDateTime() {
    if (selectedDate.value == null || selectedTime.value == null) {
      throw Exception('Date and time are required');
    }

    final DateTime date = selectedDate.value!;
    final TimeOfDay time = selectedTime.value!;

    final DateTime combined = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );

    return combined.toIso8601String();
  }

  Future<void> updateEvent() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (selectedDate.value == null || selectedTime.value == null) {
      Get.snackbar('Error', 'Please select both date and time');
      return;
    }

    try {
      isLoading.value = true;

      // Get event_id and race_id from eventData
      final dynamic eventId = eventData['event_id'] ?? eventData['id'];
      final dynamic raceId = eventData['race_id'];

      print('=== Update Debug ===');
      print('eventId: $eventId (type: ${eventId.runtimeType})');
      print('raceId: $raceId (type: ${raceId.runtimeType})');
      print('Full eventData: ${eventData.value}');

      // Validate IDs
      if (eventId == null) {
        throw "Event ID not found in eventData";
      }

      if (raceId == null) {
        throw "Race ID not found in eventData";
      }

      // Prepare update data
      final updateData = {
        "tv_broadcast_chanel": tvBroadcastController.text.trim(),
        "radio_broadcast_chanel": radioBroadcastController.text.trim(),
        "location": locationController.text.trim(),
        "started_at": _getCombinedDateTime(),
        "race_id": raceId is int ? raceId : int.tryParse(raceId.toString()) ?? 0,
      };

      print('=== Final Update Data ===');
      print('Event ID: $eventId');
      print('Race ID: $raceId');
      print('Update Data: $updateData');

      // Call API service
      await EventApiService.updateEvent(
          eventId is int ? eventId : int.tryParse(eventId.toString()) ?? 0,
          updateData
      );



    } catch (e) {
      print('Error updating event: $e');
      Get.snackbar('Error', 'Failed to update event: $e');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    tvBroadcastController.dispose();
    radioBroadcastController.dispose();
    locationController.dispose();
    dateController.dispose();
    timeController.dispose();
    super.onClose();
  }
}