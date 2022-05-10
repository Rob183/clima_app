import 'package:http/http.dart' as http;
import 'dart:convert';

class Networkhelper {
  Networkhelper({this.longitude, this.latitude});

  final double longitude;
  final double latitude;

  Future getData() async {
    var httpsUrl = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=a34cd42dd745031b8bbf47186059b407&units=metric');

    http.Response response = await http.get(httpsUrl);

    response.statusCode == 200
        ? print(response.body)
        : print("Statuscode failed " + response.statusCode.toString());

    return jsonDecode(response.body);
  }
}
