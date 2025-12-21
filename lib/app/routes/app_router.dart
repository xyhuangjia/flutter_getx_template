import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '/app/modules/favorite/controllers/favorite_controller.dart';
import '/app/modules/favorite/views/favorite_view.dart';
import '/app/modules/home/controllers/home_controller.dart';
import '/app/modules/home/model/github_project_ui_data.dart';
import '/app/modules/home/views/home_view.dart';
import '/app/modules/login/controllers/login_controller.dart';
import '/app/modules/login/views/login_view.dart';
import '/app/modules/login_onekey/controllers/login_onekey_controller.dart';
import '/app/modules/login_onekey/views/login_onekey_view.dart';
import '/app/modules/main/controllers/main_controller.dart';
import '/app/modules/main/views/main_view.dart';
import '/app/modules/message/controllers/message_controller.dart';
import '/app/modules/message/views/message_view.dart';
import '/app/modules/mine/controllers/mine_controller.dart';
import '/app/modules/mine/views/mine_view.dart';
import '/app/modules/other/controllers/other_controller.dart';
import '/app/modules/other/views/other_view.dart';
import '/app/modules/project_details/controllers/project_details_controller.dart';
import '/app/modules/project_details/views/project_details_view.dart';
import '/app/modules/settings/controllers/settings_controller.dart';
import '/app/modules/settings/views/settings_view.dart';

class AppRouter {
  static const String main = '/main';
  static const String home = '/home';
  static const String favorite = '/favorite';
  static const String settings = '/settings';
  static const String other = '/other';
  static const String projectDetails = '/project-details';
  static const String login = '/login';
  static const String mine = '/mine';
  static const String message = '/message';
  static const String loginOnekey = '/login-onekey';

  static GoRouter getRouter(BuildContext context) {
    return GoRouter(
      initialLocation: main,
      routes: [
        GoRoute(
          path: main,
          builder: (context, state) => ChangeNotifierProvider<MainController>.value(
            value: Provider.of<MainController>(context, listen: false),
            child: const MainView(),
          ),
        ),
        GoRoute(
          path: home,
          builder: (context, state) => ChangeNotifierProvider<HomeController>.value(
            value: Provider.of<HomeController>(context, listen: false),
            child: HomeView(),
          ),
        ),
        GoRoute(
          path: favorite,
          builder: (context, state) => ChangeNotifierProvider<FavoriteController>.value(
            value: Provider.of<FavoriteController>(context, listen: false),
            child: FavoriteView(),
          ),
        ),
        GoRoute(
          path: settings,
          builder: (context, state) => ChangeNotifierProvider<SettingsController>.value(
            value: Provider.of<SettingsController>(context, listen: false),
            child: SettingsView(),
          ),
        ),
        GoRoute(
          path: other,
          builder: (context, state) {
            final viewParam = state.uri.queryParameters['viewParam'] ?? '';
            return ChangeNotifierProvider<OtherController>.value(
              value: Provider.of<OtherController>(context, listen: false),
              child: OtherView(viewParam: viewParam),
            );
          },
        ),
        GoRoute(
          path: projectDetails,
          builder: (context, state) {
            final extra = state.extra;
            GithubProjectUiData? dataModel;
            if (extra is GithubProjectUiData) {
              dataModel = extra;
            }
            return ChangeNotifierProvider<ProjectDetailsController>(
              create: (context) => ProjectDetailsController(context, dataModel: dataModel),
              child: const ProjectDetailsView(),
            );
          },
        ),
        GoRoute(
          path: login,
          builder: (context, state) => ChangeNotifierProvider<LoginController>(
            create: (_) => LoginController(),
            child: const LoginView(),
          ),
        ),
        GoRoute(
          path: mine,
          builder: (context, state) => ChangeNotifierProvider<MineController>.value(
            value: Provider.of<MineController>(context, listen: false),
            child: const MineView(),
          ),
        ),
        GoRoute(
          path: message,
          builder: (context, state) => ChangeNotifierProvider<MessageController>(
            create: (_) => MessageController(),
            child: const MessageView(),
          ),
        ),
        GoRoute(
          path: loginOnekey,
          builder: (context, state) => ChangeNotifierProvider<LoginOnekeyController>(
            create: (_) => LoginOnekeyController(),
            child: const LoginOnekeyView(),
          ),
        ),
      ],
    );
  }
}

// 保持向后兼容的路由常量
class Routes {
  Routes._();

  static const MAIN = AppRouter.main;
  static const HOME = AppRouter.home;
  static const FAVORITE = AppRouter.favorite;
  static const SETTINGS = AppRouter.settings;
  static const OTHER = AppRouter.other;
  static const PROJECT_DETAILS = AppRouter.projectDetails;
  static const LOGIN = AppRouter.login;
  static const MINE = AppRouter.mine;
  static const MESSAGE = AppRouter.message;
  static const LOGIN_ONEKEY = AppRouter.loginOnekey;
}

