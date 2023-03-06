import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'inicio_page.dart';

class PreferencestScreen extends StatelessWidget {
  const PreferencestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: InicioPage());
  }
}
