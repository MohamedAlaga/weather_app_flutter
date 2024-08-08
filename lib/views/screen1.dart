import 'package:flutter/material.dart';
import 'package:weather_app_2/models/city_model.dart';
import 'package:weather_app_2/views/components.dart';
import 'package:weather_app_2/views/search_screen.dart';

class CityScreen extends StatelessWidget {
  const CityScreen({super.key, required this.city, required this.search});
  final City city;
  final bool search;

  @override
  Widget build(BuildContext context) {
    String backgroundImage = "";
    if (city.condition.toLowerCase().contains('snow')) {
      backgroundImage = 'assets/images/snowBackground1.png';
    } else if (city.condition.toLowerCase().contains('rain')) {
      backgroundImage = 'assets/images/rainyBackground.png';
    } else if (DateTime.now().hour > 18 || DateTime.now().hour < 5) {
      backgroundImage = 'assets/images/nightBackground.png';
    } else if (DateTime.now().hour > 16 && DateTime.now().hour < 18) {
      backgroundImage = 'assets/images/sunnyBackground2.png';
    } else {
      backgroundImage = 'assets/images/sunnyBackground1.png';
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: search
                      ? IconButton(
                          onPressed: () {
                            Navigator.of(context).push(CustomPageRoute( child :SearchScreen()));
                          },
                          icon: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        )
                      : const SizedBox(height: 20),
                ),
                const SizedBox(
                  height: 45,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "${city.now.round()} C",
                            style: const TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'nunito',
                                color: Colors.white),
                          ),
                          const SizedBox(
                            width: 9,
                          ),
                          Column(
                            children: [
                              Text(
                                "H : ${city.max} ํ",
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'nunito',
                                    color: Colors.white),
                              ),
                              Text(
                                "L  : ${city.min} ํ",
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'nunito',
                                    color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.place,
                            color: Colors.white,
                          ),
                          Text(city.region,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'nunito',
                                  color: Colors.white)),
                        ],
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "the weather is ${city.condition}",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 71, 71, 71),
                          fontFamily: 'sarabun'),
                    ),
                  ),
                ),
                const Divider(
                  color: Color.fromARGB(51, 195, 195, 195),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: SizedBox(
                    height: 58,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ImageDegree(
                          time: city.todayForcasting[0].time,
                          image: city.todayForcasting[0].image,
                          degree: city.todayForcasting[0].degree,
                        ),
                        ImageDegree(
                          time: city.todayForcasting[1].time,
                          image: city.todayForcasting[1].image,
                          degree: city.todayForcasting[1].degree,
                        ),
                        ImageDegree(
                          time: city.todayForcasting[2].time,
                          image: city.todayForcasting[2].image,
                          degree: city.todayForcasting[2].degree,
                        ),
                        ImageDegree(
                          time: city.todayForcasting[3].time,
                          image: city.todayForcasting[3].image,
                          degree: city.todayForcasting[3].degree,
                        ),
                        ImageDegree(
                          time: city.todayForcasting[4].time,
                          image: city.todayForcasting[4].image,
                          degree: city.todayForcasting[4].degree,
                        ),
                        ImageDegree(
                          time: city.todayForcasting[5].time,
                          image: city.todayForcasting[5].image,
                          degree: city.todayForcasting[5].degree,
                        ),
                        ImageDegree(
                          time: city.todayForcasting[6].time,
                          image: city.todayForcasting[6].image,
                          degree: city.todayForcasting[6].degree,
                        ),
                        ImageDegree(
                          time: city.todayForcasting[7].time,
                          image: city.todayForcasting[7].image,
                          degree: city.todayForcasting[7].degree,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                const Text(
                  "Tomorrow's temperature",
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 71, 71, 71)),
                ),
                const SizedBox(
                  height: 11,
                ),
                Text(
                  (double.parse(city.week[0].degree1) -
                                  double.parse(city.week[1].degree1))
                              .abs() <
                          5
                      ? "Almost equal to today"
                      : (double.parse(city.week[0].degree1) -
                                      double.parse(city.week[1].degree1))
                                  .abs() <
                              10
                          ? "Slightly different from today"
                          : (double.parse(city.week[0].degree1) -
                                          double.parse(city.week[1].degree1))
                                      .abs() <
                                  20
                              ? "Moderately different from today"
                              : "Significantly different from today",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 71, 71, 71),
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: SizedBox(
                    height: 144,
                    child: ListView.builder(
                      itemCount: city.week.length,
                      itemBuilder: (context, index) {
                        return DaysTableItem(
                          day: city.week[index].day,
                          image1: city.week[index].image1,
                          image2: city.week[index].image2,
                          degree1: city.week[index].degree1,
                          degree2: city.week[index].degree2,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
