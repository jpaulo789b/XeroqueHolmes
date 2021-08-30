import 'package:flutter/material.dart';
import 'package:fluttergit/controllers/navigator_controller.dart';
import 'package:get_it/get_it.dart';

class ControladorApp {
  ThemeMode themeMode = ThemeMode.system;
  bool get isAppDark => (themeMode == ThemeMode.system)
      ? MediaQuery.of(GetIt.I.get<NavigatorController>().context).platformBrightness == Brightness.dark
      : themeMode == ThemeMode.dark;
  Color defaultColor = Colors.red;
}
