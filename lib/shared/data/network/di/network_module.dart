import 'package:company/shared/data/network/auth_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../../environment.dart';
import '../network_constants.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  PrettyDioLogger get dioLoggingInterceptor => PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true);

  @lazySingleton
  Map<String, String> get headers => NetworkConstants.headers;

  @lazySingleton
  Dio get dio => Dio()
    ..interceptors.add(dioLoggingInterceptor)
    ..interceptors.add(AuthInterceptor())
    ..options.headers = headers;

  @Named("baseURL")
  @injectable
  String get baseURL => "${environment["BASE_URL"]}";
}
