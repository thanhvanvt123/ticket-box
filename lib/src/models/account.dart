import 'package:json_annotation/json_annotation.dart';
import 'package:ticket_box/src/models/booking.dart';
import 'package:ticket_box/src/models/role.dart';
import 'package:ticket_box/src/models/user_fcmtokens.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  final int? userId, roleId;
  final String? fullName, avatarUrl, email, phone;
  final bool? isDeleted;
  final DateTime? createDate, modifyDate;
  final Role? role;
  final Booking? booking;
  final UserFcmtokens? userFcmtokens;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Account({
    this.roleId,
    this.userId,
    this.fullName,
    this.avatarUrl,
    this.email,
    this.phone,
    this.role,
    this.booking,
    this.userFcmtokens,
    this.modifyDate,
    this.createDate,
    this.isDeleted
  });

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
