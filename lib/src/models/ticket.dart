// To parse this JSON data, do
//
//     final ticket = ticketFromJson(jsonString);

import 'dart:convert';

class Ticket {
    Ticket({
        this.ticketId,
        this.eventId,
        this.createDate,
        this.modifyDate,
        this.isExpired,
        this.bookingId,
    });

    String? ticketId;
    int? eventId;
    DateTime? createDate;
    DateTime? modifyDate;
    bool? isExpired;
    int? bookingId;

    factory Ticket.fromRawJson(String str) => Ticket.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        ticketId: json["ticketId"],
        eventId: json["eventId"],
        createDate: DateTime.parse(json["createDate"]),
        modifyDate: DateTime.parse(json["modifyDate"]),
        isExpired: json["isExpired"],
        bookingId: json["bookingId"],
    );

    Map<String, dynamic> toJson() => {
        "ticketId": ticketId,
        "eventId": eventId,
        "createDate": createDate!.toIso8601String(),
        "modifyDate": modifyDate!.toIso8601String(),
        "isExpired": isExpired,
        "bookingId": bookingId,
    };
}
