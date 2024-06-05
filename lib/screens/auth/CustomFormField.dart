import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:speech_to_text/speech_to_text.dart';

class CustomTextFormfield extends StatelessWidget {

  CustomTextFormfield({required this.hinttext, this.icon,
    this.keyboardType=TextInputType.text, this.controller,
  required this.validatorfunc,this.securetxt=false,this.sufIcon});

  String hinttext;
  IconData? icon;
  IconButton? sufIcon;
  TextEditingController? controller;
  String? Function(String?) ?validatorfunc;
  TextInputType? keyboardType;
  bool securetxt;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical:12
      ),
      child: TextFormField(
        style: TextStyle(
          color:Colors.blueGrey,
          fontSize: 25
        ),
        controller: controller,

        decoration: InputDecoration(


          prefixIcon:Icon(icon,size:35 ,) ,
          suffixIcon: sufIcon,

          hintText:hinttext,
          hintStyle: TextStyle(
            color: Color.fromARGB(225,58, 77, 57),
            fontSize: 30,
            fontWeight: FontWeight.w500,
              fontStyle:FontStyle.italic
          ),
          filled: true,
          fillColor: Color.fromARGB(225,236, 227, 206),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                  color: Color.fromARGB(225, 58, 77, 57), width:2)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                  color: Color.fromARGB(225, 58, 77, 57), width:2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                  color: Color.fromARGB(225, 58, 77, 57), width:2)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                  color: Colors.red.shade900, width:2)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                  color: Colors.redAccent.shade700, width:2)),
        ),
        keyboardType:keyboardType ,
        validator: validatorfunc,
        obscureText: securetxt,
      ),
    );
  }
}
