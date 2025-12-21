import '/app/core/base/base_controller.dart';

class OtherController extends BaseController {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
