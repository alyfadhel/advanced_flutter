import 'package:advanced_flutter_arabic/presenation/on_boarding/viewmodel/onboarding_viewmodel.dart';
import 'package:advanced_flutter_arabic/presenation/resources/color_manager.dart';
import 'package:advanced_flutter_arabic/presenation/resources/constants_manager.dart';
import 'package:advanced_flutter_arabic/presenation/resources/routes_manager.dart';
import 'package:advanced_flutter_arabic/presenation/resources/strings_manager.dart';
import 'package:advanced_flutter_arabic/presenation/resources/styles_manager.dart';
import 'package:advanced_flutter_arabic/presenation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../domain/models/models.dart';
import '../../resources/assets_manager.dart';
import '../../resources/font_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  OnBoardingViewModel viewModel = OnBoardingViewModel();

  _bind()
  {
    viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: viewModel.outputSliderViewObject,
        builder: (context, snapshot){
          return _getContentWidget(snapshot.data);
        },);
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject)
  {
    if(sliderViewObject == null){
     return Container();
    }else{
      return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          elevation: AppSize.s0,
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
                      viewModel.onPageChanged(index);
                    },
                    itemBuilder: (context, index) =>
                        BuildOnBoarding(model: sliderViewObject.sliderObject),
                    itemCount: sliderViewObject.numOfSlides,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomSheet: Container(
          color: ColorManager.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  },
                  child: Text(
                    AppStrings.skip,
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              _getBottomSheetWidget(sliderViewObject),
            ],
          ),
        ),
      );
    }
  }

  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject) {
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
                    viewModel.goPrevious(),
                    duration: const Duration(microseconds: AppConstants.sliderAnimationTime),
                    curve: Curves.bounceInOut);
              },
            ),
          ),
          Row(
            children: [
              for(int i=0 ; i<sliderViewObject.numOfSlides; i++)
                 Padding(padding: const EdgeInsets.all(AppPadding.p8,),
                  child: _getProperCircle(i,sliderViewObject.currentIndex),
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
                    viewModel.goNext(),
                    duration: const Duration(microseconds: AppConstants.sliderAnimationTime),
                    curve: Curves.bounceInOut,
                );
              },
            ),
          ),
        ],
      ),
    );
  }



  Widget _getProperCircle(int index, int currentIndex)
  {
    if(index == currentIndex){
      return SvgPicture.asset(ImageAssets.hollowCircle);
    }else{
      return SvgPicture.asset(ImageAssets.solidCircle);
    }
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }
}

class BuildOnBoarding extends StatelessWidget {
  final SliderObject model;
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
