import 'package:json_annotation/json_annotation.dart';

part 'role.g.dart';

@JsonSerializable()
class Role {
  final int? roleId;
  final String? rolename;

  factory Role.fromJson(Map<String, dynamic> json) =>
      _$RoleFromJson(json);

  Role({
    this.roleId,
    this.rolename,
  });

  Map<String, dynamic> toJson() => _$RoleToJson(this);
}
