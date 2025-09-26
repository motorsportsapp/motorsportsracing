import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../../../api_services/race_api_services/race_api_services.dart';
import '../../../api_model/race_api_model.dart';
import '../../../data/model/event_model/event_model.dart';

class SingleRaceEventDashboardController extends GetxController {
  final int raceId;
SingleRaceEventDashboardController({required this.raceId});


  // final events = <EventModel>[].obs;
  // final isLoading = false.obs;
  //
  // @override
  // void onInit() {
  //   super.onInit();
  // }
  //
  // Future<void> getEventsByRaceId(String raceId) async {
  //   try {
  //     isLoading(true);
  //     events.clear();
  //     refresh();
  //
  //     final querySnapshot = await FirebaseFirestore.instance
  //         .collection('race')
  //         .doc(raceId)
  //         .collection('events')
  //         .orderBy('createdAt', descending: true)
  //         .get();
  //
  //
  //     events.assignAll(
  //         querySnapshot.docs.map((doc) => EventModel.fromFirestore(doc)).toList()
  //     );
  //
  //   } catch (e) {
  //     Get.snackbar('Error', 'Failed to load events: $e');
  //   } finally {
  //     isLoading(false);
  //   }
  // }
  //
  //
  // Future<void> deleteEvent(String eventId,String raceID) async {
  //   try {
  //     await FirebaseFirestore.instance
  //         .collection('race')
  //         .doc(raceID)
  //         .collection('events')
  //         .doc(eventId)
  //         .delete();
  //
  //     events.removeWhere((event) => event.id == eventId);
  //     Get.snackbar('Success', 'Event deleted successfully',
  //         snackPosition: SnackPosition.BOTTOM);
  //   } catch (e) {
  //     Get.snackbar('Error', 'Failed to delete event: $e',
  //         snackPosition: SnackPosition.BOTTOM);
  //   }
  // }
  //
  //
  //
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   events.clear();
  //   super.dispose();
  // }



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
