import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
   CustomRow({required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: (){},
        style:ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(225,67, 83, 52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text,
                style:Theme.of(context).textTheme.bodyMedium),
            SizedBox(width:12,),
            Icon(Icons.arrow_forward_ios,color: Color.fromARGB(225,250, 241, 228),)
          ],
        ),
      ),
    );
  }
}
