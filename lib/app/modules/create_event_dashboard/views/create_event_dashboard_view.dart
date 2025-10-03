import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/custom_elevated_button.dart';
import '../controllers/create_event_dashboard_controller.dart';

// class CreateEventDashboardView extends GetView<CreateEventDashboardController> {
//   const CreateEventDashboardView({super.key});
//
//
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
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       spacing: 40,
//                       children: [
//                         Text(
//                           'Create a event',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 32,
//                             fontFamily: 'Inter',
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         SizedBox(
//                           width: double.infinity,
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             spacing: 32,
//                             children: [
//                               SizedBox(
//                                 width: double.infinity,
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   spacing: 24,
//                                   children: [
//                                     Expanded(
//                                       child: Column(
//                                         mainAxisSize: MainAxisSize.min,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         spacing: 8,
//                                         children: [
//                                           SizedBox(
//                                             width: 390,
//                                             child: Text(
//                                               'Broadcast Tv channel',
//                                               style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 20,
//                                                 fontFamily: 'Inter',
//                                                 fontWeight: FontWeight.w400,
//                                               ),
//                                             ),
//                                           ),
//                                           Container(
//                                             padding: const EdgeInsets.symmetric(
//                                               horizontal: 12,
//                                               vertical: 4,
//                                             ),
//                                             decoration: ShapeDecoration(
//                                               color: Colors.white,
//                                               shape: RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(8),
//                                               ),
//                                             ),
//                                             child: TextFormField(
//                                               controller: controller
//                                                   .broadcastNameController,
//                                               validator: (value) {
//                                                 if (value == null ||
//                                                     value.isEmpty) {
//                                                   return 'This Field is required';
//                                                 }
//                                                 return null;
//                                               },
//                                               decoration: InputDecoration(
//                                                 hintText:
//                                                     'write a channel name..',
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Expanded(
//                                       child: Column(
//                                         mainAxisSize: MainAxisSize.min,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         spacing: 8,
//                                         children: [
//                                           Text(
//                                             'Location',
//                                             style: TextStyle(
//                                               color: Colors.black,
//                                               fontSize: 20,
//                                               fontFamily: 'Inter',
//                                               fontWeight: FontWeight.w400,
//                                             ),
//                                           ),
//                                           Container(
//                                             padding: const EdgeInsets.symmetric(
//                                               horizontal: 12,
//                                               vertical: 4,
//                                             ),
//                                             decoration: ShapeDecoration(
//                                               color: Colors.white,
//                                               shape: RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(8),
//                                               ),
//                                             ),
//                                             child: TextFormField(
//                                               controller:
//                                                   controller.locationController,
//                                               validator: (value) {
//                                                 if (value == null ||
//                                                     value.isEmpty) {
//                                                   return 'This Field is required';
//                                                 }
//                                                 return null;
//                                               },
//                                               decoration: InputDecoration(
//                                                 hintText: 'Location',
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: double.infinity,
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   spacing: 24,
//                                   children: [
//                                     Expanded(
//                                       child: Column(
//                                         mainAxisSize: MainAxisSize.min,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         spacing: 8,
//                                         children: [
//                                           Text(
//                                             'Date',
//                                             style: TextStyle(
//                                               color: Colors.black,
//                                               fontSize: 20,
//                                               fontFamily: 'Inter',
//                                               fontWeight: FontWeight.w400,
//                                             ),
//                                           ),
//                                           Container(
//                                             padding: const EdgeInsets.symmetric(
//                                               horizontal: 12,
//                                               vertical: 4,
//                                             ),
//                                             decoration: ShapeDecoration(
//                                               color: Colors.white,
//                                               shape: RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(8),
//                                               ),
//                                             ),
//                                             child: TextFormField(
//                                               readOnly: true,
//                                               controller:
//                                                   controller.dateController,
//                                               validator: (value) {
//                                                 if (value == null ||
//                                                     value.isEmpty) {
//                                                   return 'This Field is required';
//                                                 }
//                                                 return null;
//                                               },
//                                               decoration: InputDecoration(
//                                                 hintText: '00/00/0000',
//                                                 suffixIcon: IconButton(
//                                                   icon: Icon(
//                                                     Icons.calendar_today,
//                                                   ),
//                                                   onPressed: () =>
//                                                       controller.pickDate(
//                                                         context: context,
//                                                       ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Expanded(
//                                       child: Column(
//                                         mainAxisSize: MainAxisSize.min,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         spacing: 8,
//                                         children: [
//                                           Text(
//                                             'Time',
//                                             style: TextStyle(
//                                               color: Colors.black,
//                                               fontSize: 20,
//                                               fontFamily: 'Inter',
//                                               fontWeight: FontWeight.w400,
//                                             ),
//                                           ),
//                                           Container(
//                                             padding: const EdgeInsets.symmetric(
//                                               horizontal: 12,
//                                               vertical: 4,
//                                             ),
//                                             decoration: ShapeDecoration(
//                                               color: Colors.white,
//                                               shape: RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(8),
//                                               ),
//                                             ),
//                                             child: TextFormField(
//                                               controller:
//                                                   controller.timeController,
//                                               validator: (value) {
//                                                 if (value == null ||
//                                                     value.isEmpty) {
//                                                   return 'This Field is required';
//                                                 }
//                                                 return null;
//                                               },
//                                               readOnly: true,
//                                               decoration: InputDecoration(
//                                                 hintText: '00:00',
//                                                 border: InputBorder.none,
//                                                 suffixIcon: IconButton(
//                                                   icon: Icon(Icons.access_time),
//                                                   onPressed: () async {
//                                                     await controller.pickTime(
//                                                       context: context,
//                                                     );
//                                                   },
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           width: 295,
//                           child: CustomElevatedButton(
//                             onTap: () {
//                               if (controller.formKey.currentState!.validate()) {
//                                 controller.createEvent();
//                               }
//                             },
//                             level: "Create a event",
//                           ),
//                         ),
//                       ],
//                     )
//                   : ListView(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Create a event',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 32,
//                                 fontFamily: 'Inter',
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 24),
//                         Column(
//                           mainAxisSize: MainAxisSize.min,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           spacing: 32,
//                           children: [
//                             Column(
//                               children: [
//                                 Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
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
//                                           borderRadius: BorderRadius.circular(
//                                             8,
//                                           ),
//                                         ),
//                                       ),
//                                       child: TextFormField(
//                                         controller:
//                                             controller.broadcastNameController,
//                                         validator: (value) {
//                                           if (value == null || value.isEmpty) {
//                                             return 'This Field is required';
//                                           }
//                                           return null;
//                                         },
//                                         decoration: InputDecoration(
//                                           hintText: 'write a channel name..',
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(height: 24),
//                                 Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
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
//                                           borderRadius: BorderRadius.circular(
//                                             8,
//                                           ),
//                                         ),
//                                       ),
//                                       child: TextFormField(
//                                         controller:
//                                             controller.locationController,
//                                         validator: (value) {
//                                           if (value == null || value.isEmpty) {
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
//                               ],
//                             ),
//                             Column(
//                               children: [
//                                 Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
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
//                                           borderRadius: BorderRadius.circular(
//                                             8,
//                                           ),
//                                         ),
//                                       ),
//                                       child: TextFormField(
//                                         readOnly: true,
//                                         controller: controller.dateController,
//                                         validator: (value) {
//                                           if (value == null || value.isEmpty) {
//                                             return 'This Field is required';
//                                           }
//                                           return null;
//                                         },
//                                         decoration: InputDecoration(
//                                           hintText: '00/00/0000',
//                                           suffixIcon: IconButton(
//                                             icon: Icon(Icons.calendar_today),
//                                             onPressed: () => controller
//                                                 .pickDate(context: context),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(height: 24),
//                                 Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
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
//                                           borderRadius: BorderRadius.circular(
//                                             8,
//                                           ),
//                                         ),
//                                       ),
//                                       child: TextFormField(
//                                         controller: controller.timeController,
//                                         validator: (value) {
//                                           if (value == null || value.isEmpty) {
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
//                               ],
//                             ),
//                           ],
//                         ),
//
//                         SizedBox(height: 24),
//                         CustomElevatedButton(
//                           onTap: () {
//
//                             if (controller.formKey.currentState!.validate()) {
//                               controller.createEvent();
//                             }
//                           },
//                           level: "Create a event",
//                         ),
//                       ],
//                     ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



class CreateEventDashboardView extends GetView<CreateEventDashboardController> {
  const CreateEventDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.width;
    return Scaffold(
      backgroundColor: screenWidth < 600 ? const Color(0xFFF3F3F3) : Colors.white,
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: Center(
            child: Container(
              width: 900,
              padding: const EdgeInsets.all(48),
              decoration: const BoxDecoration(color: Color(0xFFF3F3F3)),
              child: screenWidth > 600
                  ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 40,
                children: [
                  const Text(
                    'Create an Event',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      spacing: 32,
                      children: [
                        // First Row: Broadcast Tv + Broadcast Radio
                        Row(
                          spacing: 24,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 8,
                                children: [
                                  const Text(
                                    'Broadcast Tv channel',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  _buildInputField(
                                    controller.broadcastTvChanelController,
                                    hint: "Write a channel name..",
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 8,
                                children: [
                                  const Text(
                                    'Broadcast Radio channel',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  _buildInputField(
                                    controller.broadcastRadioController,
                                    hint: "Write a radio channel name..",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // Second Row: Location
                        Row(
                          spacing: 24,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 8,
                                children: [
                                  const Text(
                                    'Location',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  _buildInputField(
                                    controller.locationController,
                                    hint: "Location",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // Third Row: Date + Time
                        Row(
                          spacing: 24,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 8,
                                children: [
                                  const Text(
                                    'Date',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  _buildDateField(context),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 8,
                                children: [
                                  const Text(
                                    'Time',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  _buildTimeField(context),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 295,
                    child: CustomElevatedButton(
                      onTap: () {
                        if (controller.formKey.currentState!.validate()) {
                          controller.createEvent();
                        }
                      },
                      level: "Create an Event",
                    ),
                  ),
                ],
              )
                  : ListView(
                children: [
                  const Text(
                    'Create an Event',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Broadcast Tv
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      const Text(
                        'Broadcast Tv channel',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      _buildInputField(
                        controller.broadcastTvChanelController,
                        hint: "Write a channel name..",
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Broadcast Radio
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      const Text(
                        'Broadcast Radio channel',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      _buildInputField(
                        controller.broadcastRadioController,
                        hint: "Write a radio channel name..",
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Location
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      const Text(
                        'Location',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      _buildInputField(
                        controller.locationController,
                        hint: "Location",
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Date
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      const Text(
                        'Date',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      _buildDateField(context),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Time
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      const Text(
                        'Time',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      _buildTimeField(context),
                    ],
                  ),
                  const SizedBox(height: 24),
                  CustomElevatedButton(
                    onTap: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.createEvent();
                      }
                    },
                    level: "Create an Event",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper widget for normal input field
  Widget _buildInputField(TextEditingController ctrl, {required String hint}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        controller: ctrl,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This Field is required';
          }
          return null;
        },
        decoration: InputDecoration(hintText: hint, border: InputBorder.none),
      ),
    );
  }

  // Date field
  Widget _buildDateField(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        readOnly: true,
        controller: controller.dateController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This Field is required';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: '00/00/0000',
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () => controller.pickDate(context: context),
          ),
        ),
      ),
    );
  }

  // Time field
  Widget _buildTimeField(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        readOnly: true,
        controller: controller.timeController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This Field is required';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: '00:00',
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: const Icon(Icons.access_time),
            onPressed: () async => controller.pickTime(context: context),
          ),
        ),
      ),
    );
  }
}

