import 'package:http/http.dart' as http;
import 'package:weather_app_2/data/env.dart';
import 'package:weather_app_2/models/city_model.dart';
import 'dart:convert';

/// Retrieves city data using vity name.
///
/// Parameters:
///   - city: the name of the city to be found.
///
/// Returns:
///   - A JSON string containing the city data if successful.
///   - error if successful.

Future<City> getcityController(String city) async {
  try {
    var cityData = await http.get(
      Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?days=6&q=$city&key=$appKey&solar=no&wind100mph=no',
      ),
    ).timeout(const Duration(seconds: 5));

    if (cityData.statusCode != 200) {
      throw Exception("Error fetching weather data");
    }

    final jsonData = json.decode(cityData.body);
    return City.fromJson(jsonData);
  } catch (e) {
    throw Exception("Error: $e");
  }
}