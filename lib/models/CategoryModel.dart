import 'package:flutter/material.dart';

class CategoryModel{
  String id;
  String title;
  Color color;
  String imageUrl;

  CategoryModel({required this.id,required this.title,
  required this.color,required this.imageUrl});

  static List<CategoryModel> getCatgryfragmnt(){
      return[
        CategoryModel(id:'sports' , title: 'Sports', color: Colors.red,
            imageUrl: 'assets/imgs/sports.png'),
        CategoryModel(id:'general', title:'General', color:Colors.green.shade400,
            imageUrl:'assets/imgs/Politics.png'),
        CategoryModel(id: 'health', title: 'Health', color:Colors.pink,
            imageUrl: 'assets/imgs/health.png'),
        CategoryModel(id: 'science', title: 'Science', color:Colors.blue.shade800,
            imageUrl: 'assets/imgs/science.png'),
        CategoryModel(id: 'business', title:'Business', color: Colors.brown,
            imageUrl: 'assets/imgs/bussines.png'),
        CategoryModel(id: 'entertainment', title: 'Entertainment',
            color:Colors.deepOrange, imageUrl: 'assets/imgs/environment.png'),
      ];
  }
}