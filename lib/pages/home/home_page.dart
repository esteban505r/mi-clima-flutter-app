import 'package:es_weather_app/pages/home/provider_home_page.dart';
import 'package:es_weather_app/providers/base_providers.dart';
import 'package:es_weather_app/utils/utils.dart';
import 'package:es_weather_app/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(vsync: this,duration: const Duration(milliseconds: 700));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _getData(context.read<ProviderHomePage>()).then((value){
        timer(context.read<ProviderHomePage>());
      });
    });
    return Consumer<ProviderHomePage>(
      builder: (context,ProviderHomePage provider, child){
        return Scaffold(
            body: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: getColorsByWeatherCode(provider.weatherCode),
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              child: Stack(
                children:[
                  Positioned(right:40,top: 50,child: Visibility(visible:provider.loading,child: const CircularProgressIndicator(color: Colors.white,))),
                  Positioned(top:50,child: Container(height: MediaQuery.of(context).size.height*0.26,child: Widgets.getDecorationByWeatherCode(provider.weatherCode,animationController)),),
                  Positioned.fill(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:120.0),
                          child: Column(
                            children: [
                              Text(
                                "${provider.temperature}°C",
                                style: GoogleFonts.balsamiqSans()
                                    .copyWith(fontSize: 100, color: Colors.grey[100]),
                              ),
                              Text( getWeatherByCode(provider.weatherCode),
                                  style: GoogleFonts.balsamiqSans()
                                      .copyWith(fontSize: 25, color: Colors.white)),
                            ],
                          ),
                        ),
                        Column(children: [
                          Text( provider.places.isEmpty ? "Unknown":provider.places[0].street??"Unknown",
                              style: GoogleFonts.balsamiqSans()
                                  .copyWith(fontSize: 22, color: Colors.white)),
                          Text( provider.places.isEmpty ? "Unknown": (provider.places[0].locality??"Unknown") + " "+ (provider.places[0].country??"Unknown"),
                              style: GoogleFonts.balsamiqSans()
                                  .copyWith(fontSize: 22, color: Colors.white))
                        ],)
                      ],
                    ),
                  ),

                ],
              ),
            ));
      },
    );
  }

  Future timer(ProviderHomePage providerHomePage){
    return Future.delayed(const Duration(seconds: 60)).then((value) {
      _getData(providerHomePage).then((value) => {
        animationController.reset(),
        animationController.forward(),
        timer(providerHomePage)
      });
    });
  }

  Future _getData(ProviderHomePage providerHomePage) {
    providerHomePage.loading = true;
    //Getting position
    return determinePosition().then((position){
      providerHomePage.location = position;
      //Getting weather
      BaseProviders()
          .getCurrentWeatherData(lat:providerHomePage.location?.latitude.toString()??"0",lon:providerHomePage.location?.longitude.toString()??"0")
          //.getCurrentWeatherData(lat:"54.981146441520096", lon:"-2.227817908154285")
          .then((value) {
            placemarkFromCoordinates(position.latitude,position.longitude).then((placemark) {
            //Setting values
                providerHomePage.weatherCode = value.weather?[0].id ?? 0;
                providerHomePage.temperature = value.main?.temp ?? 0;
                providerHomePage.loading = false;
                providerHomePage.places = placemark;
                providerHomePage.update();
            });
      });
    });
  }
}
