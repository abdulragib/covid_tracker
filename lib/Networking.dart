// ignore: file_names
// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;

class data{
  Future getData() async {
   http.Response response = await http.get(Uri.parse("https://api.rootnet.in/covid19-in/stats/latest"));
    return jsonDecode(response.body);
  }

  Future getCountryData() async
  {
    http.Response response = await http.get(Uri.parse("https://corona.lmao.ninja/v2/countries"),);
    return jsonDecode(response.body);
  }

  Future getSummryData() async {
    http.Response response = await http.get(Uri.parse("https://corona.lmao.ninja/v2/all"));
    return jsonDecode(response.body);
  }
}

