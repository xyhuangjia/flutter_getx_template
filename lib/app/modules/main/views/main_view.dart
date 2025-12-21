import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_getx_template/app/modules/mine/views/mine_view.dart';

import '/app/modules/favorite/views/favorite_view.dart';
import '/app/modules/home/views/home_view.dart';
import '/app/modules/main/controllers/bottom_nav_controller.dart';
import '/app/modules/main/controllers/main_controller.dart';
import '/app/modules/main/model/menu_code.dart';
import '/app/modules/main/views/bottom_nav_bar.dart';
import '/app/modules/other/views/other_view.dart';
import '/app/modules/settings/views/settings_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  Widget? bottomNavigationBar(BuildContext context) {
    return Consumer<BottomNavController>(
      builder: (context, navController, child) {
        return BottomNavBar(
          onItemSelected: (menuCode) {
            Provider.of<MainController>(context, listen: false).onMenuSelected(menuCode);
          },
        );
      },
    );
  }

  final HomeView homeView = HomeView();
  FavoriteView? favoriteView;
  SettingsView? settingsView;
  const MineView mineView = MineView();
  
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
      case MenuCode.MINE:
        return mineView;
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
        child: Consumer<MainController>(
          builder: (context, controller, child) {
            return getPageOnSelectedMenu(controller.selectedMenuCode);
          },
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(context),
    );
  }
}