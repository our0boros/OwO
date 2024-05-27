import 'package:flutter/material.dart';
import 'package:owo/global_data.dart';
import 'package:owo/main.dart';

class SettingsPage extends StatefulWidget {
  final void Function(String theme) setThemeFunc;
  const SettingsPage({super.key, required this.setThemeFunc});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  static bool isDark = PreferencesManager.instance.getString("theme") == "dark";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: ListView(
          children: [
            Center(child: Text('This is Settings Page (o゜▽゜)o☆'),),


            Switch(value: isDark, onChanged: (bool value) {
              setState(() {
                if (isDark) {
                  print("[Settings] 使用白天主题");
                  widget.setThemeFunc("light");
                } else {
                  print("[Settings] 使用夜晚主题");
                  widget.setThemeFunc("dark");
                }
                isDark = value;
              });
            },
            )
          ],
        ),
      ),
    );
  }
}
