// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessment_one.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssessmentOne _$AssessmentOneFromJson(Map<String, dynamic> json) {
  return AssessmentOne(
    json['assessemt_question'] as String,
    json['assessment_user_response_answer'] as String,
  );
}

Map<String, dynamic> _$AssessmentOneToJson(AssessmentOne instance) =>
    <String, dynamic>{
      'assessemt_question': instance.assessemt_question,
      'assessment_user_response_answer':
          instance.assessment_user_response_answer,
    };
