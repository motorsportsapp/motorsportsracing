import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motor_sport_easy/app/routes/app_pages.dart';
import '../../../../api_services/event_api_services/event_api_services.dart';
import '../../widgets/custom_elevated_button.dart';
import '../controllers/single_race_event_dashboard_controller.dart';

class SingleRaceEventDashboardCard extends StatelessWidget {
  final String broadcastChannel;
  final String radiobroadcastChannel;

  final String location;
  final String time;
  final String date;
  final String sponsor;
  final VoidCallback onTap;
  final int index;
  final bool isHeader;
  final int eventId;
  final int raceID;

  const SingleRaceEventDashboardCard({
    super.key,
    required this.broadcastChannel,
    required this.radiobroadcastChannel,
    required this.location,
    required this.time,
    required this.date,
    required this.sponsor,
    required this.onTap,
    required this.index,
    this.isHeader = false,
    required this.eventId,
    required this.raceID,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.width;

    return Column(
      children: [
        Container(
          width: double.infinity,
          height: screenWidth > 600 ? 80 : 60,
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
              SizedBox(
                width: screenWidth > 600 ? screenWidth * 0.104 : 80,
                child: Text(
                  broadcastChannel,
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
              SizedBox(
                width: screenWidth > 600 ? screenWidth * 0.104 : 65,
                child: Text(
                  location,
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
              SizedBox(
                width: screenWidth > 700 ? screenWidth * 0.104 : 50,
                child: Text(
                  time,
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
              SizedBox(
                width: screenWidth > 600 ? screenWidth * 0.104 : 50,
                child: Text(
                  date,
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
              SizedBox(
                width: screenWidth > 600 ? screenWidth * 0.104 : 70,
                child: isHeader
                    ? Icon(Icons.no_accounts)
                    : InkWell(
                        onTap: () {
                          print("Event ID: $eventId");
                          print("Race ID: $raceID");

                          Map<String, dynamic> eventUpdateData = {
                            'event_id': eventId, // Use consistent key name
                            'race_id': raceID, // Use consistent key name
                            'tv_broadcast_chanel': broadcastChannel,
                            'radio_broadcast_chanel': radiobroadcastChannel,
                            'location': location,
                            'date': DateTime.now(),
                            'time': TimeOfDay.now(),
                          };

                          print("Event data for update: $eventUpdateData");
                          showRequestDialog(
                            context,
                            eventId,
                            raceID,
                            eventUpdateData,
                          );
                        },
                        child: Icon(Icons.more_vert),
                      ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

Future<void> showRequestDialog(
  BuildContext context,
  int eventId,
  int raceID,
  Map<String, dynamic> eventUpdateData,
) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          'What do you want to do?',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        content: SizedBox(
          height: 60, // Increased height for better appearance
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Event ID: $eventId'),
              Text('Race ID: $raceID'),
              Text('Location: ${eventUpdateData['location']}'),
            ],
          ),
        ),
        actions: <Widget>[
          CustomElevatedButton(
            level: "Delete Event",
            onTap: () async {
              Get.back();
             await EventApiService.deleteEvent(eventId);
            },
          ),
          SizedBox(height: 10),
          CustomElevatedButton(
            level: "Update Event",
            onTap: () {
              // Ensure all required data is included
              final completeEventData = {
                'event_id': eventId,
                'race_id': raceID,
                'tv_broadcast_chanel': eventUpdateData['tv_broadcast_chanel'],
                'radio_broadcast_chanel':
                    eventUpdateData['radio_broadcast_chanel'],
                'location': eventUpdateData['location'],
                'date': eventUpdateData['date'],
                'time': eventUpdateData['time'],
              };

              print('=== Navigating with Data ===');
              print('Complete event data: $completeEventData');

              Get.toNamed(
                Routes.EDIT_EVENT_DASHBOARD,
                arguments: completeEventData,
              );
            },
            isBackgroundWhite: true,
            isBorderRed: true,
          ),
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      );
    },
  );
}
