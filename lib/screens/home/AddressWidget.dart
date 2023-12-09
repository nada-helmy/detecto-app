import 'package:flutter/material.dart';

class AddressWidget extends StatelessWidget {
  String text;
   AddressWidget({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0,right: 5),
      child: Text(text,style: TextStyle(color:Color.fromARGB(225,67, 83, 52) )),
    );
  }
}
