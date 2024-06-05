import 'dart:io';

import 'package:detecto_app/utils/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../voiceUtilites/TtsClass.dart';

class TextRecognition extends StatefulWidget {
  static const String routName='textReco';
  late SpeechToText speech;
  bool isListening=false;
  String recognizedText='';

   TextRecognition({Key? key}) : super(key: key);

  @override
  State<TextRecognition> createState() => _TextRecognitionState();
}

class _TextRecognitionState extends State<TextRecognition> {
  TtsClass reader=TtsClass();
  FlutterTts ftts = FlutterTts();

  bool textScanning = false;

  XFile? imageFile;

  late String scannedText = "";
  @override
  void dispose(){
    ftts.stop();
  }

  @override
  void initState(){
    super.initState();
    reader.speak('welcome to read me ');
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
       getImage(ImageSource.camera);
       reader.speak('take a photo');
        break;
      case 'read':

        reader.speak(scannedText);
        break;




      default:
      // Handle unrecognized speech or show an error message
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Read Me "),
      ),
      body: SingleChildScrollView(
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
        Center(
        
            child: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
            
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (textScanning) const CircularProgressIndicator(),
                    if (!textScanning && imageFile == null)
                      Container(
                        width: 300,
                        height: 300,
                        color: Colors.grey[300]!,
                      ),
                    if (imageFile != null) Image.file(File(imageFile!.path)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
            
            
            
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            padding: const EdgeInsets.only(top: 10),
                            // child: ElevatedButton(
                            //   style: ElevatedButton.styleFrom(
                            //     // primary: Colors.white,
                            //     // onPrimary: Colors.grey,
                            //     shadowColor: Colors.grey[400],
                            //     elevation: 10,
                            //     shape: RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.circular(8.0)),
                            //   ),
                            //   onPressed: () {
                            //     getImage(ImageSource.gallery);
                            //   },
                            //   child: Container(
                            //     margin: const EdgeInsets.symmetric(
                            //         vertical: 5, horizontal: 5),
                            //     child: Column(
                            //       mainAxisSize: MainAxisSize.min,
                            //       children: [
                            //         Icon(
                            //           Icons.image,
                            //           size: 30,
                            //         ),
                            //         Text(
                            //           "Gallery",
                            //           style: TextStyle(
                            //               fontSize: 13, color: Colors.grey[600]),
                            //         )
                            //       ],
                            //     ),
                            //   ),
                            // )),
                        child:Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            padding: const EdgeInsets.only(top: 10),
                            // child: ElevatedButton(
                            //   style: ElevatedButton.styleFrom(
                            //     // primary: Colors.white,
                            //     // onPrimary: Colors.grey,
                            //     shadowColor: Colors.grey[400],
                            //     elevation: 10,
                            //     shape: RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.circular(8.0)),
                            //   ),
                            //   onPressed: () {
                            //     getImage(ImageSource.camera);
                            //   },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 200),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Appcolor.darkgreen
                                  ),
                                  onPressed: (){
                                    getImage(ImageSource.gallery);
                                  }
                                  ,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.image,
                                          size: 35,
                                          color: Appcolor.beej,
                                        ),
                                        Text(
                                          "Gallery",
                                          style: TextStyle(
                                              fontSize: 15, color:Appcolor.beej),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        )],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: GestureDetector(
                        onTap: (){
                          reader.speak(scannedText);
                        },
                        child: Text(
                          scannedText,
            
                          style: TextStyle(fontSize: 20,color: Colors.black),
                        ),
                      ),
                    )
                  ],
                ))),
            ]),
      ));
  }

  void getImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        textScanning = true;
        imageFile = pickedImage;
        setState(() {});
        getRecognisedText(pickedImage);
      }
    } catch (e) {
      textScanning = false;
      imageFile = null;
      scannedText = "Error occured while scanning";
      setState(() {});
    }
  }

  void getRecognisedText(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textRecognizer();
    RecognizedText recognisedText = await textDetector.processImage(inputImage);
    await textDetector.close();
    scannedText = "";
    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        scannedText = scannedText + line.text + "\n";
      }
    }
    textScanning = false;
    setState(() {});
  }




}