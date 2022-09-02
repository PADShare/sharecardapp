// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Questions_model _$Questions_modelFromJson(Map<String, dynamic> json) {
  return Questions_model(
    json['agent_id'] as String,
    json['question_id'] as String,
    json['beneficiary_uid'] as String,
    json['answer'] as String,
  );
}

Map<String, dynamic> _$Questions_modelToJson(Questions_model instance) =>
    <String, dynamic>{
      'question_id': instance.question_id,
      'beneficiary_uid': instance.beneficiary_uid,
      'agent_id': instance.agent_id,
      'answer': instance.answer,
    };
