import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../presentation/widget/alert.dart';

abstract class NavigationService {
  void showNewCompanyPopUp(BuildContext context, Widget content,
      [bool showCancelBtn = true, bool barrierDismissible = true]);
  void cancelPopUp(BuildContext context);
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
}
