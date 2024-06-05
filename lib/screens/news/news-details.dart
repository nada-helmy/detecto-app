import 'package:cached_network_image/cached_network_image.dart';
import 'package:detecto_app/voiceUtilites/TtsClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../Api-manager.dart';
import '../../models/NewsResponse.dart';
import '../../models/SourceResponse.dart';
import '../../utils/appcolor.dart';
import 'news-detailedItem.dart';

class Newsdetails1 extends StatefulWidget {
  static const String routeName = 'news details';
  const Newsdetails1({super.key});

  @override
  State<Newsdetails1> createState() => _Newsdetails1State();
}

class _Newsdetails1State extends State<Newsdetails1> {
  //SourceResponse? source;
  SourceResponse? source;

  FlutterTts ftts = FlutterTts();
  TtsClass reader=TtsClass();

  @override
  void dispose(){
    super.dispose();
    ftts.stop();

  }

  @override
  Widget build(BuildContext context) {

    var args=ModalRoute.of(context)?.settings.arguments as News;

    return Scaffold(
      appBar:AppBar(title: Text(args.title??"",style: TextStyle(fontSize: 25),)) ,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15,),
            Padding(
              padding: EdgeInsets.only(right: 5,left: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(args.urlToImage??'image not found'),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(args.source?.name??"",style:  TextStyle(color:Appcolor.darkgreen,fontSize:30)),

                 const SizedBox(height: 19,),
                  GestureDetector(
                      onTap: (){
                        reader.speak(args.title??" data not found");
                      },
                      child: Text(args.title??"",style: TextStyle(color:Appcolor.darkgreen,fontSize: 20) )),

                  // Text("${DateTime.parse(args.publishedAt??"").hour.toString()} hours ago "
                  //   ,style: Theme.of(context).textTheme.bodySmall,textAlign: TextAlign.end,),

                  GestureDetector(
                      onTap: (){
                        reader
                        .speak('''${args.content??" data not found"} The club have also confirmed they remain in conversations with goalkeeper Tom Heaton over a new deal, while a contract has been offered to Omari Forson.

                            Forson, 19, was handed his Premier League debut in February's 4-3 win against Wolves, when he provided the assist for Kobbie Mainoo's winner at Molineux.

                            The London-born forward made six further appearances but he is yet to be persuaded to sign a new deal at the club.

                            Brandon Williams, Anthony Martial and Raphael Varane will all be released on 30 June, when their deals expire.

                            Williams spent last season on loan at Ipswich but hasn't played since 29 December because of an injury, which saw him return to United.

                            The defender's last appearance for United came in September 2022.
                            for more details visit the web site ''');
                      },

                      child: Text('''${args.content??" data not found"} 
The club have also confirmed they remain in conversations with goalkeeper Tom Heaton over a new deal, while a contract has been offered to Omari Forson.
Forson, 19, was handed his Premier League debut in February's 4-3 win against Wolves, when he provided the assist for Kobbie Mainoo's winner at Molineux.
The London-born forward made six further appearances but he is yet to be persuaded to sign a new deal at the club.
Brandon Williams, Anthony Martial and Raphael Varane will all be released on 30 June, when their deals expire.
Williams spent last season on loan at Ipswich but hasn't played since 29 December because of an injury, which saw him return to United.
The defender's last appearance for United came in September 2022.
for more details visit the web site ''' ,style:  TextStyle(color:Appcolor.darkgreen,fontSize: 20) )),

                ],
              ),
            )

          ],
        ),
      ),
    );

  }





}




















// body: FutureBuilder<NewsResponse>(
//   future: ApiManager.getNewsById(source?.id??''),
//   builder:(context, snapshot){
//     if(snapshot.connectionState==ConnectionState.waiting){
//       return Center(
//         child: CircularProgressIndicator(
//           color: Appcolor.darkgreen,
//         ),
//       );
//     }else if(snapshot.hasError){
//       return Text('error',
//         style:Theme.of(context).textTheme.bodySmall!
//             .copyWith(color:Appcolor.darkgreen ) ,);
//     }
//     if(snapshot.data?.status=='error') {
//       return Text(snapshot.data?.message??'',
//         style:Theme.of(context).textTheme.bodySmall!
//             .copyWith(color:Appcolor.darkgreen) ,);
//     }
//     var newsContent= snapshot.data?.articles??[];
//     return ListView.builder(
//       itemBuilder:(context, index) {
//         return NewsDetailedItem(news:newsContent[index] ,);
//       },
//       itemCount: newsContent.length,);
//   },)