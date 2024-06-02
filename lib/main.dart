
import 'package:detecto_app/screens/camera/ImageDisplayScreen.dart';
import 'package:detecto_app/screens/model/AiModel.dart';
import 'package:detecto_app/screens/model/ColorModel.dart';
import 'package:detecto_app/screens/news/NewsScreen.dart';
import 'package:detecto_app/screens/text_recognition/TextRecognition.dart';
import 'package:flutter/material.dart';
import 'screens/auth/login/LoginScreen.dart';
import 'screens/home/HomeScreen.dart';
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
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName:(context)=>LoginScreen(),
        HomeScreen.routeName:(context)=>HomeScreen(),
        NewsScreen.routeName:(context)=>NewsScreen(),
        TextRecognition.routName:(context) => TextRecognition(),
        AiModel.routeName:(context) => AiModel(),
        ColorModel.routeName:(context) => ColorModel()

        //CameraScreen.routeName:(context) => CameraScreen(),

      },
    );
  }
}
