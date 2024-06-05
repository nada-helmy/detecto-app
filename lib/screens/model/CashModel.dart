import 'dart:convert';
import 'dart:io';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../voiceUtilites/TtsClass.dart';

class CashModel extends StatefulWidget {
  static const String routeName='ai';
  const CashModel({super.key});

  @override
  State<CashModel> createState() => _CashModelState();
}

class _CashModelState extends State<CashModel> {
  File? image;
  String? body;
  TtsClass reader=TtsClass();
  @override
  void initState(){
    super.initState();
    reader.speak('welcome to around me ');
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
    var response = await http.put(Uri.parse("http://10.0.2.2:5000/api3"),body: base64,headers: requestHeaders);
    print(response.body);
    setState(() {
      body = response.body;
      reader.speak(body!);
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Around Me"),
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

                    reader.speak('There is no data');
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

}
