import 'package:flutter/material.dart';
import 'package:flutter_1/screens/preferencest_screen.dart';
import 'package:flutter_1/screens/register_screen.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_1/screens/register_screen.dart';
import 'package:flutter_1/screens/dashboard_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/register': (BuildContext context) => const RegisterScreen(),
    '/preferencestTheme': (BuildContext context) => PreferencestScreen(),
    '/dash': (BuildContext context) => DashboardScreen(),
  };
}
