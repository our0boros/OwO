import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:owo/face_text.dart';
import 'package:quick_actions/quick_actions.dart';
import 'settings_page.dart';
import '../Theme/color_scheme.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late FaceText _face;
  late String _face_text;
  late Timer _updateTimer;
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


    _face = FaceText();
    _face_text = "OwO";
    // 定期更新界面以反映 FaceText 的变化
    _updateTimer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        _face_text = _face.getFace();
      }); // 触发界面刷新
    });
  }
  // =======================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          _face_text,
          style: TextStyle(
            fontSize: 200,
          )
        ),
      ),
    );
  }

}
