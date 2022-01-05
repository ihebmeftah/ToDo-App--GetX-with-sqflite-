// ignore_for_file: unused_element, unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeServices {
  final GetStorage _box = GetStorage();
  final _key = 'isDarkMode';

  _savethemetobox(bool isDarkMode) => _box.write(_key, isDarkMode);

  bool _loadthemefrombox() => _box.read<bool>(_key) ?? false;

  ThemeMode get theme => _loadthemefrombox() ? ThemeMode.light : ThemeMode.dark;
  void switchTheme() {
    Get.changeThemeMode(_loadthemefrombox() ? ThemeMode.light : ThemeMode.dark);
    _savethemetobox(!_loadthemefrombox());
  }
}
