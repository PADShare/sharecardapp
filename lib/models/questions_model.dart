import 'package:json_annotation/json_annotation.dart';

part 'questions_model.g.dart';

@JsonSerializable()
class Questions_model {
    Questions_model(this.agent_id,this.question_id, this.beneficiary_uid,this.answer);

    String question_id;
    String beneficiary_uid;
    String agent_id;
    String answer;
    
    factory Questions_model.fromJson(Map<String,dynamic> json) => _$Questions_modelFromJson(json);
    Map<String, dynamic> toJson() => _$Questions_modelToJson(this);
}
