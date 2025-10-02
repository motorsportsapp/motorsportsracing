import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../../../api_services/race_api_services/race_api_services.dart';
import '../../../api_model/race_api_model.dart';
import '../../../data/model/event_model/event_model.dart';

class SingleRaceEventDashboardController extends GetxController {
  final int raceId;
SingleRaceEventDashboardController({required this.raceId});

  final isLoading = false.obs;

  var selectedRace = Rx<RaceAPIModel?>(null);
  Future<void> fetchRaceById(int id) async {
    try {
      isLoading.value = true;
      final race = await RaceApiService.getRaceById(id);
      selectedRace.value = race;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load race details',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchRaceById(raceId);
    super.onInit();
  }


}
