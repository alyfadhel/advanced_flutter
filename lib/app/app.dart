import 'package:advanced_flutter_arabic/presenation/resources/routes_manager.dart';
import 'package:advanced_flutter_arabic/presenation/resources/theme_manager.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {

  MyApp._internal();

  static final MyApp _instance = MyApp._internal();

  factory MyApp()=>_instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}
