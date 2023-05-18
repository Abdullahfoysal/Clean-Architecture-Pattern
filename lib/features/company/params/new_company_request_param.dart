import 'package:json_annotation/json_annotation.dart';

part 'new_company_request_param.g.dart';

@JsonSerializable()
class NewCompanyReqParam {
  String? company_name;
  String? email;
  String? password;
  String? phone;

  NewCompanyReqParam();
  factory NewCompanyReqParam.fromJson(Map<String, dynamic> json) {
    return _$NewCompanyReqParamFromJson(json);
  }
  toJson() => _$NewCompanyReqParamToJson(this);
}
