import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class ProviderHomePage extends ChangeNotifier{
    double temperature = 15;
    int weatherCode = 0;
    Position? location;
    bool loading = false;
    List<Placemark> places = [];


    ProviderHomePage({this.location});

    update(){
        notifyListeners();
    }
}