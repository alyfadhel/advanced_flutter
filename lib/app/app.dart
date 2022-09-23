import 'package:advanced_flutter_arabic/presenation/theme_manager.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {

  MyApp._internal();

  static final MyApp _instance = MyApp._internal();

  factory MyApp()=>_instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getApplicationTheme(),
    );
  }
}
