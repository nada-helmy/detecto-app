import 'package:flutter/material.dart';

import '../../../models/SourceResponse.dart';

class TabItem extends StatelessWidget {
   TabItem({required this.isselected,required this.source});
  bool isselected;
  Source source;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(12),
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color:Colors.blueGrey,
          width: 3,
        ),
        color: isselected?Colors.blueGrey:Colors.transparent
      ) ,
      child:Text(source.name??'',
        style:TextStyle(
          color: isselected?Colors.white:Colors.blueGrey,
           fontSize:27,
          fontWeight: FontWeight.w700
        ) ,),
    );
  }
}
