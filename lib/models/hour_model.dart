///Class represent hour of the day (tempreture of each hour and image of the weather)
///
///The `Hours` class contains information about the hour, including the name of
///the hour, images representing weather conditions, and temperature degrees.
///
/// Attributes:
/// - `time` (String): The name of the hour (e.g., "18:00").
/// - `image` (String): The URL or path to the weather condition image.
/// - `degree` (String): The temperature degree for the first condition.
class Hours {
 String time;
 String image;
 String degree;
  Hours({
    required this.time,
    required this.image,
    required this.degree,
  });
}