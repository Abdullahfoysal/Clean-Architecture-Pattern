import 'package:company/shared/res/style/app_colors.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  final Widget child;
  BaseScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          // padding: AppDesign.screenBodyPadding(),
          decoration: BoxDecoration(color: AppColors.backGroundColor),
          child: child,
        ),
      ),
    );
  }
}
