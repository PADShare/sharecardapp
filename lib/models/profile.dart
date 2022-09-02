import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  Profile(this.agent_id,this.agent_name,this.agent_address,this.agent_contact,this.profile_pic);

  int agent_id;
  String agent_name;
  String agent_address;
  String agent_contact;
  String profile_pic;

  factory Profile.fromJson(Map<String,dynamic> json) => _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
