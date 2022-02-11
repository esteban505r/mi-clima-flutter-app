import 'package:es_weather_app/widgets/slide_widget.dart';
import 'package:flutter/cupertino.dart';

class Widgets{

  static Widget getDecorationByWeatherCode(int code,AnimationController animationController){
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
        return SlideWidget(animationController:animationController,child: Image.asset("assets/images/cloud1.png"));
      case 300:
      case 301:
      case 302:
      case 310:
      case 311:
      case 312:
      case 313:
      case 314:
      case 321:
        return Container();
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
      return SlideWidget(animationController:animationController,child: Image.asset("assets/images/raincloud1.png"));
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
        return Container();
      case 701:
        return Container();
      case 711:
        return Container();
      case 721:
        return Container();
      case 731:
        return Container();
      case 741:
        return Container();
      case 751:
        return Container();
      case 761:
        return Container();
      case 762:
        return Container();
      case 771:
        return Container();
      case 781:
        return Container();
      case 800:
        return SlideWidget(animationController:animationController,child: Image.asset(DateTime.now().hour>18?"assets/images/moon.png":"assets/images/sun1.png"));
      case 801:
      case 802:
      case 803:
      case 804:
        return SlideWidget(child: Image.asset("assets/images/cloud1.png"),animationController: animationController,);
      default:
        return Container();
    }
  }

}