import 'dart:convert';

import 'package:ticket_box/src/models/event.dart';
import 'package:ticket_box/src/models/paymentMethod.dart';
import 'package:ticket_box/src/models/ticket.dart';

class Booking {
    Booking({
        this.bookingId,
        this.userId,
        this.quantity,
        this.total,
        this.isSuccess,
        this.createDate,
        this.paymentMethodId,
        this.eventId
    });

    int? bookingId;
    int? userId;
    int? quantity;
    double? total;
    bool? isSuccess;
    DateTime? createDate;
    int? paymentMethodId;
    int? eventId;

    Event? event;
    String? eventName;
    PaymentMethod? paymentMethod;
    List<Ticket>? tickets;

    factory Booking.fromRawJson(String str) => Booking.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

     Booking.fromJson(Map<String, dynamic> json) {
        bookingId= json["bookingId"];
        userId= json["userId"];
        quantity= json["quantity"];
        total= json["total"];
        isSuccess= json["isSuccess"];
        createDate= DateTime.parse(json["createDate"]);
        paymentMethodId= json["paymentMethodId"];
        eventId= json["eventId"];

        event= json["event"] == null ? null : Event.fromJson(json["event"]);
        eventName = event == null ? null : event!.eventName;
        paymentMethod= json["paymentMethod"] == null ? null : PaymentMethod.fromJson(json["paymentMethod"]);
        tickets= json["tickets"] == null ? null : List<Ticket>.from(json["tickets"].map((x) => Ticket.fromJson(x)));
    }

    Map<String, dynamic> toJson() => {
        "bookingId": bookingId,
        "userId": userId,
        "quantity": quantity,
        "total": total,
        "isSuccess": isSuccess,
        "createDate": createDate!.toIso8601String(),
        "paymentMethodId": paymentMethodId,
        "eventId": eventId
    };
}