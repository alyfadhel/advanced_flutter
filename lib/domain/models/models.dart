class SliderObject {
  final String title;
  final String subTitle;
  final String image;

  SliderObject(
      {required this.title, required this.subTitle, required this.image});
}


class SliderViewObject
{
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  SliderViewObject(this.sliderObject,this.numOfSlides,this.currentIndex);
}

