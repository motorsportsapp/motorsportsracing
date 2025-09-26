import 'package:get/get.dart';
import '../../../../api_services/race_api_services/race_api_services.dart';
import '../../../api_model/race_api_model.dart';
import '../../../data/model/race_model/race_model.dart';
import 'package:flutter/material.dart';

class RaceAdminController extends GetxController {
  final RxList<RaceModel> raceList = <RaceModel>[].obs;

  @override
  void onInit() {
    fetchAllRaces();
    super.onInit();
  }


  @override
  void onClose() {
    raceList.clear();
    super.onClose();
  }



  var allRacesList = <RaceAPIModel>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;



  Future<void> fetchAllRaces() async {
    print("function is called");
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final racesList = await RaceApiService.getAllRaces();
      allRacesList.value = racesList;

    } catch (e) {
      errorMessage.value = 'Failed to load races: $e';
      Get.snackbar(
        'Error',
        'Failed to load races',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }



}
