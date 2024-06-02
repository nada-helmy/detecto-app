import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class CustomTextFormfield extends StatefulWidget {
  // final userNameController = TextEditingController();
  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();
  CustomTextFormfield({required this.hinttext,required this.icon,required this.controller,required this.sufIcon});
  String hinttext;
  IconData icon;
  IconButton sufIcon;
  TextEditingController controller;
  @override
  State<CustomTextFormfield> createState() => _CustomTextFormfieldState();
}

class _CustomTextFormfieldState extends State<CustomTextFormfield> {



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical:12
      ),
      child: TextFormField(
        style: TextStyle(
          color:Color.fromARGB(225,206, 222, 189),
          fontSize: 25
        ),
        controller: widget.controller,
        decoration: InputDecoration(

          prefixIcon:Icon(widget.icon) ,
          hintText:widget.hinttext,
          hintStyle: TextStyle(
            color: Color.fromARGB(225, 58, 77, 57),
            fontSize: 30,
            fontWeight: FontWeight.w400
          ),
          suffixIcon: widget.sufIcon,

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
      ),
    );
  }
}
