import '/app/core/base/base_controller.dart';

class BottomNavController extends BaseController {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  updateSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
