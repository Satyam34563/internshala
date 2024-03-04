
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_page.dart';
import 'package:flutter_application_1/screens/search_screen.dart';
import 'package:flutter_application_1/screens/splash_screen.dart';

Map<String, WidgetBuilder> routes = {
    SplashScreen.routeName: (context) => const SplashScreen(),
    HomePage.routeName: (context) => const HomePage(),
    SearchScreen.routeName: (context) => const SearchScreen(),
};