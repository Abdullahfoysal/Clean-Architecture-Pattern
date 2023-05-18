import 'package:company/shared/res/style/app_colors.dart';
import 'package:flutter/material.dart';

const fontFamilyName = "Roboto";

abstract class AppDesign {
  static Widget divider({
    double thickness = 1.5,
  }) =>
      Padding(
        padding: widgetPadding(horizontal: 0, vertical: 0),
        child: Divider(thickness: thickness),
      );

  static Widget spaceWidgets({double width = 5, double height = 0.0}) =>
      SizedBox(
        width: width,
        height: height,
      );

  static EdgeInsetsGeometry screenBodyPadding(
          {double horizontal = 20, double vertical = 3.0}) =>
      EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);

  static EdgeInsetsGeometry widgetPadding(
          {double horizontal = 10.0, double vertical = 5.0}) =>
      EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
}

abstract class TextStyles {
  static const double bigTitleFontSize = 28;
  static const double h0 = 22.0;
  static const double h1 = 17.0;
  static const double h2 = 14.0;
  static const double h3 = 12.0;

  static TextStyle header1({double fontSize = h1}) => TextStyle(
      fontFamily: fontFamilyName,
      fontSize: fontSize,
      fontWeight: FontWeight.bold);

  static TextStyle header0({double fontSize = h0}) => TextStyle(
      fontFamily: fontFamilyName,
      fontSize: fontSize,
      fontWeight: FontWeight.bold);

  static TextStyle subTitle({
    double fontSize = h1,
  }) =>
      TextStyle(
          fontFamily: fontFamilyName,
          fontSize: fontSize,
          color: AppColors.grey);

  static TextStyle subTitleBold(
          {double fontSize = h3, Color color = Colors.grey}) =>
      TextStyle(
          fontFamily: fontFamilyName,
          fontSize: fontSize,
          color: color,
          fontWeight: FontWeight.bold);
}
