import '/app/core/base/base_controller.dart';

class MessageController extends BaseController {
  //TODO: Implement MessageController

  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
