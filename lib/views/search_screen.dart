import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_2/controller/get_city_controller.dart';
import 'package:weather_app_2/controller/search_city_controller.dart';
import 'package:weather_app_2/models/city_model.dart';
import 'package:weather_app_2/views/components.dart';
import 'package:weather_app_2/views/screen1.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("search for a city"),
        ),
        body: SafeArea(
          child: Column(children: [
            const Divider(color: Color.fromARGB(51, 195, 195, 195)),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: controller,
                onChanged: (text) {
                  Provider.of<CityProvider>(context, listen: false)
                      .searchCity(controller.text);
                },
                decoration: InputDecoration(
                    hintText: "city name",
                    prefixIcon: const Icon(Icons.search),
                    fillColor: Colors.grey.shade200,
                    suffix: IconButton(
                        onPressed: () {
                          controller.text = "";
                        },
                        icon: const Icon(Icons.clear))),
              ),
            ),
            Expanded(
                child: Consumer<CityProvider>(
              builder: (context, CityProvider, child) => ListView.builder(
                  itemCount: CityProvider.queryResult.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(CityProvider.queryResult[index]),
                      onTap: () async {
                        City temp = await getcityController(
                            CityProvider.queryResult[index]);
                        Navigator.push(
                            context,
                            CustomPageRoute(
                                child :CityScreen(
                                      city: temp,
                                      search: false,
                                    )));
                      },
                    );
                  }),
            )),
          ]),
        ));
  }
}
