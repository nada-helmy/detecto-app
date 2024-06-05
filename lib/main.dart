
import 'package:detecto_app/screens/camera/ImageDisplayScreen.dart';
import 'package:detecto_app/screens/model/AiModel.dart';
import 'package:detecto_app/screens/model/ColorModel.dart';
import 'package:detecto_app/screens/news/NewsScreen.dart';
import 'package:detecto_app/screens/text_recognition/TextRecognition.dart';
import 'package:flutter/material.dart';
import 'screens/auth/login/LoginScreen.dart';
import 'screens/auth/register/registerScreen.dart';
import 'screens/home/HomeScreen.dart';
import 'screens/news/NewsDetails.dart';
import 'screens/news/news-details.dart';
import 'utils/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
   FirebaseFirestore.instance.settings =
      Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
 // await FirebaseFirestore.instance.disableNetwork();
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
        RegisterScreen.routeName:(context)=>RegisterScreen(),
        HomeScreen.routeName:(context)=>HomeScreen(),
        NewsScreen.routeName:(context)=>NewsScreen(),
        NewsDetails.routeName:(context)=>NewsDetails(),
        Newsdetails1.routeName:(context)=>Newsdetails1(),
        TextRecognition.routName:(context) => TextRecognition(),
        AiModel.routeName:(context) => AiModel(),
        ColorModel.routeName:(context) => ColorModel()

        //CameraScreen.routeName:(context) => CameraScreen(),

      },
    );
  }
}

