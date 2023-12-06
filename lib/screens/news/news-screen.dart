import 'package:flutter/material.dart';

import '../../Api-manager.dart';
import '../../models/NewsResponse.dart';
import '../../models/SourceResponse.dart';
import '../../utils/appcolor.dart';
import 'NewsItem.dart';

class NewsScreen extends StatelessWidget {
  static const String routeName='newscon';
  //NewsContainer({required this.source});
  Source? source;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(title: Text('News')),
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
                  .copyWith(color:Colors.black ) ,);
          }
          if(snapshot.data?.status=='error') {
            return Text(snapshot.data?.message??'',
              style:Theme.of(context).textTheme.bodySmall!
                  .copyWith(color:Colors.black ) ,);
          }
          var newsList= snapshot.data?.articles??[];
          return ListView.builder(
              itemBuilder:(context, index) {
                return NewsItem(news:newsList[index]);
              },
            itemCount: newsList.length,);
        },));
  }
}