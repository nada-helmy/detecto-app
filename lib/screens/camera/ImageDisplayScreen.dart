import 'dart:io';

import 'package:detecto_app/screens/home/CustomRow.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageDisplayScreen extends StatefulWidget {
  static const String routeName='camera';
  const ImageDisplayScreen({super.key, required this.image,});
  final XFile image;
  @override
  State<ImageDisplayScreen> createState() => _ImageDisplayScreenState();
}

class _ImageDisplayScreenState extends State<ImageDisplayScreen> {


  @override
  Widget build(BuildContext context) {
   // final image = ModalRoute.of(context)!.settings.arguments as File;
    return Scaffold(
      appBar: AppBar(title: Text('Detecto')),
      body:  Column(
        children: [


               Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:  Image.file(File(widget.image.path)))
            ),


        ],
      ),
    );
  }

}
