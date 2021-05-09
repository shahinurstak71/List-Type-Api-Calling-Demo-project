import 'dart:convert';

import 'package:ecom_ui/models/requis_api_model.dart';
import 'package:http/http.dart' as http;

class Services {
  Future<List<PostData>> fetchServer() async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = (json.decode(response.body) as List)
          .map((data) => PostData.fromJson(data))
          .toList();

      return jsonData;
    }
    return null;
  }
}
