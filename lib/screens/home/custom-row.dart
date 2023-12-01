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
            backgroundColor: Colors.blueGrey.shade500,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )
        ),
        child: Row(
          children: [
            Text(text,
                style:Theme.of(context).textTheme.bodyMedium),
            SizedBox(width:12,),
            Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}
