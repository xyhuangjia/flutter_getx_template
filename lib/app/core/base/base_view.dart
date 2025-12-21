import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_template/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';

import '/app/core/base/base_controller.dart';
import '/app/core/model/page_state.dart';
import '/app/core/values/app_colors.dart';
import '/app/core/widget/loading.dart';
import '/flavors/build_config.dart';

abstract class BaseView<Controller extends BaseController> extends StatelessWidget {
  const BaseView({super.key});

  GlobalKey<ScaffoldState> get globalKey => GlobalKey<ScaffoldState>();

  AppLocalizations? appLocalization(BuildContext context) => AppLocalizations.of(context);

  Logger get logger => BuildConfig.instance.config.logger;

  Widget body(BuildContext context, Controller controller);

  PreferredSizeWidget? appBar(BuildContext context, Controller controller) => null; // 默认返回 null

  @override
  Widget build(BuildContext context) {
    return Consumer<Controller>(
      builder: (context, controller, child) {
        return GestureDetector(
          child: Stack(
            children: [
              annotatedRegion(context, controller),
              controller.pageState == PageState.LOADING
                  ? _showLoading()
                  : Container(),
              controller.errorMessage.isNotEmpty
                  ? showErrorSnackBar(context, controller.errorMessage)
                  : Container(),
              Container(),
            ],
          ),
        );
      },
    );
  }

  Widget annotatedRegion(BuildContext context, Controller controller) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        //Status bar color for android
        statusBarColor: AppColors.statusBarColor, // 状态栏颜色
        statusBarIconBrightness: Brightness.dark, // 状态栏图标颜色
        // systemNavigationBarColor: Colors.white, // 导航栏颜色
        // systemNavigationBarIconBrightness: Brightness.dark, // 导航栏图标颜色
      ),
      child: Material(
        color: Colors.transparent,
        child: pageScaffold(context, controller),
      ),
    );
  }

  Widget pageScaffold(BuildContext context, Controller controller) {
    return Scaffold(
      //sets ios status bar color
      backgroundColor: pageBackgroundColor(),
      key: globalKey,
      appBar: appBar(context, controller),
      floatingActionButton: floatingActionButton(),
      body: pageContent(context, controller),
      bottomNavigationBar: bottomNavigationBar(),
      drawer: drawer(),
    );
  }

  Widget pageContent(BuildContext context, Controller controller) {
    return SafeArea(
      child: body(context, controller),
    );
  }

  Widget showErrorSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });

    return Container();
  }


  Color pageBackgroundColor() {
    return AppColors.pageBackground;
  }

  Color statusBarColor() {
    return AppColors.statusBarColor;
  }

  Widget? floatingActionButton() {
    return null;
  }

  Widget? bottomNavigationBar() {
    return null;
  }

  Widget? drawer() {
    return null;
  }

  Widget _showLoading() {
    return const Loading();
  }
}
