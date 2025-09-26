import 'dart:convert';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import '../../app/api_model/event_api_model.dart';
import 'package:get/get.dart';
import '../../app/routes/app_pages.dart';
import '../contants.dart';


class EventApiService {


 static Future<List<EventAPIModel>> fetchEvents() async {
    final response = await http.get(Uri.parse('$baseUrl/events'));
    print("events response ll ${response.body}");
    print("events response ll ${response.statusCode}");

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((e) => EventAPIModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load events');
    }
  }


  static Future<http.Response> createEvent(Map<String,dynamic> data) async {
   try{
     final response = await http.post(
       Uri.parse('$baseUrl/events'),
       headers: {'Content-Type': 'application/json'},
       body: json.encode(data),
     );
     return response;
   }catch(e){
     throw Exception('Failed to create event');
   }
  }

  static Future<void> updateEvent(int eventId, Map<String, dynamic> data) async {
   try{
     final response = await http.put(
       Uri.parse('$baseUrl/events/$eventId'),
       headers: {'Content-Type': 'application/json'},
       body: json.encode(data),
     );

     print("response update event ${response.body}");
     print("response update event ${response.statusCode}");
     if(response.statusCode == 200){
       Get.snackbar('Success', 'Event updated successfully');
       Get.offNamed(Routes.RACE_ADMIN);
     }else{
       throw Exception('Failed to update event');
     }
   }catch(e){
     throw Exception('Failed to update event');
     }
  }

  static Future<void> deleteEvent(int eventId) async {
   try{
     final response = await http.delete(
       Uri.parse('$baseUrl/events/$eventId'),
     );
     if(response.statusCode == 204){
       Get.snackbar('Success', 'Event deleted successfully');
       Get.offNamed(Routes.RACE_ADMIN);
     }else{
       throw Exception('Failed to delete event');
     }
     }catch(e){
     throw Exception('Failed to delete event');
   }
  }

}
