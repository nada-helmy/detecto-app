//import 'package:detecto_app/utils/appcolor.dart';
import 'package:detecto_app/utils/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Mytheme{

  static ThemeData light=ThemeData(
    scaffoldBackgroundColor: Appcolor.beej,
    appBarTheme: AppBarTheme(
      shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft:Radius.circular(45),
                bottomRight:Radius.circular(45) )
        ),
      elevation: 0,
      centerTitle: true,
      toolbarHeight:100,
      backgroundColor:Appcolor.darkgreen ,
      titleTextStyle:GoogleFonts.laila(
        fontWeight: FontWeight.w600,
        fontSize: 45,
        color: Appcolor.beej
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
          color: Colors.white
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