// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_company_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewCompanyResponse _$NewCompanyResponseFromJson(Map<String, dynamic> json) =>
    NewCompanyResponse()
      ..status_code = json['status_code'] as String?
      ..status_message = json['status_message'] as String?;

Map<String, dynamic> _$NewCompanyResponseToJson(NewCompanyResponse instance) =>
    <String, dynamic>{
      'status_code': instance.status_code,
      'status_message': instance.status_message,
    };
