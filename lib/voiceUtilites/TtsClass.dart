import 'package:flutter_tts/flutter_tts.dart';

class TtsClass{

  FlutterTts ftts = FlutterTts();

  void speak(String text)async{
    await ftts.setLanguage("en-US");
    await ftts.setSpeechRate(0.3); //speed of speech
    await ftts.setVolume(1.0); //volume of speech
    await ftts.setPitch(1);//pitc of sound
    //play text to sp
    await ftts.speak(text);
  }
}