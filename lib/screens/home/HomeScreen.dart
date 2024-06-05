

import 'package:detecto_app/screens/home/AddressWidget.dart';
import 'package:detecto_app/screens/home/CustomRow.dart';
import 'package:detecto_app/screens/model/AiModel.dart';
import 'package:detecto_app/screens/model/CashModel.dart';
import 'package:detecto_app/screens/model/ColorModel.dart';
import 'package:detecto_app/screens/news/NewsScreen.dart';
import 'package:detecto_app/screens/text_recognition/TextRecognition.dart';

import 'package:detecto_app/voiceUtilites/TtsClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';


class HomeScreen extends StatefulWidget {
  late SpeechToText speech;
  bool isListening=false;
  String recognizedText='';
  String userName='';
  //const HomeScreen({super.key});
  static const String routeName = 'home';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TtsClass reader=TtsClass();

  @override
  void initState(){
    super.initState();
    reader.speak('Welcome      please press on mic    and say what you want');


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
            _navigateToScreen(widget.recognizedText);
            // Implement logic for screen navigation based on recognized text
            // ...
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

  void _navigateToScreen(String recognizedText) {
    switch (recognizedText) {
      case 'read':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TextRecognition()),
        );
        break;
      case 'colour'|| 'color':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ColorModel()),
        );
        break;
      case 'news':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewsScreen()),
        );
        break;

      case 'around':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AiModel()),
        );
        break;

      case 'cash':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CashModel()),
        );
        break;

    // Add more cases for other screens
    // ...
      default:

      // Handle unrecognized speech or show an error message
        break;
    }
  }






  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    return Scaffold(
       appBar: AppBar(title: Text('Detecto')),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height:height*.01 ,),
              GestureDetector(
                onTap:() {
          
                  reader.speak('''Welcome!How can I help you!''');
                },
             child: Text('''Welcome!                                How can I help you!''',
                  style:Theme.of(context).textTheme.bodyLarge!
              .copyWith(color: Color.fromARGB(225,67, 83, 52),fontSize:38 )),),
              //SizedBox(height:height*.002,),
          
                Padding(
                  padding: const EdgeInsets.only(left:250),
                  child: ElevatedButton(
                    onPressed: ()
                      {if( widget.isListening ){
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
          
          
          
                SizedBox(height:height*.02 ,),
                GestureDetector(
                    onTap:() {
          
                     reader.speak('Read Me');
                      },
                   child: AddressWidget(text: 'Read Me'),),
                CustomRow(text: 'Open Camera',cameraNeed: true,ocr: true,colors: false,),
            GestureDetector(
              onTap:() {
          
                reader.speak('Around Me');
              },
          
              child:AddressWidget(text: 'Around Me',)),
                CustomRow(text: 'Open Camera',cameraNeed: true,ocr: false,colors: false,),
            GestureDetector(
              onTap:() {
          
                reader.speak('News');
              },
          
              child: AddressWidget(text: 'News',)),
                CustomRow(text: 'News',cameraNeed: false,ocr: false,colors: false,),
          
                SizedBox(height:height*.02 ,),
                GestureDetector(
                  onTap:() {
          
                   reader.speak('Colors');
                  },
                  child: AddressWidget(text: 'Colors'),),
                CustomRow(text: 'Open Camera',cameraNeed: true,ocr: false,colors: true,),
          
                SizedBox(height:height*.02 ,),
                GestureDetector(
                  onTap:() {
          
                    reader.speak('cash reader');
                  },
                  child: AddressWidget(text: 'Cash Reader'),),
                CustomRow(text: 'Open Camera', cameraNeed: true,ocr: false,colors: false,),
          
                SizedBox(height:height*.02 ,),

          
          
          
          
                // GestureDetector(
                //     onTap:() {
                //
                //       speak('Text Recognition');
                //     },
                //
                //     child: AddressWidget(text: 'Text Recognition',)),
                // CustomRow(text: 'Text Recognition',cameraNeed: false)
              ],
            ),
        ),
        ),
      );
  }



}

