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
  bool isDark = PreferencesManager.instance.getString("theme") == "dark";
  bool useSystemTheme = PreferencesManager.instance.getString("theme") == "system";
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

            Checkbox(value: useSystemTheme, onChanged: (bool? value) {
              print("[Settings] Brightness:${Theme.of(context).brightness.name}");
              bool tempDarkOrLight = Theme.of(context).brightness.name == "dark";
              setState(() {
                useSystemTheme = value!;
                if (value) {
                  print("[Settings] 使用系统主题");

                  // 启用系统主题时设置当前状态主题
                  widget.setThemeFunc("system");
                  // 修改白天黑夜主题状态
                  // TODO: BUG 没法检测到当前的主题亮度
                  isDark = tempDarkOrLight;

                } else {
                  print("[Settings] 使用自选主题");
                  // 不使用系统主题时检测原有主题应有的状态
                  tempDarkOrLight ?
                    widget.setThemeFunc("dark") :
                    widget.setThemeFunc("light");
                }
              });
            }),

            Switch(value: isDark, onChanged: (bool value) {
              if (!useSystemTheme) {
                setState(() {
                  isDark = value;
                  if (isDark) {
                    print("[Settings] 使用白天主题");
                    widget.setThemeFunc("light");
                  } else {
                    print("[Settings] 使用夜晚主题");
                    widget.setThemeFunc("dark");
                  }
                });
              }
            },
            )
          ],
        ),
      ),
    );
  }
}
