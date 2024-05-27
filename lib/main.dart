import 'dart:async';

import 'dart:ui' as ui;
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:owo/global_data.dart';
import 'package:owo/Pages/settings_page.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:shared_preferences/shared_preferences.dart';
// 界面
import 'Pages/home_page.dart';
import 'Pages/splash_page.dart';


void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  void setThemeMode(String theme) => _MyAppState().setThemeMode(theme);
}

class _MyAppState extends State<MyApp> {

  late Future<ThemeMode> _themeMode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _themeMode = getThemeMode();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _themeMode,
      builder: (context, snapshot) {
        final ThemeMode themeMode = snapshot.data ?? ThemeMode.system;
        return MaterialApp(
          title: '（〃｀ 3′〃）',
          theme: FlexThemeData.light(scheme: FlexScheme.mandyRed),
          darkTheme: FlexThemeData.dark(scheme: FlexScheme.mandyRed),
          themeMode: themeMode,
          routes: {
            '/': (context) => MyHomePage(title: 'OwO'),
            '/settings': (context) => SettingsPage(setThemeFunc: setThemeMode),
          },
        );
      },
    );
  }

  void setThemeMode(String theme) {
    setState(() {
      PreferencesManager.instance.setString("theme", theme);
      if (theme == "dark") { _themeMode = ThemeMode.dark as Future<ThemeMode>; return; }
      if (theme == "light") { _themeMode = ThemeMode.light as Future<ThemeMode>; return; }
      throw Exception("invalid theme type");
    });
  }

  // 假设这是您的异步函数，返回 Future<Theme>
  Future<ThemeMode> getThemeMode() async {
    String theme = await PreferencesManager.instance.getStringOrDefault("theme", "light"); // 模拟异步操作
    if (theme == "dark") { return ThemeMode.dark; }
    if (theme == "light") { return ThemeMode.light; }
    return ThemeMode.system;
  }


}
