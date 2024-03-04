import 'dart:convert';

import 'package:http/http.dart' as http;
class NetworkHandler{
  Future get() async {
    var url = "https://internshala.com/flutter_hiring/search";

    final uri = Uri.parse(url);
    var response = await http.get(
      uri,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    }
  }
}