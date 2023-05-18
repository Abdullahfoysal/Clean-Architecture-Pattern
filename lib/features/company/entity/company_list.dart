import 'package:company/features/company/entity/data.dart';
import 'package:json_annotation/json_annotation.dart';

import 'links.dart';

part 'company_list.g.dart';

@JsonSerializable()
class CompanyList {
  int? current_page;
  List<Data>? data;
  String? first_page_url;
  int? from;
  int? last_page;
  String? last_page_url;
  List<Links>? links;
  String? next_page_url;
  String? path;
  int? per_page;
  dynamic prev_page_url;
  int? to;
  int? total;

  CompanyList();
  factory CompanyList.fromJson(Map<String, dynamic> json) {
    return _$CompanyListFromJson(json);
  }
  toJson() => _$CompanyListToJson(this);
}
