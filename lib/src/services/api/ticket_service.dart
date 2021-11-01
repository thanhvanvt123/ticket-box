import 'dart:convert';

import 'package:ticket_box/src/common/endpoints.dart';
import 'package:ticket_box/src/common/constants.dart';
import 'package:http/http.dart' as http;
import 'package:ticket_box/src/models/ticket.dart';

class TicketService {
  static String URL = Constants.baseUrl + Endpoints.tickets;
  //events api

  static List<Ticket>? parseBookings(String responseBody) {
    List jsonResponse = json.decode(responseBody);
    return jsonResponse.map((data) => Ticket.fromJson(data)).toList();
  }

  static Future<List<Ticket>?> getAllTickets(int bookingId) async {
    final response = await http.get(Uri.parse(URL));
    if (response.statusCode == 200) {
      var parseBookingList = parseBookings(response.body);
      List<Ticket> temp = List.empty(
          growable:
              true); //temp list for ticket list of a specific booking
      for (var ticket in parseBookingList!) {
        if (ticket.bookingId == bookingId) {
          temp.add(ticket);
        }
      }
      return temp;
    } else {
      throw Exception(response.statusCode);
    }
  }

  // static Future<Booking>? getBookingById(int bookingId) async {
  //   final response = await http.get(Uri.parse(URL + '/$bookingId'));
  //   if (response.statusCode == 200) {
  //     var jsonResponse = json.decode(response.body);
  //     var parseBooking = Booking.fromJson(jsonResponse);
  //     return parseBooking;
      
  //   } else {
  //     throw Exception(response.statusCode);
  //   }
  // }
}
