import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/NewsResponse.dart';
import '../../utils/appcolor.dart';

class NewsDetails extends StatelessWidget {
  static const String routeName = 'news-details';
  const NewsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context)?.settings.arguments as News?;
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
        appBar:AppBar(title: Text('News title',)) ,
        body: Column(
          crossAxisAlignment:CrossAxisAlignment.stretch ,
          children: [
            SizedBox(
              height: height*.1,
              child:  ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: CachedNetworkImage(
                  imageUrl: args?.urlToImage??'failed',
                  placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                        color: Appcolor.darkgreen,
                      )),
                  errorWidget: (context, url, error) =>
                    Row(
                      children: [
                        Text('failed to load'),
                        Icon(Icons.error,size:32,color: Appcolor.darkgreen,),
                      ],
                    ),
                ),
              ),
            ),
            Text(args?.author??'000'),
            Text(args?.title??'000'),
            Text(args?.publishedAt??'000'),
          ],
        )
    );
  }
}
