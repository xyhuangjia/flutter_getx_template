import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_onekey_controller.dart';

class LoginOnekeyView extends GetView<LoginOnekeyController> {
  const LoginOnekeyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginOnekeyView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LoginOnekeyView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
