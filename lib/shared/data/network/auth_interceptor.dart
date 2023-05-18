import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
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
        showErrorAlert("Bad request", _navigationService.getCurrentContext!);
        print("Bad request");
        break;
      case 404:
        showErrorAlert("Not Found", _navigationService.getCurrentContext!);
        print("Not Found");
        break;
      case 500:
        showErrorAlert(
            "Internal server error", _navigationService.getCurrentContext!);
        print("Internal server error");
        break;
      case 401:
        if (SessionManager.instance.isLoggedIn) {
          SessionManager.instance.isLoggedIn = false;
          getIt<SettingScreenViewModel>().onSignOutClick();
        }

        print("Logged out");
        break;
      default:
        var hasInternet = await checkInternetStatus();
        var message = hasInternet
            ? "Something went wrong server!"
            : "Check your internet connection!";

        showErrorAlert(message, _navigationService.getCurrentContext!);

        print("Something went wrong server error");
        break;
    }
  }
}

showErrorAlert(String message, BuildContext context) {
  Widget content = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 30, bottom: 40),
        child: text(
          message,
          style: TextStyles.header2(),
          textAlign: TextAlign.center,
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 45,
              width: 120,
              child: settingCommonButton("Help", onHelpClick)),
          Container(
              height: 45,
              width: 120,
              child: settingCommonButton("Okay", Utility.popScreen, false)),
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
