import 'package:flutter/material.dart';
import 'screens/auth/login/LoginScreen.dart';
import 'screens/home/home-screen.dart';
import 'utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Mytheme.light,
      debugShowCheckedModeBanner: false,
      initialRoute: Login.routeName,
      routes: {
        Login.routeName:(context)=>Login(),
        HomeScreen.routeName:(context)=>HomeScreen(),
      },
    );
  }
}

