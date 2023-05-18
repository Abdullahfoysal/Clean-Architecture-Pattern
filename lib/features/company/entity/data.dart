import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  int? id;
  String? company_name;
  String? email;
  String? password;
  String? phone;
  String? created_at;
  String? updated_at;
  Data();
  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }
  toJson() => _$DataToJson(this);
}
