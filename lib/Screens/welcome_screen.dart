import 'package:flutter/material.dart';
import 'package:weather_applicationn/Screens/weather_screen.dart';

import '../constant.dart';
import '../utils/location_functions.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.secondaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/get-started.png'),
            const SizedBox(height: 20),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.7, 50)),
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  late String city;
                  List<dynamic> latLong = await getLocation();
                  print(latLong);
                  try {
                    city = await GetAddressFromLatLong(latLong[0], latLong[1]);
                    print(city);
                  } catch (e) {
                    print(e);
                  }

                  setState(() {
                    isLoading = false;
                  });
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          WeatherScreen(
                        cityName: city,
                      ),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(1.0, 0.0);
                        const end = Offset.zero;
                        const curve = Curves.ease;

                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));

                        return SlideTransition(
                          position: animation.drive(tween),
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Get Started',
                      style: TextStyle(
                          color: Constants.primaryColor, fontSize: 15),
                    ),
                    const SizedBox(width: 10),
                    isLoading == false
                        ? SizedBox()
                        : SizedBox(
                            width: 10,
                            height: 10,
                            child: CircularProgressIndicator(
                              color: Constants.secondaryColor,
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
