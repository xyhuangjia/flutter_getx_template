import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/app/data/local/preference/preference_manager.dart';
import '/app/data/local/preference/preference_manager_impl.dart';
import '/app/data/remote/github_remote_data_source.dart';
import '/app/data/remote/github_remote_data_source_impl.dart';
import '/app/data/repository/github_repository.dart';
import '/app/data/repository/github_repository_impl.dart';
import '/app/modules/favorite/controllers/favorite_controller.dart';
import '/app/modules/home/controllers/home_controller.dart';
import '/app/modules/main/controllers/bottom_nav_controller.dart';
import '/app/modules/main/controllers/main_controller.dart';
import '/app/modules/mine/controllers/mine_controller.dart';
import '/app/modules/other/controllers/other_controller.dart';
import '/app/modules/settings/controllers/settings_controller.dart';

class AppProviders {
  static List<Provider> getProviders(BuildContext context) {
    // Create remote data source first
    final remoteDataSource = GithubRemoteDataSourceImpl();
    
    return [
      // Repository providers (not ChangeNotifier)
      Provider<GithubRemoteDataSource>(
        create: (_) => remoteDataSource,
      ),
      Provider<GithubRepository>(
        create: (_) => GithubRepositoryImpl(
          remoteDataSource: remoteDataSource,
        ),
      ),
      Provider<PreferenceManager>(
        create: (_) => PreferenceManagerImpl(),
      ),
      
      // Controller providers (ChangeNotifier)
      ChangeNotifierProvider<BottomNavController>(
        create: (_) => BottomNavController(),
      ),
      ChangeNotifierProvider<MainController>(
        create: (_) => MainController(),
      ),
      ChangeNotifierProvider<HomeController>(
        create: (context) => HomeController(context),
      ),
      ChangeNotifierProvider<FavoriteController>(
        create: (_) => FavoriteController(),
      ),
      ChangeNotifierProvider<SettingsController>(
        create: (_) => SettingsController(),
      ),
      ChangeNotifierProvider<MineController>(
        create: (_) => MineController(),
      ),
      ChangeNotifierProvider<OtherController>(
        create: (_) => OtherController(),
      ),
    ];
  }
}

