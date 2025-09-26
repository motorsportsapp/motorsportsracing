import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motor_sport_easy/api_services/race_api_services/race_api_services.dart';
import 'package:motor_sport_easy/app/routes/app_pages.dart';
import '../../single_race_event_dashboard/controllers/single_race_event_dashboard_controller.dart';
import '../../update_race_dashboard/views/update_race_dashboard_view.dart';
import '../../widgets/custom_elevated_button.dart';

class RaceDashboardCard extends StatelessWidget {
  final String racingName;
  final String sponsorLogo;
  final int index;
  final bool isHeader;
  final int raceId;

  const RaceDashboardCard({
    super.key,
    required this.racingName,
    required this.index,
    required this.sponsorLogo,
    this.isHeader = false,
    required this.raceId,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.width;

    return Container(
      width: double.infinity,
      height: screenWidth > 600 ? 60 : 50,
      padding: EdgeInsets.symmetric(horizontal: screenWidth > 700 ? 12 : 4),
      decoration: BoxDecoration(
        color: isHeader
            ? Color(0xFFFFD4D4)
            : index.isEven
            ? Color(0xFFF5F5F5)
            : Color(0xFFF3F3F3),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              width: screenWidth > 600 ? screenWidth * 0.104 : 80,
              child: Center(
                child: Text(
                  racingName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth > 600 ? 19 : 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: screenWidth > 600 ? screenWidth * 0.104 : 40,
              child: Center(
                child: isHeader
                    ? Text(
                        "Logo",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth > 600 ? 19 : 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    : Image.network(sponsorLogo, height: 40, width: 40),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: screenWidth > 600 ? screenWidth * 0.104 : 30,
              child: Center(
                child: isHeader
                    ? Icon(Icons.more_vert)
                    : InkWell(
                    onTap: (){
                      showRequestDialog(context,raceId,racingName,sponsorLogo);
                    },

                    child: Icon(Icons.more_vert)
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


Future<void> showRequestDialog(BuildContext context, int raceId,String raceName, String sponsorLogo ) async {

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          'What is you want to do?',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        content: SizedBox(
          height: 10,
          width: 300,
        ),
        actions: <Widget>[
          CustomElevatedButton(
            level: "Delete Series",
            onTap: () async {
              Get.back();
              await RaceApiService.deletedRace(raceId);
            },
          ),
          SizedBox(height: 10,),
          CustomElevatedButton(
            level: "All Event",
            onTap:(){
              final singleRaceEventDashboardController=Get.put(SingleRaceEventDashboardController(raceId: raceId));
              singleRaceEventDashboardController.fetchRaceById(raceId);
              Get.offAndToNamed("${Routes.SINGLE_RACE_EVENT_DASHBOARD}/$raceId");
            },
            isBackgroundWhite: true,
            isBorderRed: true,
          ),
          SizedBox(height: 10,),
          CustomElevatedButton(
            level: "Update Series",
            onTap: () {
              if (raceName.isNotEmpty && sponsorLogo.isNotEmpty) {
                Map<String, dynamic> data = {
                  'id': raceId,
                  'name': raceName,
                  'image_logo': sponsorLogo,
                };

                Get.toNamed(
                  '/race_update_screen',
                  parameters: {
                    'raceId': data['id'].toString(),
                    'raceName': data['name'],
                    'sponsorLogo': data['image_logo'],
                  },
                );
              } else {
                Get.snackbar("Error", "Missing race data, cannot navigate!");
              }
            },
          ),


        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      );
    },
  );
}