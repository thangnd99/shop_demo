import 'package:flutter/material.dart';
import 'package:shop_demo_app/configs/app_configs.dart';

import 'app.dart';
import 'configs/app_env_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfigs.env = Environment.dev;
  runApp(const MyApp());
}
