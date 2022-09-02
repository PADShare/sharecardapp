import 'package:json_annotation/json_annotation.dart';

part 'assessment_one.g.dart';

@JsonSerializable()
class AssessmentOne{
  AssessmentOne(this.assessemt_question,this.assessment_user_response_answer);

  String assessemt_question;
  String assessment_user_response_answer;

  factory AssessmentOne.fromJson(Map<String,dynamic> json) => _$AssessmentOneFromJson(json);
  Map<String, dynamic> toJson() => _$AssessmentOneToJson(this);
}
