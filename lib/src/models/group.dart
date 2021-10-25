import 'dart:convert';

class Group {
    Group({
        this.groupId,
        this.groupImageUrl,
        this.isDeleted,
        this.groupName,
        this.createDate,
        this.modifyDate,
    });

    int? groupId;
    String? groupImageUrl;
    bool? isDeleted;
    String? groupName;
    DateTime? createDate;
    DateTime? modifyDate;

    factory Group.fromRawJson(String str) => Group.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Group.fromJson(Map<String, dynamic> json) => Group(
        groupId: json["groupId"],
        groupImageUrl: json["groupImageUrl"],
        isDeleted: json["isDeleted"],
        groupName: json["groupName"],
        createDate: DateTime.parse(json["createDate"]),
        modifyDate: DateTime.parse(json["modifyDate"]),
    );

    Map<String, dynamic> toJson() => {
        "groupId": groupId,
        "groupImageUrl": groupImageUrl,
        "isDeleted": isDeleted,
        "groupName": groupName,
        "createDate": createDate!.toIso8601String(),
        "modifyDate": modifyDate!.toIso8601String(),
    };
}
