import 'package:detecto_app/Api-manager.dart';
import 'package:detecto_app/models/SourceResponse.dart';
import 'package:detecto_app/screens/news/category/TabContainer.dart';
import 'package:flutter/material.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key});
  static const String routeName = 'CategoryDetails';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(title: Text('News')),
      body: FutureBuilder<SourceResponse>
        (
          future: ApiManager.getSources(),
          builder:(context, snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.blueGrey,
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
            var sourcesList= snapshot.data?.sources??[];
            return TabContainer(sourcesList:sourcesList );
          },),
    );
  }
}
