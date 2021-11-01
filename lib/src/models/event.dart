import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:ticket_box/src/models/booking.dart';
import 'package:ticket_box/src/models/group.dart';
import 'package:ticket_box/src/models/ticket.dart';

class Event {
  int? eventId;
  String? eventName;
  int? groupId;
  String? location;
  int? approvalState;
  String? imageUrl;
  bool? isDeleted;
  DateTime? timeOccur;
  bool? isExpired;
  DateTime? createDate;
  DateTime? modifyDate;
  double? price;
  String? description;
  int? paymentMethodId;

  Group? group;
  String? groupName;
  
  List<Ticket>? tickets;
  int? numberOfTickets;

  List<Booking>? bookings;
  int? numberOfBookings;

  Event({
    this.eventId,
    this.eventName,
    this.groupId,
    this.location,
    this.approvalState,
    this.imageUrl,
    this.isDeleted,
    this.timeOccur,
    this.isExpired,
    this.createDate,
    this.modifyDate,
    this.price,
    this.description,
    this.paymentMethodId
  });

  factory Event.fromRawJson(String str) => Event.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  Event.fromJson(Map<String, dynamic> json) {
    eventId = json["eventId"];
    eventName = json["eventName"];
    groupId = json["groupId"];
    location = json["location"];
    approvalState = json["approvalState"];
    imageUrl = json["imageUrl"];
    isDeleted = json["isDeleted"];
    timeOccur = DateTime.parse(json["timeOccur"]);
    isExpired = json["isExpired"];
    createDate = DateTime.parse(json["createDate"]);
    modifyDate = DateTime.parse(json["modifyDate"]);
    price = json["price"] == null ? null : json["price"];
    description= json["description"];
    paymentMethodId= json["paymentMethodId"];


    group = json["group"] == null ? null : Group.fromJson(json["group"]);
    groupName = group == null ? null : group!.groupName;
    tickets= json["tickets"] == null ? null : List<Ticket>.from(json["tickets"].map((x) => Ticket.fromJson(x)));
    numberOfTickets = tickets!.length;
    bookings= json["bookings"] == null ? null : List<Booking>.from(json["bookings"].map((x) => Booking.fromJson(x)));
    numberOfBookings = bookings!.length;
  }

  Map<String, dynamic> toJson() => {
        "eventId": eventId,
        "eventName": eventName,
        "groupId": groupId,
        "location": location,
        "approvalState": approvalState,
        "imageUrl": imageUrl,
        "isDeleted": isDeleted,
        "timeOccur": timeOccur!.toIso8601String(),
        "isExpired": isExpired,
        "createDate": createDate!.toIso8601String(),
        "modifyDate": modifyDate!.toIso8601String(),
        "price": price,
      };
}

String parseDate(String? datetime) {
  DateTime dt = DateTime.parse(datetime!);
  String formattedDate = DateFormat('dd/MM/yyyy').format(dt);
  return formattedDate;
}

int compareDate(DateTime? timeOccur, d2) {
  //DateTime d1 = DateTime.parse(timeOccur!);
  //final formatter = DateFormat('dd/MM/yyyy');
  return timeOccur!.compareTo(d2);
}

String parseDate2(String? datetime) {
  DateTime dt = DateTime.parse(datetime!);
  String formattedDate = DateFormat('hh:mm dd MMM, yyyy').format(dt);
  return formattedDate;
}

class Events {
  List<Event>? eventList;

  Events.fromjson(Map<String, dynamic> json) {
    var list = json as List;
    print('decoding done');
    List<Event> events = list.map((e) => Event.fromJson(e)).toList();
    this.eventList = events;
  }
}
