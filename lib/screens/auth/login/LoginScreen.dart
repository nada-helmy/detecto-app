import 'package:flutter/material.dart';
import '../../home/HomeScreen.dart';
import '../CustomFormField.dart';
import 'package:flutter_tts/flutter_tts.dart';


class LoginScreen extends StatelessWidget {
 // const LoginScreen({super.key});

  static const String routeName = 'login';

  FlutterTts ftts = FlutterTts();

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

              speak('Please sign in to continue!');
             },

             child: Text('Please sign in to continue!',
                style:Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color:Color.fromARGB(225,250, 241, 228),) ,),),
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
                                validatorfunc: (p0) {

                                },
                                  hinttext: "User Name",
                                  icon: Icons.person),
                              CustomTextFormfield(
                                hinttext: ' Email',
                                validatorfunc: (p0) {

                                },
                                icon:Icons.email_outlined ,
                              ),
                              CustomTextFormfield(
                                validatorfunc: (p0) {

                                },
                                hinttext: ' Password',
                                icon:Icons.password_outlined ,
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

                          speak('Successfully Login');

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

  void speak(String text)async{
    await ftts.setLanguage("en-US");
    await ftts.setSpeechRate(0.5); //speed of speech
    await ftts.setVolume(1.0); //volume of speech
    await ftts.setPitch(1);//pitc of sound
    //play text to sp
    await ftts.speak(text);
  }
}
