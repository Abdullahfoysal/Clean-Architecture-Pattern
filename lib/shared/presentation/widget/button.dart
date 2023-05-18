import 'package:flutter/material.dart';

import '../../res/style/app_colors.dart';
import '../../res/style/app_design.dart';

Widget commonButton(String title, Function onPressed,
    [bool isSelected = true]) {
  return InkWell(
    onTap: () {
      onPressed();
    },
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: isSelected ? AppColors.blueDefault : AppColors.whiteColor,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: getCommonDecorator(isSelected),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(title,
                  style: TextStyle(
                      color: isSelected
                          ? AppColors.whiteColor
                          : AppColors.blueDefault,
                      fontWeight: FontWeight.bold,
                      fontSize: TextStyles.h3),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1),
            ),
          ],
        ),
      ),
    ),
  );
}

Decoration getCommonDecorator(bool isSelected) {
  return BoxDecoration(
    color: isSelected ? AppColors.blueDefault : AppColors.whiteColor,
    border: Border.all(width: 2.0, color: AppColors.blueDefault),
    borderRadius: const BorderRadius.all(
      Radius.circular(30),
    ),
  );
}
