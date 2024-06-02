import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/NewsResponse.dart';
import '../../utils/appcolor.dart';

class NewsDetailedItem extends StatelessWidget {

   NewsDetailedItem({super.key,required this.news});
   //String? txt;
  News news;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.all(12),
          padding: EdgeInsets.all(10),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              border:Border.all(
                  color: Appcolor.darkgreen,
                  width: 3
              )
          ),
          child:Column(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),),
                child: CachedNetworkImage(
                  imageUrl: news?.urlToImage??'no img',
                  placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                        color: Appcolor.darkgreen,
                      )),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Text(news?.title??'',style:Theme.of(context).textTheme.bodyMedium!
                  .copyWith(color:Appcolor.darkgreen,fontSize:32 )),
              Text(news?.content??'no content',
                  style:Theme.of(context).textTheme.bodyMedium!
                      .copyWith(color:Colors.black,fontSize:27 )),
            ],
          ) ,
        ),
      ],
    );
  }
}
