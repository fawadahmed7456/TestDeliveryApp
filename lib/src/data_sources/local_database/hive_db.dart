import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDb {
  HiveDb();

  Box? _box;

  Future<void> initializeBox() async {
    await Hive.initFlutter();
    _box = await Hive.openBox("localDatabase");
  }

  Future<void> registerAdapters() async {
    // Register adapters if any
  }

  Future<void> insert({
    required String key,
    required Map<String, dynamic>? data,
  }) async {
    if (data != null) {
      await _box?.put(key, jsonEncode(data));
    }
  }

  Future<void> insertObject({
    required String key,
    required dynamic data,
  }) async {
    try {
      if (data != null) {
        await _box?.put(key, data);
      }
    } catch (e) {
      debugPrint("Hive saving error: $e");
    }
  }

  Future<T?> getObject<T>({required String key}) async {
    try {
      return _box?.get(key);
    } catch (e) {
      debugPrint("Hive retrieval error: $e");
      return null;
    }
  }

  Future<void> delete({
    required String key,
  }) async {
    await _box?.delete(key);
  }
}
