// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Training _$TrainingFromJson(Map<String, dynamic> json) {
  return Training(
    json['id'] as int,
    json['training_id'] as String,
    json['user_id'] as int,
    json['training_name'] as String,
    json['training_description'] as String,
    json['no_of_beneficiaries'] as int,
    json['form'] as List,
  );
}

Map<String, dynamic> _$TrainingToJson(Training instance) => <String, dynamic>{
      'id': instance.id,
      'training_id': instance.training_id,
      'user_id': instance.user_id,
      'training_name': instance.training_name,
      'training_description': instance.training_description,
      'no_of_beneficiaries': instance.no_of_beneficiaries,
      'form': instance.form,
    };
