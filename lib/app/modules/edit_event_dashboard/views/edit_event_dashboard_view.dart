import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:motor_sport_easy/app/routes/app_pages.dart';

import '../../widgets/custom_elevated_button.dart';
import '../controllers/edit_event_dashboard_controller.dart';
//
// class EditEventDashboardView extends GetView<EditEventDashboardController> {
//   const EditEventDashboardView({super.key});
//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     final double screenWidth = mediaQuery.size.width;
//     return Scaffold(
//       backgroundColor: screenWidth<600? Color(0xFFF3F3F3):Colors.white,
//       body: SafeArea(
//         child: Form(
//           key: controller.formKey,
//           child: Center(
//             child: Container(
//               width: 900,
//               padding: const EdgeInsets.all(48),
//               decoration: BoxDecoration(color: const Color(0xFFF3F3F3)),
//               child: screenWidth > 600
//                   ? Column(
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 spacing: 40,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Update event',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 32,
//                           fontFamily: 'Inter',
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       IconButton(onPressed: (){
//                         Get.toNamed(Routes.RACE_ADMIN);
//                       }, icon: Icon(Icons.dashboard))
//                     ],
//                   ),
//                   SizedBox(
//                     width: double.infinity,
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       spacing: 32,
//                       children: [
//                         SizedBox(
//                           width: double.infinity,
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             spacing: 24,
//                             children: [
//                               Expanded(
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   mainAxisAlignment:
//                                   MainAxisAlignment.start,
//                                   crossAxisAlignment:
//                                   CrossAxisAlignment.start,
//                                   spacing: 8,
//                                   children: [
//                                     SizedBox(
//                                       width: 390,
//                                       child: Text(
//                                         'Broadcast channel',
//                                         style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 20,
//                                           fontFamily: 'Inter',
//                                           fontWeight: FontWeight.w400,
//                                         ),
//                                       ),
//                                     ),
//                                     Container(
//                                       padding: const EdgeInsets.symmetric(
//                                         horizontal: 12,
//                                         vertical: 4,
//                                       ),
//                                       decoration: ShapeDecoration(
//                                         color: Colors.white,
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                           BorderRadius.circular(8),
//                                         ),
//                                       ),
//                                       child: TextFormField(
//                                         controller: controller
//                                             .broadcastNameController,
//                                         validator: (value) {
//                                           if (value == null ||
//                                               value.isEmpty) {
//                                             return 'This Field is required';
//                                           }
//                                           return null;
//                                         },
//                                         decoration: InputDecoration(
//                                           hintText:
//                                           'write a channel name..',
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   mainAxisAlignment:
//                                   MainAxisAlignment.start,
//                                   crossAxisAlignment:
//                                   CrossAxisAlignment.start,
//                                   spacing: 8,
//                                   children: [
//                                     Text(
//                                       'Location',
//                                       style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 20,
//                                         fontFamily: 'Inter',
//                                         fontWeight: FontWeight.w400,
//                                       ),
//                                     ),
//                                     Container(
//                                       padding: const EdgeInsets.symmetric(
//                                         horizontal: 12,
//                                         vertical: 4,
//                                       ),
//                                       decoration: ShapeDecoration(
//                                         color: Colors.white,
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                           BorderRadius.circular(8),
//                                         ),
//                                       ),
//                                       child: TextFormField(
//                                         controller:
//                                         controller.locationController,
//                                         validator: (value) {
//                                           if (value == null ||
//                                               value.isEmpty) {
//                                             return 'This Field is required';
//                                           }
//                                           return null;
//                                         },
//                                         decoration: InputDecoration(
//                                           hintText: 'Location',
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           width: double.infinity,
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             spacing: 24,
//                             children: [
//                               Expanded(
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   mainAxisAlignment:
//                                   MainAxisAlignment.start,
//                                   crossAxisAlignment:
//                                   CrossAxisAlignment.start,
//                                   spacing: 8,
//                                   children: [
//                                     Text(
//                                       'Date',
//                                       style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 20,
//                                         fontFamily: 'Inter',
//                                         fontWeight: FontWeight.w400,
//                                       ),
//                                     ),
//                                     Container(
//                                       padding: const EdgeInsets.symmetric(
//                                         horizontal: 12,
//                                         vertical: 4,
//                                       ),
//                                       decoration: ShapeDecoration(
//                                         color: Colors.white,
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                           BorderRadius.circular(8),
//                                         ),
//                                       ),
//                                       child: TextFormField(
//                                         readOnly: true,
//                                         controller:
//                                         controller.dateController,
//                                         validator: (value) {
//                                           if (value == null ||
//                                               value.isEmpty) {
//                                             return 'This Field is required';
//                                           }
//                                           return null;
//                                         },
//                                         decoration: InputDecoration(
//                                           hintText: '00/00/0000',
//                                           suffixIcon: IconButton(
//                                             icon: Icon(
//                                               Icons.calendar_today,
//                                             ),
//                                             onPressed: () =>
//                                                 controller.pickDate(
//                                                   context: context,
//                                                 ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   mainAxisAlignment:
//                                   MainAxisAlignment.start,
//                                   crossAxisAlignment:
//                                   CrossAxisAlignment.start,
//                                   spacing: 8,
//                                   children: [
//                                     Text(
//                                       'Time',
//                                       style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 20,
//                                         fontFamily: 'Inter',
//                                         fontWeight: FontWeight.w400,
//                                       ),
//                                     ),
//                                     Container(
//                                       padding: const EdgeInsets.symmetric(
//                                         horizontal: 12,
//                                         vertical: 4,
//                                       ),
//                                       decoration: ShapeDecoration(
//                                         color: Colors.white,
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                           BorderRadius.circular(8),
//                                         ),
//                                       ),
//                                       child: TextFormField(
//                                         controller:
//                                         controller.timeController,
//                                         validator: (value) {
//                                           if (value == null ||
//                                               value.isEmpty) {
//                                             return 'This Field is required';
//                                           }
//                                           return null;
//                                         },
//                                         readOnly: true,
//                                         decoration: InputDecoration(
//                                           hintText: '00:00',
//                                           border: InputBorder.none,
//                                           suffixIcon: IconButton(
//                                             icon: Icon(Icons.access_time),
//                                             onPressed: () async {
//                                               await controller.pickTime(
//                                                 context: context,
//                                               );
//                                             },
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     width: 295,
//                     child: CustomElevatedButton(
//                       onTap: () {
//                         if (controller.formKey.currentState!.validate()) {
//                           controller.updateEvent();
//                         }
//                       },
//                       level: "Update",
//                     ),
//                   ),
//                 ],
//               )
//                   : ListView(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Update event',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 32,
//                           fontFamily: 'Inter',
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       IconButton(onPressed: (){
//                         Get.toNamed(Routes.RACE_ADMIN);
//                       }, icon: Icon(Icons.dashboard))
//                     ],
//                   ),
//                   SizedBox(height: 24),
//                   Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     spacing: 32,
//                     children: [
//                       Column(
//                         children: [
//                           Column(
//                             mainAxisSize: MainAxisSize.min,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             spacing: 8,
//                             children: [
//                               SizedBox(
//                                 width: 390,
//                                 child: Text(
//                                   'Broadcast channel',
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 20,
//                                     fontFamily: 'Inter',
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 12,
//                                   vertical: 4,
//                                 ),
//                                 decoration: ShapeDecoration(
//                                   color: Colors.white,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(
//                                       8,
//                                     ),
//                                   ),
//                                 ),
//                                 child: TextFormField(
//                                   controller:
//                                   controller.broadcastNameController,
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'This Field is required';
//                                     }
//                                     return null;
//                                   },
//                                   decoration: InputDecoration(
//                                     hintText: 'write a channel name..',
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 24),
//                           Column(
//                             mainAxisSize: MainAxisSize.min,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             spacing: 8,
//                             children: [
//                               Text(
//                                 'Location',
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 20,
//                                   fontFamily: 'Inter',
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 12,
//                                   vertical: 4,
//                                 ),
//                                 decoration: ShapeDecoration(
//                                   color: Colors.white,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(
//                                       8,
//                                     ),
//                                   ),
//                                 ),
//                                 child: TextFormField(
//                                   controller:
//                                   controller.locationController,
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'This Field is required';
//                                     }
//                                     return null;
//                                   },
//                                   decoration: InputDecoration(
//                                     hintText: 'Location',
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Column(
//                             mainAxisSize: MainAxisSize.min,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             spacing: 8,
//                             children: [
//                               Text(
//                                 'Date',
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 20,
//                                   fontFamily: 'Inter',
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 12,
//                                   vertical: 4,
//                                 ),
//                                 decoration: ShapeDecoration(
//                                   color: Colors.white,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(
//                                       8,
//                                     ),
//                                   ),
//                                 ),
//                                 child: TextFormField(
//                                   readOnly: true,
//                                   controller: controller.dateController,
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'This Field is required';
//                                     }
//                                     return null;
//                                   },
//                                   decoration: InputDecoration(
//                                     hintText: '00/00/0000',
//                                     suffixIcon: IconButton(
//                                       icon: Icon(Icons.calendar_today),
//                                       onPressed: () => controller
//                                           .pickDate(context: context),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 24),
//                           Column(
//                             mainAxisSize: MainAxisSize.min,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             spacing: 8,
//                             children: [
//                               Text(
//                                 'Time',
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 20,
//                                   fontFamily: 'Inter',
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 12,
//                                   vertical: 4,
//                                 ),
//                                 decoration: ShapeDecoration(
//                                   color: Colors.white,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(
//                                       8,
//                                     ),
//                                   ),
//                                 ),
//                                 child: TextFormField(
//                                   controller: controller.timeController,
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'This Field is required';
//                                     }
//                                     return null;
//                                   },
//                                   readOnly: true,
//                                   decoration: InputDecoration(
//                                     hintText: '00:00',
//                                     border: InputBorder.none,
//                                     suffixIcon: IconButton(
//                                       icon: Icon(Icons.access_time),
//                                       onPressed: () async {
//                                         await controller.pickTime(
//                                           context: context,
//                                         );
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//
//                   SizedBox(height: 24),
//                   CustomElevatedButton(
//                     onTap: () {
//
//                       if (controller.formKey.currentState!.validate()) {
//                         controller.updateEvent();
//                       }
//                     },
//                     level: "Update",
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motor_sport_easy/app/routes/app_pages.dart';
import '../../widgets/custom_elevated_button.dart';
import '../controllers/edit_event_dashboard_controller.dart';

class EditEventDashboardView extends GetView<EditEventDashboardController> {
  const EditEventDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.width;

    return Obx(() {
      if (controller.isLoading.value) {
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      }

      return Scaffold(
        backgroundColor: screenWidth < 600 ? Color(0xFFF3F3F3) : Colors.white,
        body: SafeArea(
          child: Form(
            key: controller.formKey,
            child: Center(
              child: Container(
                width: 900,
                padding: const EdgeInsets.all(48),
                decoration: BoxDecoration(color: const Color(0xFFF3F3F3)),
                child: screenWidth > 600
                    ? _buildDesktopView()
                    : _buildMobileView(),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildDesktopView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Update Event',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
            IconButton(
                onPressed: () {
                  Get.toNamed(Routes.RACE_ADMIN);
                },
                icon: Icon(Icons.dashboard)
            )
          ],
        ),
        SizedBox(height: 40),

        // Form Fields
        SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First Row - TV Broadcast and Radio Broadcast
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildTVBroadcastField(),
                    ),
                    SizedBox(width: 24),
                    Expanded(
                      child: _buildRadioBroadcastField(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),

              // Second Row - Location and Date
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildLocationField(),
                    ),
                    SizedBox(width: 24),
                    Expanded(
                      child: _buildDateField(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),

              // Third Row - Time only
              SizedBox(
                width: 300,
                child: _buildTimeField(),
              ),
              SizedBox(height: 32),
            ],
          ),
        ),

        // Update Button
        SizedBox(
          width: 295,
          child: CustomElevatedButton(
            onTap: controller.updateEvent,
            level: "Update Event",
          ),
        ),
      ],
    );
  }

  Widget _buildMobileView() {
    return ListView(
      children: [
        // Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Update Event',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
            IconButton(
                onPressed: () {
                  Get.toNamed(Routes.RACE_ADMIN);
                },
                icon: Icon(Icons.dashboard)
            )
          ],
        ),
        SizedBox(height: 24),

        // Form Fields
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTVBroadcastField(),
            SizedBox(height: 24),
            _buildRadioBroadcastField(),
            SizedBox(height: 24),
            _buildLocationField(),
            SizedBox(height: 24),
            _buildDateField(),
            SizedBox(height: 24),
            _buildTimeField(),
            SizedBox(height: 32),
          ],
        ),

        // Update Button
        CustomElevatedButton(
          onTap: controller.updateEvent,
          level: "Update Event",
        ),
      ],
    );
  }

  Widget _buildTVBroadcastField() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'TV Broadcast Channel',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: TextFormField(
            controller: controller.tvBroadcastController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'TV broadcast channel is required';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Enter TV broadcast channel...',
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRadioBroadcastField() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Radio Broadcast Channel',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: TextFormField(
            controller: controller.radioBroadcastController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Radio broadcast channel is required';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Enter radio broadcast channel...',
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLocationField() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Location',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: TextFormField(
            controller: controller.locationController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Location is required';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Enter event location...',
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateField() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: TextFormField(
            readOnly: true,
            controller: controller.dateController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Date is required';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'DD/MM/YYYY',
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () => controller.pickDate(context: Get.context!),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeField() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Time',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: TextFormField(
            controller: controller.timeController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Time is required';
              }
              return null;
            },
            readOnly: true,
            decoration: InputDecoration(
              hintText: 'HH:MM',
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: Icon(Icons.access_time),
                onPressed: () => controller.pickTime(context: Get.context!),
              ),
            ),
          ),
        ),
      ],
    );
  }
}