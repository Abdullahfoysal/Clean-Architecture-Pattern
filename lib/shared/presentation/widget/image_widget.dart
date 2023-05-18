import 'package:flutter/material.dart';

Widget getImageFromAsset(
        {required String imagePath,
        required BoxFit fit,
        double scale = 1.0,
        Color? color}) =>
    Image.asset(
      imagePath,
      scale: scale,
      //height: height,
      //  width: width,
      fit: fit,
      color: color,
    );
