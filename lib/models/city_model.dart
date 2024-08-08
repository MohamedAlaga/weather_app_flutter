import 'package:intl/intl.dart';
import 'package:weather_app_2/models/days_model.dart';
import 'package:weather_app_2/models/hour_model.dart';
/// A class representing a city's weather information (all data required for a screen).
/// 
/// The `City` class contains information about the city, including the week's weather
/// forecast, today's weather forecast, the region, the maximum and minimum temperatures,
/// the current temperature, and the weather condition.
/// 
/// attributes:
/// - `week` (List<Days>): A list of `Days` objects representing the week's weather forecast.
/// - `todayForcasting` (List<Hours>): A list of `Hours` objects representing next 8 hours forcast.
/// - `region` (String): The region of the city (e.g., "cairo, egypt").
/// - `max` (double): The maximum temperature for the day.
/// - `min` (double): The minimum temperature for the day.
/// - `now` (double): The current temperature.
/// - `condition` (String): The weather condition (e.g., "clear").
class City {
  List<Days> week = [];
  List<Hours> todayForcasting = [];
  String region = "";
  double max = 0;
  double min = 0;
  double now = 0;
  String condition ;

  City({
    required this.week,
    required this.todayForcasting,
    required this.max,
    required this.min,
    required this.now,
    required this.region,
    required this.condition,
  });
/// A method that returns the path to the weather condition image.
/// 
/// parameters:
/// condtion (String): The weather condition (e.g., "clear").
  static String getAssetPath(String condition) {
    switch (condition.toLowerCase()) {
      case 'clear':
        return 'assets/images/Sunny.png';
      case 'cloudy':
        return 'assets/images/Cloudy-clear-day.png';
      case 'partly cloudy':
        return 'assets/images/Partly-cloudy.png';
      case 'partly cloudy night':
        return 'assets/images/Partly-cloudy-night.png';
      case 'clear night':
        return 'assets/images/Cloudy-clear-night.png';
      default:
        return 'assets/images/Sunny.png';
    }
  }
/// A method that returns a `City` object from a JSON object.
/// 
/// parameters:
/// json (Map<String, dynamic>): A JSON object representing the city's weather information.
/// 
/// notes : no need for instance of the class to call it.
  static City fromJson(Map<String, dynamic> json) {
    int H = int.parse(DateFormat.H().format(DateTime.now()))+1;
    List<Days> week = [];
    List<Hours> todayForcasting = [];
    double max = json['forecast']['forecastday'][0]['day']['maxtemp_c'];
    double min = json['forecast']['forecastday'][0]['day']['mintemp_c'];
    double now = json['current']['temp_c'];
    String region = "${json['location']['name']}, ${json['location']['country']}";
    String condition = json['current']['condition']['text'];
    for (var dayData in json['forecast']['forecastday']) {
      final day = Days(
        day: DateFormat.EEEE().format(DateTime.parse(dayData['date'])),
        image1: getAssetPath(dayData['day']['condition']['text']),
        image2: getAssetPath(dayData['day']['condition']['text']),
        degree1: dayData['day']['maxtemp_c'].toString(),
        degree2: dayData['day']['mintemp_c'].toString(),
      );
      week.add(day);
    }
    for (var i = H; i < H+8; i++) {
      int realHour = 0;
      int realday = 0;
      if (i > 23) {
        realHour = i - 24;
        realday = 1;
      } else {
        realHour = i;
      }
      var hourData = json['forecast']['forecastday'][realday]['hour'][realHour];
      final hour = Hours(
        time: DateFormat.Hm().format(DateTime.parse(hourData['time'])),
        image: getAssetPath(hourData['condition']['text']),
        degree: hourData['temp_c'].toString(),
      );
      todayForcasting.add(hour);
    }
    return City(
      week: week,
      todayForcasting: todayForcasting,
      max: max,
      min: min,
      now: now,
      region: region,
      condition: condition,
    );
  }
}