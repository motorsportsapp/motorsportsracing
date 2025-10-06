
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motor_sport_easy/api_services/race_api_services/race_api_services.dart';
import 'package:motor_sport_easy/app/modules/race_admin/controllers/race_admin_controller.dart';
import 'package:motor_sport_easy/app/routes/app_pages.dart';
import '../../widgets/custom_elevated_button.dart';


class UpdateRaceDashboardView extends StatefulWidget {
  final Map<String, dynamic> raceData;
  const UpdateRaceDashboardView({super.key, required this.raceData});

  @override
  State<UpdateRaceDashboardView> createState() => _UpdateRaceDashboardViewState();
}

class _UpdateRaceDashboardViewState extends State<UpdateRaceDashboardView> {
  final raceNameController = TextEditingController();
  final sponsorLogoController = TextEditingController();


  @override
  void initState() {
    super.initState();
    // Initialize controllers with raceData - fixed parameter names
    raceNameController.text = widget.raceData['name'] ?? widget.raceData['raceName'] ?? '';
    sponsorLogoController.text = widget.raceData['image_logo'] ?? widget.raceData['sponsorLogo'] ?? '';

    print('Received race data: ${widget.raceData}');
  }

  @override
  void dispose() {
    raceNameController.dispose();
    sponsorLogoController.dispose();
    super.dispose();
  }

  Future<void> saveData() async {
    final raceName = raceNameController.text.trim();
    final sponsorLogo = sponsorLogoController.text.trim();

    if (raceName.isEmpty || sponsorLogo.isEmpty) {
      Get.snackbar('Error', 'All fields are required');
      return;
    }

    // Save logic here - use the correct ID parameter name
    final raceId = widget.raceData['id'] ?? widget.raceData['raceId'];
    print('Saved: ID: $raceId, Name: $raceName, Logo: $sponsorLogo');

    Map<String, dynamic> raceData = {
      'name': raceName,
      'image_logo': sponsorLogo,
    };
    await RaceApiService.updateRace(raceId, raceData);



  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.width;

    Widget formSection() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Race Name
          Text('Race Name', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
          SizedBox(height: 8),
          TextFormField(
            controller: raceNameController,
            decoration: InputDecoration(
              hintText: 'Write a race name...',
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
          SizedBox(height: 24),

          // Sponsor Logo
          Text('Paste Logo Link', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
          SizedBox(height: 8),
          TextFormField(
            controller: sponsorLogoController,
            decoration: InputDecoration(
              hintText: 'https://www.example.com/logo.png',
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
          SizedBox(height: 24),

          SizedBox(
            width: screenWidth > 600 ? 295 : double.infinity,
            child: CustomElevatedButton(
              onTap: saveData,
              level: "Save",
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: screenWidth < 600 ? Color(0xFFF3F3F3) : Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            width: screenWidth > 900 ? 900 : double.infinity,
            padding: const EdgeInsets.all(32),
            color: Color(0xFFF3F3F3),
            child: screenWidth > 600
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Update Race', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500)),
                    SizedBox(
                      width: 150,
                      child: CustomElevatedButton(
                        onTap: () => Get.toNamed(Routes.RACE_ADMIN),
                        level: "Dashboard",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                formSection(),
              ],
            )
                : ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Update Race', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500)),
                    SizedBox(
                      width: 150,
                      child: CustomElevatedButton(
                        onTap: () => Get.toNamed(Routes.RACE_ADMIN),
                        level: "Dashboard",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                formSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
