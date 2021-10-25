import 'dart:convert';


import 'package:ticket_box/src/common/endpoints.dart';
import 'package:ticket_box/src/models/group.dart';
import 'package:ticket_box/src/common/constants.dart';
import 'package:http/http.dart' as http;

class GroupService {
  static String URL = Constants.baseUrl + Endpoints.groups;
  //events api

  static List<Group>? parseGroup(String responseBody) {
    List jsonResponse = json.decode(responseBody);
      return jsonResponse.map((data) =>Group.fromJson(data)).toList();
  }

  static Future<List<Group>?> getAllGroup() async {
    final response = await http.get(Uri.parse(URL));
    if (response.statusCode == 200) {
      var parseGroupList = parseGroup(response.body);
      return parseGroupList;
    } else {
      throw Exception(response.statusCode);
    }
  }
}
