import 'package:json_annotation/json_annotation.dart';

part 'packages.g.dart';

@JsonSerializable()
class Packages {
  Packages(this.id,this.user_id,this.company_id,this.name,this.quantity,this.category);
  int id;
  int user_id;
  int company_id;
  String name;
  int quantity;
  String category;

  factory Packages.fromJson(Map<String,dynamic> json) => _$PackagesFromJson(json);
  Map<String, dynamic> toJson() => _$PackagesToJson(this);
}
