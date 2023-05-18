import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../presentation/widget/alert.dart';

abstract class NavigationService {
  GlobalKey<NavigatorState> getNavigationServiceKey();
  void showNewCompanyPopUp(BuildContext context, Widget content,
      [bool showCancelBtn = true, bool barrierDismissible = true]);
  void cancelPopUp(BuildContext context);
  //void showSnackBar(BuildContext context, String message);
}

@Singleton(as: NavigationService)
class NavigationServiceImp implements NavigationService {
  NavigationServiceImp();

  @override
  void showNewCompanyPopUp(BuildContext context, Widget content,
      [bool showCancelBtn = true, bool barrierDismissible = true]) {
    showSimpleAlert(context, content, showCancelBtn, barrierDismissible);
  }

  @override
  void cancelPopUp(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  GlobalKey<NavigatorState> getNavigationServiceKey() {
    GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    return navigatorKey;
  }

/*  @override
  void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: AppColors.alertTitleColor,
      */ /*action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),*/ /*
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }*/
}
