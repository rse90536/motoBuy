import 'package:flutter/material.dart';
import 'package:motobuy/ui/main_body.dart';
import 'package:motobuy/ui/screens/home/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MaterialColor(
          0xFF000000,
          <int, Color>{
            50: Color(0xFF000000),
            100: Color(0xFF000000),
            200: Color(0xFF000000),
            300: Color(0xFF000000),
            400: Color(0xFF000000),
            500: Color(0xFF000000),
            600: Color(0xFF000000),
            700: Color(0xFF000000),
            800: Color(0xFF000000),
            900: Color(0xFF000000),
          },
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeView(),
      // MainBody(),
    );
  }
}
