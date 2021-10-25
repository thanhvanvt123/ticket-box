// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
    roleId: json['roleId'] as int?,
    userId: json['userId'] as int?,
    email: json['email'] as String?,
    phone: json['phone'] as String?,
    fullName: json['fullname'] as String?,
    avatarUrl: json['avatarUrl'] as String?,
    isDeleted: json['isDeleted'] as bool?,
    createDate: json['createDate'] == null
        ? null
        : DateTime.parse(json['createDate'] as String),
    modifyDate: json['modifyDate'] == null
        ? null
        : DateTime.parse(json['modifyDate'] as String),
  );
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'roleId': instance.roleId,
      'userId': instance.userId,
      'fullName': instance.fullName,
      'avatarUrl': instance.avatarUrl,
      'modifyDate': instance.modifyDate,
      'email': instance.email,
      'phone': instance.phone,
      'createDate': instance.createDate,
      'isDeleted': instance.isDeleted,
      'role': instance.role,
      'bookings': instance.booking,
      'userFcmtokens': instance.userFcmtokens
    };
