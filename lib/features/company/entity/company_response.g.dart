// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyResponse _$CompanyResponseFromJson(Map<String, dynamic> json) =>
    CompanyResponse()
      ..status_code = json['status_code'] as String?
      ..status_message = json['status_message'] as String?
      ..company_list = json['company_list'] == null
          ? null
          : CompanyList.fromJson(json['company_list'] as Map<String, dynamic>);

Map<String, dynamic> _$CompanyResponseToJson(CompanyResponse instance) =>
    <String, dynamic>{
      'status_code': instance.status_code,
      'status_message': instance.status_message,
      'company_list': instance.company_list,
    };
