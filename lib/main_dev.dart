import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/app/my_app.dart';
import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import '/flavors/environment.dart';

void main() {
  EnvConfig devConfig = EnvConfig(
    appName: "俏郎中-开发",
    baseUrl: "https://api.github.com",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );
  runApp(const MyApp());
}
