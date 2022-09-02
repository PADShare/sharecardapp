import 'package:json_annotation/json_annotation.dart';

part 'trainings.g.dart';

@JsonSerializable()
class Training {

  int id;
  String training_id;
  int user_id;
  String training_name;
  String training_description;
  int no_of_beneficiaries;
  List form;

  Training(this.id,this.training_id, this.user_id,this.training_name, this.training_description, this.no_of_beneficiaries,this.form);


  factory Training.fromJson(Map<String,dynamic> json) => _$TrainingFromJson(json);
  Map<String, dynamic> toJson() => _$TrainingToJson(this);
}
