import 'package:http/http.dart' as http;
import 'dart:convert';

class Networkhelper {
  Networkhelper({this.longitude, this.latitude, this.cityName});

  final double longitude;
  final double latitude;
  final String cityName;
  final String apiKey = 'a34cd42dd745031b8bbf47186059b407';

  Future getDataCoords() async {
    var httpsUrl = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

    http.Response response = await http.get(httpsUrl);

    response.statusCode == 200
        ? print('API request complete')
        : print("Statuscode failed " + response.statusCode.toString());

    return jsonDecode(response.body);
  }

  Future getDataByCityName() async {
    var httpsUrl = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');
    http.Response response = await http.get(httpsUrl);

    response.statusCode == 200
        ? print('API request complete')
        : print("Statuscode failed " + response.statusCode.toString());

    return jsonDecode(response.body);
  }
}
