import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable()
class ApiResponse {
  int? statusCode;
  bool? isSuccess;
  String? message;
  dynamic body;

  ApiResponse({
    this.statusCode,
    this.isSuccess,
    this.message,
    this.body,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return _$ApiResponseFromJson(json);
  }
  toJson() => _$ApiResponseToJson(this);
}
