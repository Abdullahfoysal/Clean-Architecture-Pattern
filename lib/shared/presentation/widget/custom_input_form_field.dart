import 'package:company/shared/res/style/app_design.dart';
import 'package:flutter/material.dart';

import '../../res/style/app_colors.dart';

Widget customInputTextFormField(
    {AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction,
    TextInputType? keyboardType = TextInputType.text,
    TextEditingController? controller,
    required String? Function(String?)? validator,
    required Function(String) onChanged,
    required BuildContext context,
    bool obscureText = false,
    String? initialValue,
    int? maxLines,
    int? maxLength,
    InputDecoration? decoration}) {
  return TextFormField(
    controller: controller,
    textInputAction: TextInputAction.search,
    style: TextStyles.header1(),
    cursorColor: AppColors.lightGreen,
    autovalidateMode: autovalidateMode,
    keyboardType: keyboardType,
    initialValue: initialValue,
    validator: validator,
    onChanged: onChanged,
    decoration: decoration,
    obscureText: obscureText,
    maxLines: maxLines ?? 1,
    // maxLength: maxLength ?? 2000,
  );
}

OutlineInputBorder inputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(5.0),
);
OutlineInputBorder focusedEnabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: BorderSide(color: AppColors.formBorderColor, width: 1.0));
OutlineInputBorder enabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: BorderSide(color: AppColors.whiteColor, width: 1.0));
