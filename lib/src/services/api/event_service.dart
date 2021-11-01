import 'dart:convert';

import 'package:ticket_box/src/common/endpoints.dart';
import 'package:ticket_box/src/common/constants.dart';
import 'package:ticket_box/src/models/event.dart';
import 'package:http/http.dart' as http;

class EventService {
  static String URL = Constants.baseUrl + Endpoints.events;
  //events api

  static List<Event>? parseEvent(String responseBody) {
    List jsonResponse = json.decode(responseBody);
    return jsonResponse.map((data) => Event.fromJson(data)).toList();
  }

  static Future<List<Event>?> getAllEvent(String search) async {
    print('search value'+search);
    int groupId;
    try {
      groupId = int.parse(search);
      final response = await http.get(Uri.parse(URL));
      if (response.statusCode == 200) {
        var parseEventList = parseEvent(response.body);
        List<Event> temp = List.empty(
            growable:
                true); //temp list for Event list, trying to remove expired events
        for (var evt in parseEventList!) {
          print(evt.eventName);
          if ((evt.isExpired == false) & (evt.isDeleted == false)) {
            if (evt.groupId == groupId) temp.add(evt);
          }
        }
        return temp;
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      final response = await http.get(Uri.parse(URL + "/$search"));
      if (response.statusCode == 200) {

        var parseEventList = parseEvent(response.body);
        print('>>>>search sucess with $parseEventList.length');
        List<Event> temp = List.empty( growable:true); //temp list for Event list, trying to remove expired events
        for (var evt in parseEventList!) {
          print(evt.eventName);
          if ((evt.isExpired == false) & (evt.isDeleted == false)) {
            temp.add(evt);
          }
        }
        return temp;
      } else {
        throw Exception(response.statusCode);
      }
    }
  }
}
