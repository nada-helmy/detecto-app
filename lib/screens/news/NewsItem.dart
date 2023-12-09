import 'package:cached_network_image/cached_network_image.dart';
import 'package:detecto_app/utils/appcolor.dart';
import 'package:flutter/material.dart';

import '../../models/NewsResponse.dart';

class NewsItem extends StatelessWidget {
  NewsItem({required this.news});
  News news;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.all(12),
          padding: EdgeInsets.all(15),
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
                  imageUrl: news.urlToImage??'',
                  placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                        color: Appcolor.darkgreen,
                      )),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Text(news.title??'',style:Theme.of(context).textTheme.bodyMedium!
                  .copyWith(color:Appcolor.darkgreen,fontSize:30 )),
            ],
          ) ,
        ),
      ],
    );
  }
}
