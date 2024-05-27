import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:owo/global_data.dart';
import 'package:owo/settings_page.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:shared_preferences/shared_preferences.dart';
// 界面
import 'home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  void setThemeMode(String theme) => _MyAppState().setThemeMode(theme);
}

class _MyAppState extends State<MyApp> {

  late ThemeMode _themeMode;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    PreferencesManager.instance.init();
    _themeMode = getThemeMode();
    return MaterialApp(
      title: '（〃｀ 3′〃）',
      theme: FlexThemeData.light(scheme: FlexScheme.mandyRed),
      // The Mandy red, dark theme.
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.mandyRed),
      // Use dark or light theme based on system setting.
      themeMode: _themeMode,
      routes: {
        '/': (context) => MyHomePage(title: 'OwO'),
        '/settings': (context) => SettingsPage(setThemeFunc: setThemeMode),
      },
    );
  }

  void setThemeMode(String theme) {
    setState(() {
      PreferencesManager.instance.setString("theme", theme);
      if (theme == "system") { _themeMode = ThemeMode.system; return; }
      if (theme == "dark") { _themeMode = ThemeMode.dark; return; }
      if (theme == "light") { _themeMode = ThemeMode.light; return; }
      _themeMode = ThemeMode.system;
    });
  }

  ThemeMode getThemeMode() {
    String? theme = PreferencesManager.instance.getStringOrDefault("theme", "system");
    if (theme == "system") { return ThemeMode.system; }
    if (theme == "dark") { return ThemeMode.dark; }
    if (theme == "light") { return ThemeMode.light; }
    return ThemeMode.system;
  }
}
