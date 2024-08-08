/// A class representing a day's weather information.
///
/// The `Days` class contains information about the day, including the name of
/// the day, images representing weather conditions, and temperature degrees.
///
/// Attributes:
/// - `day` (String): The name of the day (e.g., "Monday").
/// - `image1` (String): The URL or path to the first weather condition image.
/// - `image2` (String): The URL or path to the second weather condition image.
/// - `degree1` (String): The temperature degree for the first condition.
/// - `degree2` (String): The temperature degree for the second condition.

class Days {
  Days({
    required this.day,
    required this.image1,
    required this.image2,
    required this.degree1,
    required this.degree2,
  });
  String day;
  String image1;
  String image2;
  String degree1;
  String degree2;
}
