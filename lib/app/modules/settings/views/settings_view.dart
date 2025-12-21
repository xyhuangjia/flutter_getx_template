import 'package:flutter/material.dart';
import 'package:flutter_getx_template/l10n/app_localizations.dart';
import '/app/modules/settings/widgets/item_settings_widgets.dart';
import '/app/core/base/base_view.dart';
import '/app/core/widget/custom_app_bar.dart';
import '/app/modules/settings/controllers/settings_controller.dart';

class SettingsView extends BaseView<SettingsController> {
  const SettingsView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context, SettingsController controller) {
    final appLocalization = AppLocalizations.of(context);
    return CustomAppBar(
      appBarTitleText: appLocalization?.bottomNavSettings ?? 'Settings',
      isBackButtonEnabled: false,
    );
  }

  @override
  Widget body(BuildContext context, SettingsController controller) {
    final appLocalization = AppLocalizations.of(context);
    return Column(
      children: [
        ItemSettings(
          title: appLocalization?.settingsTheme ?? 'Theme',
          prefixImage: 'ic_theme.png',
          suffixImage: 'arrow_forward.svg',
          onTap: () => _onThemeItemClicked(context, controller),
        ),
        _getHorizontalDivider(),
        ItemSettings(
          title: appLocalization?.settingsLanguage ?? 'Language',
          prefixImage: 'ic_language.svg',
          suffixImage: 'arrow_forward.svg',
          onTap: () => _onLanguageItemClicked(context, controller),
        ),
        _getHorizontalDivider(),
        ItemSettings(
          title: appLocalization?.settingsFontSize ?? 'Font Size',
          prefixImage: 'ic_font_size.svg',
          suffixImage: 'arrow_forward.svg',
          onTap: () => _onFontSizeItemClicked(context, controller),
        ),
        _getHorizontalDivider(),
      ],
    );
  }

  Widget _getHorizontalDivider() {
    return const Divider(height: 1);
  }

  void _onThemeItemClicked(BuildContext context, SettingsController controller) {
    controller.showToast('Theme: Development in progress');
  }

  void _onLanguageItemClicked(BuildContext context, SettingsController controller) {
    controller.showToast('Language: Development in progress');
  }

  void _onFontSizeItemClicked(BuildContext context, SettingsController controller) {
    controller.showToast('Font Size: Development in progress');
  }

}
