import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_getx_template/app/core/base/base_widget_mixin.dart';
import 'package:flutter_getx_template/app/core/widget/asset_image_view.dart';

import '/app/core/values/app_colors.dart';
import '/app/core/values/app_values.dart';
import '/app/modules/main/controllers/bottom_nav_controller.dart';
import '/app/modules/main/model/menu_code.dart';
import '/app/modules/main/model/menu_item.dart';

typedef OnBottomNavItemSelected = Function(MenuCode menuCode);

class BottomNavBar extends StatelessWidget with BaseWidgetMixin {
  BottomNavBar({
    super.key,
    required this.onItemSelected,
  });

  final OnBottomNavItemSelected onItemSelected;
  final Key bottomNavKey = GlobalKey();
  final Color selectedItemColor = Colors.white;
  final Color unselectedItemColor = Colors.grey;

  @override
  Widget body(BuildContext context) {
    List<BottomNavItem> navItems = _getNavItems(context);

    return Consumer<BottomNavController>(
      builder: (context, navController, child) {
        return BottomNavigationBar(
          key: bottomNavKey,
          items: _navItemBuilder(navItems, navController),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.colorAccent,
          selectedItemColor: selectedItemColor,
          unselectedItemColor: unselectedItemColor,
          currentIndex: navController.selectedIndex,
          onTap: (index) {
            navController.updateSelectedIndex(index);
            onItemSelected(navItems[index].menuCode);
          },
        );
      },
    );
  }

  List<BottomNavigationBarItem> _navItemBuilder(List<BottomNavItem> navItems, BottomNavController navController) {
    return navItems
        .map(
          (BottomNavItem navItem) => _getBottomNavigationBarItem(
            navItem,
            navItems.indexOf(navItem) == navController.selectedIndex,
          ),
        )
        .toList();
  }

  BottomNavigationBarItem _getBottomNavigationBarItem(
    BottomNavItem navItem,
    bool isSelected,
  ) {
    return BottomNavigationBarItem(
      icon: AssetImageView(
        fileName: navItem.iconSvgName,
        height: AppValues.iconDefaultSize,
        width: AppValues.iconDefaultSize,
        color: isSelected ? selectedItemColor : unselectedItemColor,
      ),
      label: navItem.navTitle,
      tooltip: navItem.navTitle,
    );
  }

  List<BottomNavItem> _getNavItems(BuildContext context) {
    final appLocalization = BaseWidgetMixin.appLocalization(context);
    return MenuCode.values
        .map((e) => e.toBottomNavItem(appLocalization))
        .toList();
  }
}
