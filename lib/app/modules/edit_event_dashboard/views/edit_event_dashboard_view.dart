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
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      }

      return Scaffold(
        backgroundColor: screenWidth < 600
            ? const Color(0xFFF3F3F3)
            : Colors.white,
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

  /// ================= Desktop Layout =================
  Widget _buildDesktopView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Update Event',
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
            IconButton(
              onPressed: () => Get.toNamed(Routes.RACE_ADMIN),
              icon: Icon(Icons.dashboard),
            ),
          ],
        ),
        SizedBox(height: 40),

        // First Row - TV + Radio
        Row(
          children: [
            Expanded(child: _buildTVBroadcastField()),
            SizedBox(width: 24),
            Expanded(child: _buildRadioBroadcastField()),
          ],
        ),
        SizedBox(height: 32),

        // Second Row - Location + Date
        Row(
          children: [
            Expanded(child: _buildLocationField()),
            SizedBox(width: 24),
            Expanded(child: _buildDateField()),
          ],
        ),
        SizedBox(height: 32),

        // Third Row - Time
        SizedBox(width: 300, child: _buildTimeField()),

        SizedBox(height: 40),

        // Update Button
        SizedBox(
          width: 295,
          child: CustomElevatedButton(
            onTap: () {
              if (controller.formKey.currentState!.validate()) {
                controller.updateEvent();
              }
            },
            level: "Update Event",
          ),
        ),
      ],
    );
  }

  /// ================= Mobile Layout =================
  Widget _buildMobileView() {
    return ListView(
      children: [
        // Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Update Event',
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
            IconButton(
              onPressed: () => Get.toNamed(Routes.RACE_ADMIN),
              icon: Icon(Icons.dashboard),
            ),
          ],
        ),
        SizedBox(height: 24),

        // Form Fields
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

        // Update Button
        CustomElevatedButton(
          onTap: () {
            if (controller.formKey.currentState!.validate()) {
              controller.updateEvent();
            }
          },
          level: "Update Event",
        ),
      ],
    );
  }

  /// ================= Fields =================
  Widget _buildTVBroadcastField() {
    return _buildTextField(
      label: "TV Broadcast Channel",
      controller: controller.tvBroadcastController,
      hint: "Enter TV broadcast channel...",
      validatorMessage: "TV broadcast channel is required",
    );
  }

  Widget _buildRadioBroadcastField() {
    return _buildTextField(
      label: "Radio Broadcast Channel",
      controller: controller.radioBroadcastController,
      hint: "Enter radio broadcast channel...",
      validatorMessage: "Radio broadcast channel is required",
    );
  }

  Widget _buildLocationField() {
    return _buildTextField(
      label: "Location",
      controller: controller.locationController,
      hint: "Enter event location...",
      validatorMessage: "Location is required",
    );
  }

  Widget _buildDateField() {
    return _buildTextField(
      label: "Date",
      controller: controller.dateController,
      hint: "DD/MM/YYYY",
      validatorMessage: "Date is required",
      readOnly: true,
      suffixIcon: IconButton(
        icon: Icon(Icons.calendar_today),
        onPressed: () => controller.pickDate(context: Get.context!),
      ),
    );
  }

  Widget _buildTimeField() {
    return _buildTextField(
      label: "Time",
      controller: controller.timeController,
      hint: "HH:MM",
      validatorMessage: "Time is required",
      readOnly: true,
      suffixIcon: IconButton(
        icon: Icon(Icons.access_time),
        onPressed: () => controller.pickTime(context: Get.context!),
      ),
    );
  }

  /// ================= Common TextField Builder =================
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String hint,
    required String validatorMessage,
    bool readOnly = false,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: TextFormField(
            controller: controller,
            validator: (value) =>
                (value == null || value.isEmpty) ? validatorMessage : null,
            decoration: InputDecoration(
              hintText: hint,
              border: InputBorder.none,
              suffixIcon: suffixIcon,
            ),
            readOnly: readOnly,
          ),
        ),
      ],
    );
  }
}
