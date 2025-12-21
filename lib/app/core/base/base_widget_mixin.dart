import 'package:flutter/material.dart';
import 'package:flutter_getx_template/l10n/app_localizations.dart';
import 'package:logger/logger.dart';

import '/flavors/build_config.dart';

mixin BaseWidgetMixin on StatelessWidget {
  static AppLocalizations? appLocalization(BuildContext context) => AppLocalizations.of(context);
  Logger get logger => BuildConfig.instance.config.logger;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: body(context),
    );
  }

  Widget body(BuildContext context);
}
