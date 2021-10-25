// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_fcmtokens.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserFcmtokens _$UserFcmtokensFromJson(Map<String, dynamic> json) {
  return UserFcmtokens(
    userFcmid: json['userFcmid'] as int?,
    fcmtoken: json['fcmtoken'] as String?,
    userId: json['userId'] as String?,
  );
}

Map<String, dynamic> _$UserFcmtokensToJson(UserFcmtokens instance) => <String, dynamic>{
      'userFcmid': instance.userFcmid,
      'fcmtoken': instance.fcmtoken,
      'userId': instance.userId,
    };
