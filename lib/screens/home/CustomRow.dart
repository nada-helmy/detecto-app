import 'package:detecto_app/screens/camera/ImageDisplayScreen.dart';
import 'package:detecto_app/screens/model/AiModel.dart';
import 'package:detecto_app/screens/model/ColorModel.dart';
import 'package:detecto_app/screens/news/NewsScreen.dart';
import 'package:detecto_app/screens/text_recognition/TextRecognition.dart';
//import 'package:detecto_app/screens/news/NewsScreen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CustomRow extends StatefulWidget {
    bool cameraNeed;
    bool ocr;
    bool colors;
   CustomRow({required this.text,required this.cameraNeed,required this.ocr,required this.colors});
  String text;

  @override
  State<CustomRow> createState() => _CustomRowState();
}

class _CustomRowState extends State<CustomRow> {
  bool isImageSelected = false;
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: (){

          if(widget.cameraNeed==true&&widget.ocr==true){
            Navigator.pushNamed(context, TextRecognition.routName);
          }else if(widget.cameraNeed==true&&widget.ocr==false){
            Navigator.pushNamed(context, AiModel.routeName);
          }else if(widget.cameraNeed==true&&widget.colors==true){
            Navigator.pushNamed(context, ColorModel.routeName);
          }
          else{
            Navigator.pushNamed(context, NewsScreen.routeName);
          }
        // (widget.cameraNeed==true)?
        //   pickImageFromCamera():
        //   Navigator.pushNamed(context, NewsScreen.routeName);

         //Navigator.pushNamed(context, CameraScreen.routeName,arguments: selectedImage);

        },
        style:ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(225,67, 83, 52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.text,
                style:Theme.of(context).textTheme.bodyMedium),
            SizedBox(width:12,),
            Icon(Icons.arrow_forward_ios,color: Color.fromARGB(225,250, 241, 228),)
          ],
        ),
      ),
    );
  }
  Future<void> pickImageFromCamera()async{
    final returnedImage=await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImage != null) {
      setState(() {
        selectedImage= File(returnedImage.path);
        isImageSelected = true;
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => AiModel()));
      });}
  }



}
