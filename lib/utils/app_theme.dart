import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app-colors.dart';

class Mytheme{

  static ThemeData light=ThemeData(
    scaffoldBackgroundColor: Colors.white,//Color(0xffE4EEE1),
    appBarTheme: AppBarTheme(
      shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft:Radius.circular(45),
                bottomRight:Radius.circular(45) )
        ),
      elevation: 0,
      centerTitle: true,
      toolbarHeight:100,
      backgroundColor:Colors.blueGrey.shade500 ,
      titleTextStyle:GoogleFonts.laila(
        fontWeight: FontWeight.w600,
        fontSize: 45,
        color: Colors.white
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
      color:Colors.blueGrey,
      size:30,
      weight: 20 ,
    )
  );
}