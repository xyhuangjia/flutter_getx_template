import 'package:get/get.dart';

import '../controllers/login_onekey_controller.dart';

class LoginOnekeyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginOnekeyController>(
      () => LoginOnekeyController(),
    );
  }
}
