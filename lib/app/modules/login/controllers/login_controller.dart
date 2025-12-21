import 'package:flutter/material.dart';

import '/app/core/base/base_controller.dart';

class LoginController extends BaseController {
  //TODO: Implement LoginController

  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
