import 'package:flutter/material.dart';

import '../../res/style/app_design.dart';

showSimpleAlert(BuildContext context, Widget content,
    [bool showCancelBtn = true, bool barrierDismissible = true]) {
  showDialog(
    barrierDismissible: barrierDismissible,
    context: context,
    builder: (context) => AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18.0))),
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
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  content,
                  AppDesign.spaceWidgets(height: 16),
                ],
              ),
            ),
            if (showCancelBtn) ...[
              Positioned(
                top: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    child: IconButton(
                      icon: Icon(
                        Icons.cancel_outlined,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    ),
  );
}
