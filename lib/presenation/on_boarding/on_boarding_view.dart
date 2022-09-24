import 'package:advanced_flutter_arabic/presenation/resources/color_manager.dart';
import 'package:advanced_flutter_arabic/presenation/resources/strings_manager.dart';
import 'package:advanced_flutter_arabic/presenation/resources/styles_manager.dart';
import 'package:advanced_flutter_arabic/presenation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../resources/assets_manager.dart';
import '../resources/font_manager.dart';

var _pageController = PageController();

class OnBoarding {
  final String title;
  final String subTitle;
  final String image;

  OnBoarding(
      {required this.title, required this.subTitle, required this.image});
}

List<OnBoarding> boarding = [
  OnBoarding(
    title: AppStrings.onBoardingTitle1,
    subTitle: AppStrings.onBoardingSubTitle1,
    image: ImageAssets.onBoardingLogo1,
  ),
  OnBoarding(
    title: AppStrings.onBoardingTitle2,
    subTitle: AppStrings.onBoardingSubTitle2,
    image: ImageAssets.onBoardingLogo2,
  ),
  OnBoarding(
    title: AppStrings.onBoardingTitle3,
    subTitle: AppStrings.onBoardingSubTitle3,
    image: ImageAssets.onBoardingLogo3,
  ),
  OnBoarding(
    title: AppStrings.onBoardingTitle4,
    subTitle: AppStrings.onBoardingSubTitle4,
    image: ImageAssets.onBoardingLogo4,
  ),
];
int _currentIndex = 0;
class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ColorManager.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index)
                  {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => BuildOnBoarding(model: boarding[index]),
                  itemCount: boarding.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class BuildOnBoarding extends StatelessWidget {
 final OnBoarding model;
  const BuildOnBoarding({Key? key,required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          model.title,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(
          height: AppSize.s20,
        ),
        Text(
          model.subTitle,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: AppSize.s20,
        ),
        Image(
          image: AssetImage(model.image),
        ),
      ],
    );
  }
}

