import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spacex_missions/models/spacex_model.dart';

class Services {
  final String url = 'https://api.spacexdata.com/v4/launches/latest';
  Future<Spacex> getDetailsApi() async {
    var response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return Spacex.fromJson(data);
    } else {
      return Spacex.fromJson(data);
    }
  }
}