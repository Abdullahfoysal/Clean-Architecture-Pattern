import 'package:json_annotation/json_annotation.dart';

part 'new_company_response.g.dart';

@JsonSerializable()
class NewCompanyResponse {
  String? status_code;
  String? status_message;

  NewCompanyResponse();
  factory NewCompanyResponse.fromJson(Map<String, dynamic> json) {
    return _$NewCompanyResponseFromJson(json);
  }
  toJson() => _$NewCompanyResponseToJson(this);
}
