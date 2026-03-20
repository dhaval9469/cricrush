import 'package:get_storage/get_storage.dart';

class AppPref {
  static final AppPref _instance = AppPref._internal();

  factory AppPref() => _instance;

  AppPref._internal();

  final _box = GetStorage();

  static Future<void> init() async {
    await GetStorage.init();
  }

  /// Save data
  Future<void> write(String key, dynamic value) async {
    await _box.write(key, value);
  }

  /// Read data
  T? read<T>(String key) {
    return _box.read<T>(key);
  }

  /// Remove a specific key
  Future<void> remove(String key) async {
    await _box.remove(key);
  }

  /// Clear all saved data
  Future<void> clear() async {
    await _box.erase();
  }

  /// Check if key exists
  bool has(String key) {
    return _box.hasData(key);
  }
}
