// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Packages _$PackagesFromJson(Map<String, dynamic> json) {
  return Packages(
    json['id'] as int,
    json['user_id'] as int,
    json['company_id'] as int,
    json['name'] as String,
    json['quantity'] as int,
    json['category'] as String,
  );
}

Map<String, dynamic> _$PackagesToJson(Packages instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'company_id': instance.company_id,
      'name': instance.name,
      'quantity': instance.quantity,
      'category': instance.category,
    };
