import 'dart:convert';
import 'dart:io';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ColorModel extends StatefulWidget {
  static const String routeName='color';
  const ColorModel({super.key});

  @override
  State<ColorModel> createState() => _ColorModelState();
}

class _ColorModelState extends State<ColorModel> {
  File? image;
  String? body;

  @override
  void initState(){
    super.initState();
    ftts.speak('welcome to color detection  page');
  }
  Future takeImage () async{
    final myFile=await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      image=File(myFile!.path);
    });
  }

  Future uploadImage() async{
    if(image==null) return"";
    String base64=base64Encode(image!.readAsBytesSync());
    Map<String,String> requestHeaders={'Content-type':'application/json','Accept':'application/json'};
    var response = await http.put(Uri.parse("http://10.0.2.2:5000/api2"),body: base64,headers: requestHeaders);
    print(response.body);
    setState(() {
      body = response.body;
      speak(body!);
    });
  }

  FlutterTts ftts = FlutterTts();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("color"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image==null? Text("image not found"):Image.file(image!),
              body==null?
              GestureDetector(
                  onTap:() {
          
                    speak('There is no data');
                  },
                  child: Text("There is no data")):
              Text(body!),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: ()=>(takeImage()), child: Text('upload')),
                  TextButton(onPressed: ()=>(uploadImage()), child: Text('predict')),
          
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  void speak(String text)async{
    await ftts.setLanguage("en-US");
    await ftts.setSpeechRate(0.5); //speed of speech
    await ftts.setVolume(1.0); //volume of speech
    await ftts.setPitch(1);//pitc of sound
    //play text to sp
    await ftts.speak(text);
  }


}
