import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../Api-manager.dart';
import '../../models/NewsResponse.dart';
import '../../models/SourceResponse.dart';
import '../../utils/appcolor.dart';
import 'news-detailedItem.dart';

class Newsdetails1 extends StatelessWidget {
  static const String routeName = 'news details';
  Newsdetails1({super.key});
  Source? source;
  @override
  Widget build(BuildContext context) {
    //var args=ModalRoute.of(context)?.settings.arguments as News;
    return Scaffold(
      appBar:AppBar(title: Text('News title',)) ,
      body: FutureBuilder<NewsResponse>(
        future: ApiManager.getNewsById(source?.id??''),
        builder:(context, snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: Appcolor.darkgreen,
              ),
            );
          }else if(snapshot.hasError){
            return Text('error',
              style:Theme.of(context).textTheme.bodySmall!
                  .copyWith(color:Appcolor.darkgreen ) ,);
          }
          if(snapshot.data?.status=='error') {
            return Text(snapshot.data?.message??'',
              style:Theme.of(context).textTheme.bodySmall!
                  .copyWith(color:Appcolor.darkgreen) ,);
          }
          var newsContent= snapshot.data?.articles??[];
          return ListView.builder(
            itemBuilder:(context, index) {
              return NewsDetailedItem(news:newsContent[index] ,);
            },
            itemCount: newsContent.length,);
        },)
    );
  }
}
