import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/cache_keys.dart';

class AppPreferences {
  static final AppPreferences _instance = AppPreferences._internal();
  late SharedPreferences _prefs;

  factory AppPreferences() {
    return _instance;
  }

  AppPreferences._internal();

  /// ✅ **تهيئة SharedPreferences**
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// ✅ **حفظ البيانات بأي نوع (`String, int, double, bool, List<String>`)**
  Future<void> setData(String key, dynamic value) async {
    if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is int) {
      await _prefs.setInt(key, value);
    } else if (value is double) {
      await _prefs.setDouble(key, value);
    } else if (value is bool) {
      await _prefs.setBool(key, value);
    } else if (value is List<String>) {
      await _prefs.setStringList(key, value);
    } else {
      throw Exception("Unsupported data type");
    }
  }

  /// ✅ **استرجاع البيانات (`String, int, double, bool, List<String>`)**
  dynamic getData(String key) {
    return _prefs.get(key);
  }

  /// ✅ **حذف بيانات مفتاح معين**
  Future<void> removeData(String key) async {
    await _prefs.remove(key);
  }

  /// ✅ **حفظ كائن Model (`T`)**
  Future<void> saveModel<T>(
    String key,
    T model,
    Map<String, dynamic> Function(T) toJson,
  ) async {
    final String jsonString = jsonEncode(toJson(model));
    await _prefs.setString(key, jsonString);
  }

  /// ✅ **استرجاع كائن Model (`T`)**
  T? getModel<T>(String key, T Function(Map<String, dynamic>) fromJson) {
    final String? jsonString = _prefs.getString(key);
    if (jsonString != null) {
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return fromJson(jsonMap);
    }
    return null;
  }

  /// ✅ **حفظ قائمة من النماذج (`List<T>`)**
  Future<void> saveModels<T>(
    String key,
    List<T> models,
    Map<String, dynamic> Function(T) toJson,
  ) async {
    final List<String> jsonList = models
        .map((model) => jsonEncode(toJson(model)))
        .toList();
    await _prefs.setStringList(key, jsonList);
  }

  /// ✅ **استرجاع قائمة من النماذج (`List<T>`)**
  List<T> getModels<T>(String key, T Function(Map<String, dynamic>) fromJson) {
    final List<String>? jsonList = _prefs.getStringList(key);
    if (jsonList != null) {
      return jsonList.map((json) => fromJson(jsonDecode(json))).toList();
    }
    return [];
  }

  Future<void> clearExceptCredentials() async {
    // حفظ بيانات تسجيل الدخول قبل الحذف
    String? savedEmail = _prefs.getString('saved_email');
    String? savedPassword = _prefs.getString('saved_password');
    bool? rememberMe = _prefs.getBool('remember_me');

    // مسح كل البيانات
    await _prefs.clear();

    // استرجاع بيانات تسجيل الدخول
    if (savedEmail != null) await _prefs.setString('saved_email', savedEmail);
    if (savedPassword != null) {
      await _prefs.setString('saved_password', savedPassword);
    }
    if (rememberMe != null) await _prefs.setBool('remember_me', rememberMe);
  }

  bool isLoggedInUser() {
    return _prefs.containsKey(CacheKeys.userData);
  }
}
