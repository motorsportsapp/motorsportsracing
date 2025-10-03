import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motor_sport_easy/app/modules/widgets/custom_elevated_button.dart';
import '../../../routes/app_pages.dart';
import '../../event_dashboard/widgets/event_create_button.dart';
import '../../race_admin/controllers/race_admin_controller.dart';
import '../controllers/single_race_event_dashboard_controller.dart';
import '../widgets/single_race_event_dashboard_card.dart';
import 'package:intl/intl.dart';

class SingleRaceEventDashboardView
    extends GetView<SingleRaceEventDashboardController> {
  const SingleRaceEventDashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    final raceId = Get.parameters['raceId'];
    final mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenWidth > 700
                      ? screenWidth * 0.789
                      : double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: screenWidth < 500
                        ? Wrap(
                            children: [
                              Text(
                                'All events',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 40,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                width: 200,
                                child: EventCreateButton(
                                  onTap: () {
                                    Get.toNamed(
                                      "${Routes.CREATE_EVENT_DASHBOARD}/$raceId",
                                    );
                                  },
                                  level: "Create Event",
                                ),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              CustomElevatedButton(
                                onTap: () async {
                                  final raceAdminController = Get.put(RaceAdminController());
                                  await raceAdminController.fetchAllRaces();
                                  Get.offNamed(Routes.RACE_ADMIN);
                                },
                                level: "Dashboard",
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'All events',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 40,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: EventCreateButton(
                                      onTap: () {
                                        Get.toNamed(
                                          "${Routes.CREATE_EVENT_DASHBOARD}/$raceId",
                                        );
                                      },
                                      level: "Create Event",
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                  ),
                ),
                SizedBox(height: 10),
                screenWidth > 600
                    ? Column(
                        children: [
                          SizedBox(
                            width: screenWidth > 700
                                ? screenWidth * 0.789
                                : double.infinity,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth > 700 ? 12 : 2,
                              ),
                              child: SingleRaceEventDashboardCard(
                                broadcastChannel: "Channel",
                                location: "Location",
                                time: 'Time',
                                date: 'Date',
                                sponsor: "Sponsor",
                                onTap: () {},
                                index: 1,
                                isHeader: true,
                                eventId: 0,
                                raceID: 0,
                                radiobroadcastChannel: "",
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenWidth > 700 ? 700 : 300,
                            width: screenWidth > 700
                                ? screenWidth * 0.789
                                : double.infinity,
                            child: Obx(() {
                              if (controller.isLoading.value) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              if (controller.selectedRace.value == null ||
                                  controller.selectedRace.value?.events ==
                                      null) {
                                return Center(child: Text("No data found"));
                              }
                              if (controller
                                  .selectedRace
                                  .value!
                                  .events
                                  .isEmpty) {
                                return Center(child: Text("No Event found"));
                              } else {
                                return ListView.builder(
                                  itemCount: controller
                                      .selectedRace
                                      .value
                                      ?.events
                                      .length,
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    final event = controller
                                        .selectedRace
                                        .value
                                        ?.events[index];
                                    DateTime internationalTime = event!.startedAt;
                                    DateTime datetime = internationalTime.toLocal();
                                    print("start date form listview builder event.startAt::::::: ${event.startedAt}");
                                    print("start date form listview builder datetime::::::: $datetime");
                                    String date = DateFormat(
                                      'dd/MM/yyyy',
                                    ).format(datetime);
                                    String time = DateFormat(
                                      'hh:mm a',
                                    ).format(datetime);

                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth > 700 ? 12 : 2,
                                      ),
                                      child: SingleRaceEventDashboardCard(
                                        broadcastChannel:
                                            event.tvBroadcastChanel,
                                        location: event.location,
                                        time: time,
                                        date: date,
                                        sponsor: controller
                                            .selectedRace
                                            .value!
                                            .imageLogo,
                                        onTap: () {},
                                        index: 1,
                                        isHeader: false,
                                        eventId: event.id,
                                        raceID: event.raceId,
                                        radiobroadcastChannel:
                                            event.radioBroadcastChanel,
                                      ),
                                    );
                                  },
                                );
                              }
                            }),
                          ),
                        ],
                      )
                    : Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withValues(alpha: 0.3),
                              spreadRadius: 3,
                              blurRadius: 4,
                              offset: Offset(
                                0,
                                3,
                              ), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              width: screenWidth > 700
                                  ? screenWidth * 0.789
                                  : double.infinity,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth > 700 ? 12 : 2,
                                ),
                                child: SingleRaceEventDashboardCard(
                                  broadcastChannel: "Channel",
                                  location: "Location",
                                  time: 'Time',
                                  date: 'Date',
                                  sponsor: "Sponsor",
                                  onTap: () {},
                                  index: 1,
                                  isHeader: true,
                                  eventId: 0,
                                  raceID: 0,
                                  radiobroadcastChannel: "",
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenWidth > 700 ? 700 : 300,
                              width: screenWidth > 700
                                  ? screenWidth * 0.789
                                  : double.infinity,
                              child: Obx(() {
                                if (controller.isLoading.value) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                if (controller.selectedRace.value == null ||
                                    controller.selectedRace.value?.events ==
                                        null) {
                                  return Center(child: Text("No data found"));
                                }
                                if (controller
                                    .selectedRace
                                    .value!
                                    .events
                                    .isEmpty) {
                                  return Center(child: Text("No Event found"));
                                } else {
                                  return ListView.builder(
                                    itemCount: controller
                                        .selectedRace
                                        .value
                                        ?.events
                                        .length,
                                    shrinkWrap: true,
                                    physics: ScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      final event = controller
                                          .selectedRace
                                          .value
                                          ?.events[index];

                                      DateTime internationalTime = event!.startedAt;
                                      DateTime datetime = internationalTime.toLocal();
                                      String date = DateFormat(
                                        'dd/MM/yyyy',
                                      ).format(datetime);
                                      String time = DateFormat(
                                        'hh:mm a',
                                      ).format(datetime);

                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: screenWidth > 700
                                              ? 12
                                              : 2,
                                        ),
                                        child: SingleRaceEventDashboardCard(
                                          broadcastChannel:
                                              event.tvBroadcastChanel,
                                          location: event.location,
                                          time: time,
                                          date: date,
                                          sponsor: controller
                                              .selectedRace
                                              .value!
                                              .imageLogo,
                                          onTap: () {},
                                          index: 1,
                                          isHeader: false,
                                          eventId: event.id,
                                          raceID: event.raceId,
                                          radiobroadcastChannel:
                                              event.radioBroadcastChanel,
                                        ),
                                      );
                                    },
                                  );
                                }
                              }),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
