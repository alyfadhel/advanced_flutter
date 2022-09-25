import 'dart:async';

import 'package:advanced_flutter_arabic/domain/models/models.dart';
import 'package:advanced_flutter_arabic/presenation/base/base_view_model.dart';
import 'package:advanced_flutter_arabic/presenation/resources/assets_manager.dart';
import 'package:advanced_flutter_arabic/presenation/resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel with OnBoardingViewModelInputs,OnBoardingViewModelOutputs
{
  final StreamController _streamController = StreamController<SliderViewObject>();
  late final List<SliderObject>_list;
  int _currentIndex = 0;



  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = ++_currentIndex;
    if(nextIndex == _list.length){
      nextIndex = 0;
    }
    return nextIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = --_currentIndex;
    if(previousIndex == -1){
      previousIndex = _list.length -1;
    }
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;


  @override
  Stream<SliderViewObject> get outputSliderViewObject => _streamController.stream.map((sliderViewObject) => sliderViewObject);

  void _postDataToView()
  {
    inputSliderViewObject.add(SliderViewObject(_list[_currentIndex],_list.length,_currentIndex));
  }

  List<SliderObject> _getSliderData() => [
    SliderObject(
      title: AppStrings.onBoardingTitle1,
      subTitle: AppStrings.onBoardingSubTitle1,
      image: ImageAssets.onBoardingLogo1,
    ),
    SliderObject(
      title: AppStrings.onBoardingTitle2,
      subTitle: AppStrings.onBoardingSubTitle2,
      image: ImageAssets.onBoardingLogo2,
    ),
    SliderObject(
      title: AppStrings.onBoardingTitle3,
      subTitle: AppStrings.onBoardingSubTitle3,
      image: ImageAssets.onBoardingLogo3,
    ),
    SliderObject(
      title: AppStrings.onBoardingTitle4,
      subTitle: AppStrings.onBoardingSubTitle4,
      image: ImageAssets.onBoardingLogo4,
    ),
  ];

}

abstract class OnBoardingViewModelInputs
{
  int goNext();
  int goPrevious();
  void onPageChanged(int index);

  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutputs
{
  Stream<SliderViewObject> get outputSliderViewObject;
}




