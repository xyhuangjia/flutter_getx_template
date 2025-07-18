import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/core/base/base_view.dart';
import 'package:flutter_getx_template/app/core/widget/custom_app_bar.dart';
import 'package:get/get.dart';

import '/app/modules/favorite/views/favorite_view.dart';
import '/app/modules/home/views/home_view.dart';
import '/app/modules/main/controllers/main_controller.dart';
import '/app/modules/main/model/menu_code.dart';
import '/app/modules/main/views/bottom_nav_bar.dart';
import '/app/modules/other/views/other_view.dart';
import '/app/modules/settings/views/settings_view.dart';

// ignore: must_be_immutable
// class MainView extends BaseView<MainController> {
//
//
//   @override
//   Widget body(BuildContext context) {
//     return Container(
//       key: UniqueKey(),
//       child: Obx(
//         () => getPageOnSelectedMenu(controller.selectedMenuCode),
//       ),
//     );
//   }
//
//   @override
//   Widget? bottomNavigationBar() {
//     return BottomNavBar(onItemSelected: controller.onMenuSelected);
//   }
//
//   final HomeView homeView = HomeView();
//   FavoriteView? favoriteView;
//   SettingsView? settingsView;
//
//   Widget getPageOnSelectedMenu(MenuCode menuCode) {
//     switch (menuCode) {
//       case MenuCode.HOME:
//         return homeView;
//       case MenuCode.FAVORITE:
//         favoriteView ??= FavoriteView();
//         return favoriteView!;
//       case MenuCode.SETTINGS:
//         settingsView ??= SettingsView();
//         return settingsView!;
//       default:
//         return OtherView(
//           viewParam: describeEnum(menuCode),
//         );
//     }
//   }
// }
//
class MainView extends GetView<MainController> {

  Widget? bottomNavigationBar() {
    return BottomNavBar(onItemSelected: controller.onMenuSelected);
  }

  final HomeView homeView = HomeView();
  FavoriteView? favoriteView;
  SettingsView? settingsView;

  Widget getPageOnSelectedMenu(MenuCode menuCode) {
    switch (menuCode) {
      case MenuCode.HOME:
        return homeView;
      case MenuCode.FAVORITE:
        favoriteView ??= FavoriteView();
        return favoriteView!;
      case MenuCode.SETTINGS:
        settingsView ??= SettingsView();
        return settingsView!;
      default:
        return OtherView(
          viewParam: describeEnum(menuCode),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        key: UniqueKey(),
        child: Obx(
          () => getPageOnSelectedMenu(controller.selectedMenuCode),
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }
}
