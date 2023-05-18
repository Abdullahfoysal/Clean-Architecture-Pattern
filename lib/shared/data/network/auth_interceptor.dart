import 'package:company/shared/presentation/widget/button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../di/app_module.dart';
import '../../presentation/widget/alert.dart';
import '../../res/style/app_design.dart';
import '../../services/navigation_service.dart';

class AuthInterceptor extends Interceptor {
  final NavigationService _navigationService = getIt<NavigationService>();
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = "";
    if (token != "") {
      options.headers.addAll({"Authorization": "Bearer $token"});
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);
    _handleError(err.response?.statusCode ?? 0);
  }

  _handleError(int statusCode) async {
    switch (statusCode) {
      case 400:
        showErrorAlert("Bad request",
            _navigationService.getNavigationServiceKey().currentContext!);
        print("Bad request");
        break;
      case 404:
        showErrorAlert("Not Found",
            _navigationService.getNavigationServiceKey().currentContext!);
        print("Not Found");
        break;
      case 500:
        showErrorAlert("Internal server error",
            _navigationService.getNavigationServiceKey().currentContext!);
        print("Internal server error");
        break;
      case 401:
        showErrorAlert("Unauthorized request",
            _navigationService.getNavigationServiceKey().currentContext!);

        print("Logged out");
        break;
      default:
        var hasInternet = await checkInternetStatus();
        var message = hasInternet
            ? "Something went wrong server!"
            : "Check your internet connection!";

        showErrorAlert(
            message,
            showErrorAlert("Internal server error",
                _navigationService.getNavigationServiceKey().currentContext!));

        print("Something went wrong server error");
        break;
    }
  }

  showErrorAlert(String message, BuildContext context) {
    Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 8, right: 8, top: 30, bottom: 40),
          child: Text(
            message,
            style: TextStyles.header1(),
            textAlign: TextAlign.center,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 45, width: 120, child: commonButton("Help", () {})),
            Container(
              height: 45,
              width: 120,
              child: commonButton("Okay", () {
                _navigationService.cancelPopUp(_navigationService
                    .getNavigationServiceKey()
                    .currentContext!);
              }, false),
            ),
          ],
        ),
        /*   Padding(
        padding: EdgeInsets.only(top: 20),
        child: ElevatedButton(
            onPressed: () {
              onHelpClick();
            },
            child: Text(
              "Help",
              style: TextStyles.subTitleBold(color: Colors.white),
            )),
      )*/
      ],
    );
    showSimpleAlert(
        context,
        Center(
          child: content,
        ),
        false);
  }
}

Future<bool> checkInternetStatus() async {
  try {
    final url = Uri.https('google.com');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}
