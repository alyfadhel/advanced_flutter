
import 'package:advanced_flutter_arabic/presenation/font_manager.dart';
import 'package:flutter/material.dart';

TextStyle _getStyle(FontWeight fontWeight, Color color, double fontSize)
{
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: FontConstants.fontFamily,
  );
}

// regular style
TextStyle getRegularStyle({
 required Color color ,
 double fontSize = FontSize.s12,
})
{
  return _getStyle(
      FontWeightManager.regular,
      color,
      fontSize,
  );
}

// medium style
TextStyle getMediumStyle({
  required Color color ,
  double fontSize = FontSize.s12,
})
{
  return _getStyle(
    FontWeightManager.medium,
    color,
    fontSize,
  );
}

// light style
TextStyle getLightStyle({
  required Color color ,
  double fontSize = FontSize.s12,
})
{
  return _getStyle(
    FontWeightManager.light,
    color,
    fontSize,
  );
}

// bold style
TextStyle getBoldStyle({
  required Color color ,
  double fontSize = FontSize.s12,
})
{
  return _getStyle(
    FontWeightManager.bold,
    color,
    fontSize,
  );
}

// semiBold style
TextStyle getSemiBoldStyle({
  required Color color ,
  double fontSize = FontSize.s12,
})
{
  return _getStyle(
    FontWeightManager.semiBold,
    color,
    fontSize,
  );
}

