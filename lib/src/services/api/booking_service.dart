import 'dart:convert';

import 'package:ticket_box/src/common/endpoints.dart';
import 'package:ticket_box/src/common/constants.dart';
import 'package:ticket_box/src/models/booking.dart';
import 'package:http/http.dart' as http;

class BookingService {
  static String URL = Constants.baseUrl + Endpoints.bookings;
  //events api

  static List<Booking>? parseBookings(String responseBody) {
    List jsonResponse = json.decode(responseBody);
    return jsonResponse.map((data) => Booking.fromJson(data)).toList();
  }

  static Future<List<Booking>?> getAllBooking(int userId) async {
    final response = await http.get(Uri.parse(URL));
    if (response.statusCode == 200) {
      var parseBookingList = parseBookings(response.body);
      List<Booking> temp = List.empty(
          growable:
              true); //temp list for Booking list, trying to add user's booking only
      for (var booking in parseBookingList!) {
        if (booking.userId == userId) {
          temp.add(booking);
        }
      }
      return temp;
    } else {
      throw Exception(response.statusCode);
    }
  }

  static Future<Booking>? getBookingById(int bookingId) async {
    final response = await http.get(Uri.parse(URL + '/$bookingId'));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var parseBooking = Booking.fromJson(jsonResponse);
      return parseBooking;
      
    } else {
      throw Exception(response.statusCode);
    }
  }
}
