import 'package:es_weather_app/pages/home/home_page.dart';
import 'package:es_weather_app/pages/home/provider_home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:  (_) => ProviderHomePage())
      ],
      child: MaterialApp(
        title: 'Es Weather APP',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:const HomePage(),
      ),
    );
  }
}




