// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data()
  ..id = json['id'] as int?
  ..company_name = json['company_name'] as String?
  ..email = json['email'] as String?
  ..password = json['password'] as String?
  ..phone = json['phone'] as String?
  ..created_at = json['created_at'] as String?
  ..updated_at = json['updated_at'] as String?;

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'company_name': instance.company_name,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
