import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_2/controller/search_city_controller.dart';
import 'package:weather_app_2/views/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(ChangeNotifierProvider(create: (context) => CityProvider(), child:const MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) { 
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
              useMaterial3: true,
            ),
            home: LoginScreen(),
            //CityScreen(city: snapshot.data!,search: true,)
          );
  }
}
