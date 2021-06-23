import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_flutter_app/components/customlistile.dart';
import 'package:news_flutter_app/services/api_service.dart';

import 'model/article_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Apiservice client = Apiservice();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'news app',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),

      //now let's call the api service with furture builder widget

      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          //let's check if we got a response or not

          // if (snapshot.hasData) {
          //   return Center(
          //     child: Text('success'),
          //   );
          // }
          if (snapshot.hasData) {
            //now let's make a list of articles
            List<Article> articles = snapshot.data;
            return ListView.builder(
              //now let's create the our custom design
              itemCount: articles.length,
              itemBuilder: (context, index) =>
                  /* ListTile(
                title: Text(articles[index].title),
              ),
               */
                  customListTile(articles[index], context),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
