import 'package:json_annotation/json_annotation.dart';
import 'package:ticket_box/src/models/account.dart';

part 'booking.g.dart';

@JsonSerializable()
class Booking {
  final int? bookingId, quantity,paymentMethodId;
  final String? userId;
  final double? total;
  final bool? isSuccess;
  final DateTime? createDate;
  final Account? user;
  // final PaymentMethod? paymentMethod;
  // final Ticket? ticket;


  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);

  Booking({
    this.bookingId,
    this.userId,
    this.total,
    this.quantity,
    this.paymentMethodId,
    this.createDate,
    this.isSuccess,
    this.user,
    // this.paymentMethod,
    // this.ticket
  });

  Map<String, dynamic> toJson() => _$BookingToJson(this);
}
