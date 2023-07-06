import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static StorageService? _instance;
  SharedPreferences? _prefs;

  static StorageService get instance {
    if (_instance == null) {
      _instance = StorageService._();
    }

    return _instance!;
  }

  StorageService._();

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String getString(String key) {
    return _prefs!.getString(key) ?? "";
  }

  Future<bool> remove(String key) async {
    return await _prefs!.remove(key);
  }

  Future<bool> setString(String key, String value) {
    return _prefs!.setString(key, value);
  }
}
