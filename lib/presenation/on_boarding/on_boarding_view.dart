import 'package:advanced_flutter_arabic/presenation/resources/color_manager.dart';
import 'package:advanced_flutter_arabic/presenation/resources/constants_manager.dart';
import 'package:advanced_flutter_arabic/presenation/resources/routes_manager.dart';
import 'package:advanced_flutter_arabic/presenation/resources/strings_manager.dart';
import 'package:advanced_flutter_arabic/presenation/resources/styles_manager.dart';
import 'package:advanced_flutter_arabic/presenation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                  physics: const BouncingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) =>
                      BuildOnBoarding(model: boarding[index]),
                  itemCount: boarding.length,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: ColorManager.white,
        height: AppSize.s100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                },
                child: const Text(
                  AppStrings.skip,
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            _getBottomSheetWidget(),
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget() {
    return Container(
      width: AppSize.sInfinity,
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(
              AppPadding.p16,
            ),
            child: GestureDetector(
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.leftArrow),
              ),
              onTap: ()
              {
                _pageController.animateToPage(
                    _getPreviousIndex(),
                    duration: const Duration(milliseconds: AppConstants.sliderAnimationTime),
                    curve: Curves.bounceInOut);
              },
            ),
          ),
          Row(
            children: [
              for(int i=0 ; i<boarding.length; i++)
                 Padding(padding: const EdgeInsets.all(AppPadding.p8,),
                  child: _getProperCircle(i),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(
              AppPadding.p16,
            ),
            child: GestureDetector(
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.rightArrow),
              ),
              onTap: ()
              {
                _pageController.animateToPage(
                    _getNextIndex(),
                    duration: const Duration(milliseconds: AppConstants.sliderAnimationTime),
                    curve: Curves.bounceInOut,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  int _getPreviousIndex()
  {
    int previousIndex = _currentIndex--;
    if(previousIndex == -1){
      previousIndex = boarding.length -1;
    }
    return previousIndex;
  }

  int _getNextIndex()
  {
    int nextIndex = _currentIndex++;
    if(nextIndex == boarding.length){
      nextIndex = 0;
    }
    return nextIndex;
  }



  Widget _getProperCircle(int index)
  {
    if(index == _currentIndex){
      return SvgPicture.asset(ImageAssets.hollowCircle);
    }else{
      return SvgPicture.asset(ImageAssets.solidCircle);
    }
  }
}

class BuildOnBoarding extends StatelessWidget {
  final OnBoarding model;

  const BuildOnBoarding({Key? key, required this.model}) : super(key: key);

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
        SvgPicture.asset(model.image),
      ],
    );
  }
}
