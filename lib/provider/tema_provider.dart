import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TemaProvider extends GetxController {
  SharedPreferences? preferences;
  String prefKey = "isDarkModeKey";

  void temaClaro() {
    Get.changeTheme(ThemeData.light());
    preferences!.setBool(prefKey, false);
  }

  void temaObscuro() {
    Get.changeTheme(ThemeData.dark());
    preferences!.setBool(prefKey, true);
  }

  void temaPersonalizado() {
    Get.changeTheme(ThemeData(
        //buttonTheme: const ButtonThemeData(buttonColor: Colors.red),
        primaryColor: Colors.orange,
        appBarTheme: AppBarTheme(color: Colors.orange)));
  }

  @override
  void onInit() {
    cargarPreferencias().then((value) => cargarTema());
    super.onInit();
  }

  void cargarTema() {
    bool? isDarkMode = preferences?.getBool(prefKey);
    if (isDarkMode == null) {
      preferences!.setBool(prefKey, false);
      isDarkMode = false;
    }
    (isDarkMode) ? temaObscuro() : temaClaro();
  }

  Future<void> cargarPreferencias() async {
    preferences = await Get.putAsync<SharedPreferences>(
        () async => await SharedPreferences.getInstance());
  }
}
