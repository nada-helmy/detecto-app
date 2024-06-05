import 'package:detecto_app/api_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../../../firebase/Firebase_funcs.dart';
import '../../../firebase/classmodel.dart';
import '../../../voiceUtilites/TtsClass.dart';
import '../../home/HomeScreen.dart';

import '../CustomFormField.dart';

import 'package:http/http.dart' as http;


class RegisterScreen extends StatefulWidget {
  late SpeechToText speech;
  bool isListening=false;
  String recognizedText='';
  // const LoginScreen({super.key});

  static const String routeName = 'reg';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TtsClass reader=TtsClass();


  var emailcontroller=TextEditingController() ;

  var passcontroller=TextEditingController() ;

  var usernamecontroller=TextEditingController() ;

  var formkey=GlobalKey<FormState>();

  var registered;

  Future<void> _register() async {
    final Uri uri = Uri.parse('http://localhost:3000/api/users/register');
    final response = await http.post(
      uri,
      body: {
        'email': emailcontroller.text.trim(),
        'password': passcontroller.text.trim(),
      },
    );

    if (response.statusCode == 201) {
      // Registration successful, navigate to home screen
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    } else {
      // Handle registration failure
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration failed'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
  @override
 void initState(){
    super.initState();
    reader.speak('Please sign in to continue!');

    initSpeechToText();
    check();
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

  void startListening(String text)async{
    if (!widget.isListening) {
      bool available = await widget.speech.initialize();
      if (available) {
        setState(() => widget.isListening = true);
        widget.speech.listen(
          onResult: (result) {
            setState((){ widget.recognizedText = result.recognizedWords;
            text=widget.recognizedText;});

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
                          //SizedBox(height: height*.07,),

                          Form(
                            key:formkey ,
                              child: Column(
                                children: [

                                    CustomTextFormfield(
                                      hinttext: "Username",

                                      validatorfunc:(username) {
                                        if (username==null || username.trim().isEmpty) {
                                          return 'required field';
                                        }
                                        return null;
                                      },
                                      controller:usernamecontroller ,
                                      icon:Icons.person,
                                      // sufIcon:IconButton(onPressed: (){
                                      //   if( widget.isListening ){
                                      //     stopListening();
                                      //   }else{
                                      //     startListening(usernamecontroller.text);
                                      //
                                      //
                                      //   }
                                      // },icon:Icon(widget.isListening ? Icons.mic : Icons.mic_none) ,iconSize: 25,)


                                    ),



                                  // SizedBox(height: height*.03,),
                                  CustomTextFormfield(
                                    hinttext: ' Email',
                                    icon:Icons.email_outlined ,


                                    controller:emailcontroller ,
                                    validatorfunc:(text) {
                                      if (text==null || text.trim().isEmpty) {
                                        return 'please enter your email address';
                                      }
                                      bool emailValid =
                                      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(text);
                                      if(!emailValid){
                                        return'please enter a valid email';
                                      }
                                      return null;
                                    },
                                    keyboardType:TextInputType.emailAddress ,
                                  ),
                                 // SizedBox(height: height*.03,),
                                  CustomTextFormfield(
                                    hinttext: ' Password',

                                    controller:passcontroller ,
                                    securetxt: true,
                                    validatorfunc:(pass) {
                                      if (pass==null || pass.trim().isEmpty) {
                                        return 'please enter a password';
                                      }
                                      if(pass.length<6){
                                        return'password must be at least 6 characters';
                                      }
                                      return null;
                                    },
                                    icon:Icons.lock_outline_rounded ,

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
                            onPressed:()async{
                              SharedPreferences pref =
                                  await SharedPreferences.getInstance();
                              pref.setBool('Isregestered',true);
                              register();
                            } ,
                            child:
                            Text('Register',
                              style:Theme.of(context).textTheme.bodyLarge!
                                  .copyWith(color:Color.fromARGB(225, 58, 77, 57)) ,
                            ),
                          ),
                          SizedBox(height: height*.04),
                          Text(widget.recognizedText,style: TextStyle(color: Colors.black),),
                        ],
                      ),
                    )
                ),
              ],
            ),
          ),
        ));
  }




  void register() async{
     if(formkey.currentState?.validate()==true){
       UserClassmodel user=UserClassmodel(
         username: usernamecontroller.text,
         email: emailcontroller.text ,
         password: passcontroller.text,
       );
       FirebaseFunctions.CreateUser(
           emailcontroller.text, passcontroller.text,
            (){
                 FirebaseFunctions.addUser(user);
                 reader.speak('registered Successfully');
                 Navigator.of(context)
                     .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false,);
               },
            (message){
             reader.speak(message);
             showDialog(context: context,
                 builder: (context) => AlertDialog(
                  title:Text('Error',style:Theme.of(context).textTheme.bodyLarge
                    !.copyWith(color:Colors.brown.shade400 )) ,

                  content:Text(message,style:Theme.of(context).textTheme.bodyMedium
                  !.copyWith(color:Colors.brown.shade600)) ,
                  actions: [
                     ElevatedButton(
                       onPressed:() => Navigator.pop(context) ,
                       child:Text('OK',style:Theme.of(context).textTheme.bodySmall
                       !.copyWith(color:Colors.orangeAccent.shade200 ))),
               ],
             ));
               });
     }

  }


  Future<void> check() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    registered = pref.getBool('Isregestered');
    if (registered) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
    } else {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(RegisterScreen.routeName, (route) => false);
    }}
}


