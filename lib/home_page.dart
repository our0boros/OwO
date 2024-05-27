import 'package:flutter/material.dart';
import 'package:quick_actions/quick_actions.dart';
import 'settings_page.dart';
import 'Theme/color_scheme.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // =======================================================
  // 添加快捷访问
  @override
  void initState() {
    super.initState();

    const QuickActions quickActions = QuickActions();
    quickActions.initialize((String shortcutType) {
      switch (shortcutType) {
        case 'action_settings':
          Navigator.pushNamed(context, "/settings");
          break;
        case 'action_profile':
        // 处理其他快捷方式
          break;
        default:
          break;
      }
    });

    quickActions.setShortcutItems(<ShortcutItem> [
      const ShortcutItem(type: 'action_settings', localizedTitle: 'Settings', icon: 'icon_settings'),
      const ShortcutItem(type: 'action_profile', localizedTitle: 'Profile', icon: 'icon_profile'),
    ]);
  }
  // =======================================================
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Text(
          "OwO",
          style: TextStyle(
            fontSize: 200,
          )
        ),
      ),
    );
  }

}
