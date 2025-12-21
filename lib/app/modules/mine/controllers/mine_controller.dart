import 'package:flutter_getx_template/app/core/base/base_controller.dart';

class MineController extends BaseController {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
