import 'package:advanced_flutter_arabic/presenation/resources/assets_manager.dart';
import 'package:advanced_flutter_arabic/presenation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: const Center(
        child: Image(
            image: AssetImage(ImageAssets.splashScreen),
        ),
      ),
    );
  }
}
