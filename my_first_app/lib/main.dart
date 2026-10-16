import 'package:flutter/material.dart';

import 'animations/login_menu_cross_fade.dart';
import 'screens/login_screen.dart';
import 'screens/menu_screen.dart';

// The app starts here.
void main() {
  runApp(const RestaurantApp());
}

class RestaurantApp extends StatefulWidget {
  const RestaurantApp({super.key});

  @override
  State<RestaurantApp> createState() => _RestaurantAppState();
}

class _RestaurantAppState extends State<RestaurantApp> {
  // true = show the menu screen, false = show the login screen
  bool isLoggedIn = false;

  void login() {
    setState(() {
      isLoggedIn = true;
    });
  }

  void logout() {
    setState(() {
      isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the // below to hide the red "debug" banner:
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: LoginMenuCrossFade(
        isLoggedIn: isLoggedIn,
        loginScreen: LoginScreen(onLogin: login),
        menuScreen: MenuScreen(onLogout: logout),
      ),
    );
  }
}
