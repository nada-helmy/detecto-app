import 'dart:convert';
import 'dart:io';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../voiceUtilites/TtsClass.dart';

class AiModel extends StatefulWidget {
  late SpeechToText speech;
  bool isListening=false;
  String recognizedText='';
  static const String routeName='ai';
   AiModel({super.key});

  @override
  State<AiModel> createState() => _AiModelState();
}

class _AiModelState extends State<AiModel> {

  File? image;
  String? body;
  TtsClass reader=TtsClass();
  @override
  void initState(){
    super.initState();
    reader.speak('welcome to around me ');
    initSpeechToText();
  }

  Future<void> initSpeechToText() async{
    widget.speech=SpeechToText();
    bool available=await widget.speech.initialize();
    if(available){
      setState(() {
        widget.isListening=false;
      });
    }
  }

  void startListening()async{
    if (!widget.isListening) {
      bool available = await widget.speech.initialize();
      if (available) {
        setState(() => widget.isListening = true);
        widget.speech.listen(
          onResult: (result) {
            setState(() => widget.recognizedText = result.recognizedWords);
            navigate(widget.recognizedText);


          },
        );
      }
    }
  }

  void stopListening(){
    if(widget.isListening){
      widget.speech.stop();
      setState(() {
        widget.isListening=false;
      });
    }
  }
  void navigate(String recognizedText){
    switch (recognizedText) {
      case 'camera':
        takePhoto();
        reader.speak('take a photo');
        break;

      case 'answer':
        uploadImage();

        break;

      default:
      // Handle unrecognized speech or show an error message
        break;
    }
  }
  Future takeImage () async{
    final myFile=await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      image=File(myFile!.path);
    });
  }

  Future takePhoto () async{
    final myFile=await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      image=File(myFile!.path);
    });
  }
  //10.0.2.2:5000
  Future uploadImage() async{
    if(image==null) return"";
    String base64=base64Encode(image!.readAsBytesSync());
    Map<String,String> requestHeaders={'Content-type':'application/json','Accept':'application/json'};
    var response = await http.put(Uri.parse("http://10.0.2.2:5000/api"),body: base64,headers: requestHeaders);
    print(response.body);
    setState(() {
       body = response.body;
       reader.speak("${body??"no data"}");
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Around Me"),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:250,top: 10),
              child: ElevatedButton(
                onPressed: ()
                {
                  if( widget.isListening ){
                    stopListening();
                  }else{
                    startListening();

                  }
                },
                child: Icon(widget.isListening ? Icons.mic : Icons.mic_none), // icon of the button
                style: ElevatedButton.styleFrom( // styling the button
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                  backgroundColor: Color.fromARGB(225,67, 83, 52), // Button color
                  foregroundColor: Color.fromARGB(225,250, 241, 228), // Splash color
                ),
              ),
            ),
            SizedBox(height:50),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              image==null? GestureDetector(
                  onTap:() {

                    reader.speak('Image Not found , please use the mic to use  camera');
                  },
                  child: Text("Image not found")):Image.file(image!),
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
        ),]),
      )
    );
  }




}
