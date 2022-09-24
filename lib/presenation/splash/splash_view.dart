import 'dart:async';

import 'package:advanced_flutter_arabic/presenation/resources/assets_manager.dart';
import 'package:advanced_flutter_arabic/presenation/resources/color_manager.dart';
import 'package:advanced_flutter_arabic/presenation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

import '../resources/constants_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);
  navigateToOnBoarding(context)async
  {
    await Future.delayed(const Duration(seconds: 5,),(){
      Navigator.pushNamed(context, Routes.onBoardingRoute);
    });
  }


  @override
  State<SplashView> createState() => _SplashViewState();
}


class _SplashViewState extends State<SplashView> {
  @override
  void initState()
  {
    super.initState();
    navigateToOnBoarding();
  }

  navigateToOnBoarding() async {
    await Future.delayed(
      const Duration(seconds: AppConstants.splashDelay),
          () {
        Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
      },
    );
  }
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
