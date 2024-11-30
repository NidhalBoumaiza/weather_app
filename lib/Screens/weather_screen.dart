import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  late String cityName;
  WeatherScreen({super.key, required this.cityName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          cityName,
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}
