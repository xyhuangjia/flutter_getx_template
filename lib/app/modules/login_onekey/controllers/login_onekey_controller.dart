import '/app/core/base/base_controller.dart';

class LoginOnekeyController extends BaseController {
  //TODO: Implement LoginOnekeyController

  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
