import 'package:detecto_app/screens/home/AddressWidget.dart';
import 'package:detecto_app/screens/home/CustomRow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class HomeScreen extends StatefulWidget {
  //const HomeScreen({super.key});
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FlutterTts ftts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
       appBar: AppBar(title: Text('Detecto')),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height:height*.01 ,),
            GestureDetector(
              onTap:() {

                speak('''Welcome!How can I help you!''');
              },
           child: Text('''Welcome!                                How can I help you!''',
                style:Theme.of(context).textTheme.bodyLarge!
            .copyWith(color: Color.fromARGB(225,67, 83, 52),fontSize:38 )),),
            //SizedBox(height:height*.002,),

            SizedBox(height:height*.03 ,),
            GestureDetector(
                onTap:() {

                  speak('SuperMarket');
                  },
               child: AddressWidget(text: 'SuperMarket'),),
            CustomRow(text: 'Open Camera',cameraNeed: true,),
        GestureDetector(
          onTap:() {

            speak('Around Me');
          },

          child:AddressWidget(text: 'Around Me',)),
            CustomRow(text: 'Open Camera',cameraNeed: true,),
        GestureDetector(
          onTap:() {

            speak('News');
          },

          child: AddressWidget(text: 'News',)),
            CustomRow(text: 'News',cameraNeed: false,)
          ],
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

