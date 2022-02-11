import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

String getWeatherByCode(int code) {
  switch (code) {
    case 200:
    case 201:
    case 202:
    case 210:
    case 211:
    case 212:
    case 221:
    case 230:
    case 231:
    case 232:
      return "Thunderstorm";
    case 300:
    case 301:
    case 302:
    case 310:
    case 311:
    case 312:
    case 313:
    case 314:
    case 321:
      return "Drizzle";
    case 500:
    case 501:
    case 502:
    case 503:
    case 504:
    case 511:
    case 520:
    case 521:
    case 522:
    case 531:
      return "Rain";
    case 600:
    case 601:
    case 602:
    case 611:
    case 612:
    case 613:
    case 615:
    case 616:
    case 620:
    case 621:
    case 622:
      return "Snow";
    case 701:
      return "Mist";
    case 711:
      return "Smoke";
    case 721:
      return "Haze";
    case 731:
      return "Dust";
    case 741:
      return "Fog";
    case 751:
      return "Sand";
    case 761:
      return "Dust";
    case 762:
      return "Ash";
    case 771:
      return "Squall";
    case 781:
      return "Tornado";
    case 800:
      return "Clear";
    case 801:
    case 802:
    case 803:
    case 804:
      return "Clouds";
    default:
      return "Unknown";
  }
}

List<Color> getColorsByWeatherCode(int code) {
  switch (code) {
    case 200:
    case 201:
    case 202:
    case 210:
    case 211:
    case 212:
    case 221:
    case 230:
    case 231:
    case 232:
      return [Colors.blueAccent, Colors.blue];
    case 300:
    case 301:
    case 302:
    case 310:
    case 311:
    case 312:
    case 313:
    case 314:
    case 321:
      return [Colors.blueAccent, Colors.blue];
    case 500:
    case 501:
    case 502:
    case 503:
    case 504:
    case 511:
    case 520:
    case 521:
    case 522:
    case 531:
      return [Colors.blueAccent,Colors.blueAccent.withOpacity(0.6),Colors.white54];
    case 600:
    case 601:
    case 602:
    case 611:
    case 612:
    case 613:
    case 615:
    case 616:
    case 620:
    case 621:
    case 622:
      return [Colors.blueAccent, Colors.blue];
    case 701:
      return [Colors.blueAccent, Colors.blue];
    case 711:
      return [Colors.blueAccent, Colors.blue];
    case 721:
      return [Colors.blueAccent, Colors.blue];
    case 731:
      return [Colors.blueAccent, Colors.blue];
    case 741:
      return [Colors.blueAccent, Colors.blue];
    case 751:
      return [const Color(0xFFF9E36E),const Color(0xFFDBCE02)];
    case 761:
      return [Colors.blueAccent, Colors.blue];
    case 762:
      return [Colors.blueAccent, Colors.blue];
    case 771:
      return [Colors.blueAccent, Colors.blue];
    case 781:
      return [Colors.blueAccent, Colors.blue];
    case 800:
      return DateTime.now().hour>18?[const Color(0xFF1B1A4D), Colors.blue]:[Colors.blue, Colors.blue];
    case 801:
    case 802:
    case 803:
    case 804:
      return  DateTime.now().hour>18?[const Color(0xFF1B1A4D), Colors.blue]:[Colors.blueAccent, Colors.blueGrey];
    default:
      return [Colors.blueAccent, Colors.blue];
  }
}

Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  return await Geolocator.getCurrentPosition();
}
