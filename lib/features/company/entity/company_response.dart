import 'package:json_annotation/json_annotation.dart';

import 'company_list.dart';

part 'company_response.g.dart';

@JsonSerializable()
class CompanyResponse {
  String? status_code;
  String? status_message;
  CompanyList? company_list;

  CompanyResponse();
  factory CompanyResponse.fromJson(Map<String, dynamic> json) {
    return _$CompanyResponseFromJson(json);
  }
  toJson() => _$CompanyResponseToJson(this);
}
