import 'dart:convert';

import 'package:detecto_app/models/SourceResponse.dart';
import 'package:http/http.dart' as http;

import 'models/NewsResponse.dart';

class ApiManager{
  static const String baseUrl='newsapi.org';
  static const String sourceApi='/v2/top-headlines/sources';
  static const String newsApi='/v2/everything';

  static Future<SourceResponse> getSources()async{
    /*
   https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
    */

    Uri url=Uri.https(baseUrl,sourceApi, {
      'apiKey': '9d5c971e2891457e9aeabccb94a7a263'
    });
    try{
      var response= await http.get(url);
      var bodyString=response.body;
      var json=jsonDecode(bodyString);
      return SourceResponse.fromJson(json);
    }catch(e)
       {throw e;}

  }

  static Future<NewsResponse> getNewsById(String sourceId)async{
    /*
  https://newsapi.org/v2/everything?q=bitcoin&apiKey=9d5c971e2891457e9aeabccb94a7a263
    */

    Uri url=Uri.https(baseUrl,newsApi, {
      'apiKey': '9d5c971e2891457e9aeabccb94a7a263',
      'sources': sourceId,
      'q':'football'
    });
    try{
      var response= await http.get(url);
      var bodyString=response.body;
      var json=jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    }catch(e)
    {throw e;}

  }
}