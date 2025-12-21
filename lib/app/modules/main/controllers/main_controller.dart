import '/app/core/base/base_controller.dart';
import '/app/modules/main/model/menu_code.dart';

class MainController extends BaseController {
  MenuCode _selectedMenuCode = MenuCode.HOME;

  MenuCode get selectedMenuCode => _selectedMenuCode;

  bool _lifeCardUpdateController = false;
  bool get lifeCardUpdateController => _lifeCardUpdateController;

  onMenuSelected(MenuCode menuCode) async {
    _selectedMenuCode = menuCode;
    notifyListeners();
  }
}
