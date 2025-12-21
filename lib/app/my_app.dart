import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '/app/core/providers/app_providers.dart';
import '/app/core/values/app_colors.dart';
import '/app/routes/app_router.dart';
import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import '../l10n/app_localizations.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final EnvConfig _envConfig = BuildConfig.instance.config;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.getProviders(context),
      child: Builder(
        builder: (context) {
          final router = AppRouter.getRouter(context);
          return MaterialApp.router(
            title: _envConfig.appName,
            routerConfig: router,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: _getSupportedLocal(),
            theme: ThemeData(
              primarySwatch: AppColors.colorPrimarySwatch,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              brightness: Brightness.light,
              primaryColor: AppColors.colorPrimary,
              appBarTheme: AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                statusBarBrightness: Brightness.light, // iOS 状态栏文本颜色（亮色）
                statusBarIconBrightness: Brightness.dark, // Android 状态栏图标颜色
                statusBarColor: Colors.transparent, // 状态栏背景色
              )),
              textTheme: const TextTheme(
                labelLarge: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              fontFamily: 'Roboto',
              pageTransitionsTheme: const PageTransitionsTheme(
                builders: {
                  TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
                  TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                },
              ),
            ),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }

  List<Locale> _getSupportedLocal() {
    return [
      const Locale('en', ''),
      const Locale('bn', ''),
    ];
  }
}
