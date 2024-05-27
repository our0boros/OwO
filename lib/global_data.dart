import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  // 私有构造函数
  PreferencesManager._privateConstructor();

  // 单例实例
  static final PreferencesManager _instance = PreferencesManager._privateConstructor();

  // 公有访问点
  static PreferencesManager get instance => _instance;

  SharedPreferences? _preferences;

  // 初始化 SharedPreferences 实例
  Future<bool> init() async {
    if (_preferences != null) {
      return true;
    }
    _preferences = await SharedPreferences.getInstance();
    return false;
  }

  Future<void> _ensureInitialized() async {
    if (_preferences == null) {
      await init();
    }
  }

  // 设置键值对
  Future<void> setString(String key, String value) async {
    await _ensureInitialized();
    await _preferences?.setString(key, value);
  }

  // 获取键值对
  Future<String?> getString(String key) async {
    await _ensureInitialized();
    return _preferences?.getString(key);
  }

  // 获取键值对
  Future<String> getStringOrDefault(String key, String defaultValue) async {
    await _ensureInitialized();
    if (_preferences!.containsKey(key)) {
      return _preferences?.getString(key) ?? defaultValue;
    } else {
      await setString(key, defaultValue);
      return defaultValue;
    }
  }

  // 删除键值对
  Future<void> remove(String key) async {
    await _ensureInitialized();
    await _preferences?.remove(key);
  }

  Future<bool> isPreferenceNull() async {
    await _ensureInitialized();
    return _preferences == null;
  }
}
