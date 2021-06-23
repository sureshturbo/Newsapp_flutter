import 'dart:convert';
//import 'dart:html';

import 'package:http/http.dart' as http;
import 'package:news_flutter_app/model/article_model.dart';

//now let's make the http request services
//this class will allows us to make a simple get http request
//from the api and get the articles and then return a list of articles

class Apiservice {
  //let's add an endpoint URL,you can check the website doc
  // and learn about the different endpoint
  //for example i'm going to single endpoint

//Note: apikey inserted
  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=5c29d6741e4f4771a4fb61b3a78bfab5";

  var url = Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=5c29d6741e4f4771a4fb61b3a78bfab5");

  //now lets's create the http request function
  //but first we import http package
  Future<List<Article>> getArticle() async {
    //Response res = await get(endPointUrl);
    http.Response res = await http.get(url);

    //first of all let's check that we got a 200 status code: this mean that the  request was a success
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      //this line will be allow us to get the different articles fron the json file and putting them list
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("can't get the articles");
    }
  }
}
