import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/Model/News.dart';
import 'myAppBar.dart';
import 'package:http/http.dart' as http;


class CustomNewsCard extends StatelessWidget {
  final String url = "http://content.guardianapis.com/us-news?show-references=author&show-fields=all&api-key=test";
  

  Future<List<News>> fetchNews() async {
    var result = await http.get(url);
    if (result.statusCode == 200) {
      var currNews = json.decode(result.body)['response']['results'] as List;
      print(currNews);
      List<News> newsList =
          currNews.map((currNewsJson) => News.fromJson(currNewsJson)).toList();
      return newsList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(primarySwatch: Colors.red),
      home: Scaffold(
        appBar: myAppBar(
          title: Title(color: Colors.grey, child: Text("News Headlines")),
          hasBack: myBackButton(context),
        ),
        body: Center(
          child: FractionallySizedBox(
            widthFactor: 0.7,
              child: FutureBuilder(
                  future: fetchNews(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      var newsLength = snapshot.data.length;
                      return ListView.builder(
                          itemCount: newsLength,
                          itemBuilder: (context, index) {
                            return CardWidget(snapshot.data[index]);
                          });
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  })),
        ),
      ),
    );
  }

  Widget myBackButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => Navigator.pop(context),
    );
  }

  Widget CardWidget(News news) {
    return  Card(
      margin: EdgeInsets.all(20),
          elevation: 5.0,
              child: Column(
          children: [
              Image.network(news.fields.thumbnail),
              SizedBox(
                height: 20.0,
              ),
              Text(
                news.webTitle,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0)
          ],
        ),
            );
  }
}
