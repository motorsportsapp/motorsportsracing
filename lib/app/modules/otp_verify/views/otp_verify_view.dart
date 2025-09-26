import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/otp_verify_controller.dart';

class OtpVerifyView extends GetView<OtpVerifyController> {
  const OtpVerifyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OtpVerifyView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'OtpVerifyView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
