// To parse this JSON data, do
//
//     final ticket = ticketFromJson(jsonString);

import 'dart:convert';

import 'package:ticket_box/src/models/event.dart';

class Ticket {
int? ticketId;
    int? eventId;
    DateTime? createDate;
    DateTime? modifyDate;
    bool? isExpired;
    int? bookingId;

    Event? event;
    Ticket({
        this.ticketId,
        this.eventId,
        this.createDate,
        this.modifyDate,
        this.isExpired,
        this.bookingId,
    });

    

    factory Ticket.fromRawJson(String str) => Ticket.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

     Ticket.fromJson(Map<String, dynamic> json) {
        ticketId= json["ticketId"];
        eventId= json["eventId"];
        createDate= DateTime.parse(json["createDate"]);
        modifyDate= json["modifyDate"] == null ? null :  DateTime.parse(json["modifyDate"]);
        isExpired= json["isExpired"];
        bookingId= json["bookingId"];

        event= json["event"] == null ? null : Event.fromJson(json["event"]);
    }

    Map<String, dynamic> toJson() => {
        "ticketId": ticketId,
        "eventId": eventId,
        "createDate": createDate!.toIso8601String(),
        "modifyDate": modifyDate!.toIso8601String(),
        "isExpired": isExpired,
        "bookingId": bookingId,
    };
}
