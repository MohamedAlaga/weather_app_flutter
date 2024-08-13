import 'package:flutter/material.dart';
import 'package:weather_app_2/data/cities_data.dart';

/// A class that provides the search functionality for cities using Provider.
class CityProvider extends ChangeNotifier
{
  List<String> queryResult = citiesList;

  /// A method that searches for a city in the list of cities.
  /// 
  /// Parameters:
  /// - [cityName]: The name of the city to search for.
  void searchCity(String cityName) {
    queryResult = citiesList.where((tempCity) {
      final city = tempCity.toLowerCase();
      final searchCity = cityName.toLowerCase();
      return city.contains(searchCity);
    }).toList();
    notifyListeners();
  }
}
