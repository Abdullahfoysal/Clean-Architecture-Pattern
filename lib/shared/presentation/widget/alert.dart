import 'package:company/shared/di/app_module.dart';
import 'package:company/shared/presentation/widget/image_widget.dart';
import 'package:company/shared/res/app_images.dart';
import 'package:flutter/material.dart';

import '../../res/style/app_design.dart';
import '../../services/navigation_service.dart';

showSimpleAlert(BuildContext context, Widget content,
    [bool showCancelBtn = true, bool barrierDismissible = true]) {
  showDialog(
    barrierDismissible: barrierDismissible,
    context: context,
    builder: (context) => AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      contentPadding: const EdgeInsets.only(top: 0.0),
      titlePadding: EdgeInsets.all(0.0),
      iconPadding: EdgeInsets.all(0.0),
      title: Padding(
        padding: AppDesign.widgetPadding(vertical: 0),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  content,
                  AppDesign.spaceWidgets(height: 16),
                ],
              ),
            ),
            if (showCancelBtn) ...[
              Positioned(
                top: 15,
                right: 8,
                child: InkWell(
                  onTap: () {
                    getIt<NavigationService>().cancelPopUp(context);
                  },
                  child: getImageFromAsset(
                      imagePath: AppImage.cancelIcon, fit: BoxFit.contain),
                ),
              ),
            ]
          ],
        ),
      ),
    ),
  );
}
