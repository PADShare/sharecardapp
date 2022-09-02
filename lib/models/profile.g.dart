// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return Profile(
    json['agent_id'] as int,
    json['agent_name'] as String,
    json['agent_address'] as String,
    json['agent_contact'] as String,
    json['profile_pic'] as String,
  );
}

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'agent_id': instance.agent_id,
      'agent_name': instance.agent_name,
      'agent_address': instance.agent_address,
      'agent_contact': instance.agent_contact,
      'profile_pic': instance.profile_pic,
    };
