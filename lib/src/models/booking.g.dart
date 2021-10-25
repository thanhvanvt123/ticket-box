// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Booking _$BookingFromJson(Map<String, dynamic> json) {
  return Booking(
    bookingId: json['bookingId'] as int?,
    userId: json['userId'] as String?,
    quantity: json['quantity'] as int?,
    total: json['total'] as double?,
    isSuccess: json['isSuccess'] as bool?,
    paymentMethodId: json['paymentMethodId'] as int?,
    createDate: json['createDate'] == null
        ? null
        : DateTime.parse(json['createDate'] as String),
    // paymentMethod: json['paymentMethod'] == null
    //     ? null
    //     : PaymentMethod.fromJson(json['paymentMethod'] as Map<String, dynamic>),
    user: json['user'] == null
        ? null
        : Account.fromJson(json['user'] as Map<String, dynamic>),
    // ticket: json['tickets'] == null
    //     ? null
    //     : Ticket.fromJson(json['tickets'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BookingToJson(Booking instance) => <String, dynamic>{
      'bookingId': instance.bookingId,
      'userId': instance.userId,
      'quantity': instance.quantity,
      'total': instance.total,
      'createDate': instance.createDate,
      'paymentMethodId': instance.paymentMethodId,
      // 'paymentMethod': instance.paymentMethod,
      'user': instance.user,
      // 'tickets': instance.ticket,
    };
