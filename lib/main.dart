import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_2/controller/get_city_controller.dart';
import 'package:weather_app_2/controller/search_city_controller.dart';
import 'package:weather_app_2/models/city_model.dart';
import 'package:weather_app_2/views/screen1.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => CityProvider(), child:const MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<City>(
      future: getcityController("cairo"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        } else if (snapshot.hasError) {
          return MaterialApp(
            home: Scaffold(
              body: Center(child: Text('Error: ${snapshot.error}')),
            ),
          );
        } else {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
              useMaterial3: true,
            ),
            home: CityScreen(city: snapshot.data!,search: true,),
          );
        }
      },
    );
  }
}
