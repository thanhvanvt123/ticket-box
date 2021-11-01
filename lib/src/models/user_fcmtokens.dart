import 'package:json_annotation/json_annotation.dart';

part 'user_fcmtokens.g.dart';

@JsonSerializable()
class UserFcmtokens {
  final int? userFcmid;
  final String? fcmtoken,userId;

  factory UserFcmtokens.fromJson(Map<String, dynamic> json) =>
      _$UserFcmtokensFromJson(json);

  UserFcmtokens({
    this.userFcmid,
    this.fcmtoken,
    this.userId,
  });

  Map<String, dynamic> toJson() => _$UserFcmtokensToJson(this);
}
