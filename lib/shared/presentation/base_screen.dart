import 'package:company/shared/res/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseScreen extends StatelessWidget {
  final Widget child;
  BaseScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.backGroundColor, // You can use this as well
        statusBarIconBrightness:
            Brightness.dark, // OR Vice Versa for ThemeMode.dark
        statusBarBrightness:
            Brightness.light, // OR Vice Versa for ThemeMode.dark
      ),
    );
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        // padding: AppDesign.screenBodyPadding(),
        decoration: BoxDecoration(color: AppColors.backGroundColor),
        child: child,
      ),
    );
  }
}
