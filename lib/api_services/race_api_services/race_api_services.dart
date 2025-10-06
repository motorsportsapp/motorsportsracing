
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:motor_sport_easy/app/modules/race_admin/controllers/race_admin_controller.dart';
import '../../app/api_model/race_api_model.dart';
import '../../app/routes/app_pages.dart';
import '../contants.dart';
import 'package:get/get.dart';


class RaceApiService {
 static final RaceAdminController raceAdminController = Get.put(RaceAdminController());


  static Future<List<RaceAPIModel>> getAllRaces() async {
    print("api function is called");
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/race/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      print("race data: ${response.body}");
      print("race statusCode: ${response.statusCode}");

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((raceJson) => RaceAPIModel.fromJson(raceJson)).toList();
      } else {
        throw Exception('Failed to load races: ${response.statusCode}');
      }
    } catch (e) {
      print("error: $e");
      throw Exception('Error fetching races: $e');
    }
  }

  static Future<RaceAPIModel> getRaceById(int id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/race/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      print("race data by id: ${response.statusCode}");
      print("race data by id: ${response.body}");

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);

        return RaceAPIModel.fromJson(jsonData);
      } else {
        throw Exception('Failed to load race: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching race: $e');
    }
  }

  static Future<http.Response> createRace(Map<String,dynamic> data) async {
    try {
      final response = await http.post(
          Uri.parse('$baseUrl/race/'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );
      print("race data by id: ${response.statusCode}");
      print("race data by id: ${response.body}");
      return response;
    } catch (e) {
      Get.snackbar("Error", "Race does not create");
      throw Exception('Error fetching race: $e');
    }


  }


  static Future<void> updateRace(int id, Map<String, dynamic> data) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/race/$id'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );
      print("race data by id: ${response.statusCode}");
      print("race data by id: ${response.body}");
      if(response.statusCode==200){
        await raceAdminController.fetchAllRaces();
        Get.toNamed(Routes.RACE_ADMIN);
        Get.snackbar("Success", "Race updated successfully");

      }else{
        Get.snackbar("Error", "Race does not update");
      }
    } catch (e) {
      Get.snackbar("Error", "Race does not update");
      throw Exception('Error fetching race: $e');
    }

  }

  static Future<void> deletedRace(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/race/$id'),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      print("race data by id: ${response.statusCode}");
      print("race data by id: ${response.body}");
      if(response.statusCode==204){
        await raceAdminController.fetchAllRaces();
        Get.snackbar("Success", "Race deleted successfully");
        Get.toNamed(Routes.RACE_ADMIN);
        }else{
        Get.snackbar("Error", "Race does not delete");
      }
    } catch (e) {
      Get.snackbar("Error", "Race does not delete");
      throw Exception('Error fetching race: $e');
    }
  }


}