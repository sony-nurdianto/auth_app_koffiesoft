import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  late SharedPreferences _prefs;

  // Singleton pattern to ensure only one instance of SharedPreferences is created
  static final SharedPreferenceHelper _instance =
      SharedPreferenceHelper._internal();

  factory SharedPreferenceHelper() {
    return _instance;
  }

  SharedPreferenceHelper._internal();

  // Initialize SharedPreferences
  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Methods for saving and retrieving data
  Future<bool> saveString(String key, String value) {
    return _prefs.setString(key, value);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  Future<bool> saveInt(String key, int value) {
    return _prefs.setInt(key, value);
  }

  int getInt(String key) {
    return _prefs.getInt(key)!;
  }

  Future<bool> saveBool(String key, bool value) {
    return _prefs.setBool(key, value);
  }

  bool getBool(String key) {
    return _prefs.getBool(key)!;
  }

  Future<bool> saveDouble(String key, double value) {
    return _prefs.setDouble(key, value);
  }

  double getDouble(String key) {
    return _prefs.getDouble(key)!;
  }

  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }

  Future<bool> clearAll() {
    return _prefs.clear();
  }
}
