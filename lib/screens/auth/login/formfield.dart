import 'package:flutter/material.dart';

class TextFormfield extends StatelessWidget {

  TextFormfield({required this.hinttext,required this.icon});
  String hinttext;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical:12
      ),
      child: TextFormField(
        style: TextStyle(
          color: Colors.black,
          fontSize: 25
        ),
        decoration: InputDecoration(
          prefixIcon:Icon(icon) ,
          hintText:hinttext,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 30,
            fontWeight: FontWeight.w400
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                  color: Colors.white, width:2)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                  color: Colors.white, width:2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                  color: Colors.white, width:2)),
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
