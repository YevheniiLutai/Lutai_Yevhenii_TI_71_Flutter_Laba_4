import 'dart:convert';

import 'package:http/http.dart' as http;
import 'person.dart';

const String randomPersonURL = "https://randomuser.me/api/";

class PersonNetworkService {
  Future<List<Person>> fetchPersons(int amount) async {
    http.Response response = await http.get("$randomPersonURL?results=$amount");

    if (response.statusCode == 200) {
      Map peopleData = jsonDecode(response.body) as Map;
      List<dynamic> peoples = peopleData["results"] as List;
      return peoples.map((json) => Person.fromJson(json)).toList();
    } else {
      throw Exception("Something gone wrong, ${response.statusCode}");
    }
  }
}
