import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:meme_generator/config/config.dart';

class FetchMeme {
  static fetchMeme() async {
    Response response = await http.get(Uri.parse(Config.baseUrl));
    if (response.statusCode == 200) {
      Map bodyData = jsonDecode(response.body);
      // print(bodyData);
      // print(bodyData["url"]);
      return bodyData["url"];
    } else {
      print("Failed To get meme");
      throw Exception("Failed To get meme");
    }
  }
}
