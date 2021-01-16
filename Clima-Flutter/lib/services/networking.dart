import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(url);

    // http.Response response = await http.get(
    // 'https://api.openweathermap.org/data/2.5/weather?lat=37.4219044&lon=-122.0840301&appid=a54716ee2ed06b2e93260e792dd5b786');

    print("http method was called");
    print(response.statusCode == 200);
    print(response.body);

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
