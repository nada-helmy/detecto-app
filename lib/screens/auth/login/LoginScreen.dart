import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../../../voiceUtilites/TtsClass.dart';
import '../../home/HomeScreen.dart';
import '../CustomFormField.dart';
import 'package:flutter_tts/flutter_tts.dart';


class LoginScreen extends StatefulWidget {
  late SpeechToText speech;
  bool isListening=false;
  String recognizedText='';

  late final userNameController = TextEditingController();
  late final emailController = TextEditingController();
  late final passwordController = TextEditingController();
 // const LoginScreen({super.key});

  static const String routeName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TtsClass reader=TtsClass();


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(225,67, 83, 52),
        body: SingleChildScrollView(
           child: Column(
            children: [
             SizedBox(height: height*.05,),
          GestureDetector(
            onTap:() {

              reader.speak('Please sign in to continue!');
            },

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Please sign in to continue!',
                  style:Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color:Color.fromARGB(225,250, 241, 228),) ,),
            ),),
              Card(
                color:Color.fromARGB(225,236, 227, 206),
                margin:EdgeInsets.all(12) ,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                child:Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: height*.07,),
                      Form(
                          child: Column(
                            children: [
                              CustomTextFormfield(

                                  hinttext: "User Name",
                                  icon: Icons.person,

                                  controller: widget.userNameController,
                                validatorfunc: (p0) {

                                },

                              ),
                              CustomTextFormfield(
                                hinttext: ' Email',

                                icon:Icons.email_outlined ,

                                controller: widget.emailController,
                                validatorfunc: (p0) {

                                },

                              ),
                              CustomTextFormfield(
                                hinttext: ' Password',

                                icon:Icons.password_outlined ,
                                controller: widget.passwordController,
                                validatorfunc: (p0) {

                                },
                              ),
                            ],
                          )),
                      SizedBox(height: height*.07 ,),
                  ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      backgroundColor:  Color.fromARGB(225,236, 227, 206),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                    ),
                      onPressed:(){
                        Navigator.of(context)
                            .pushNamed(HomeScreen.routeName);

                          reader.speak('Successfully Login');

                      } ,
                        child:
                       Text('Login',
                              style:Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(color:Color.fromARGB(225, 58, 77, 57)) ,
                       ),
                  ),
                      SizedBox(height: height*.04),
                    ],
                  ),
                )
             ),
          ],
      ),
        ),
    ));
  }


}
