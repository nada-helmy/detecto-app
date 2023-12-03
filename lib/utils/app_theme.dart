import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app-colors.dart';

class Mytheme{

  static ThemeData light=ThemeData(
    scaffoldBackgroundColor: Color.fromARGB(225,250, 241, 228),//Color(0xffE4EEE1),
    appBarTheme: AppBarTheme(
      shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft:Radius.circular(45),
                bottomRight:Radius.circular(45) )
        ),
      elevation: 0,
      centerTitle: true,
      toolbarHeight:100,
      backgroundColor:Color.fromARGB(225, 58, 77, 57) ,
      titleTextStyle:GoogleFonts.laila(
        fontWeight: FontWeight.w600,
        fontSize: 45,
        color: Color.fromARGB(225,236, 227, 206)
      )
    ),
    textTheme:TextTheme(
      bodyLarge: GoogleFonts.laila(
        fontWeight: FontWeight.bold,
        fontSize: 40,
        color: Colors.white
      ),
      bodyMedium:GoogleFonts.elMessiri(
          fontWeight: FontWeight.bold,
          fontSize: 35,
          color: Color.fromARGB(225,250, 241, 228)
      ),
      bodySmall: GoogleFonts.elMessiri(
          fontWeight: FontWeight.bold,
          fontSize:27,
          color: Colors.white
      ),

    ),
    iconTheme: IconThemeData(
      color:Color.fromARGB(225,250, 241, 228),
      size:30,
      weight: 20 ,
    )
  );
}