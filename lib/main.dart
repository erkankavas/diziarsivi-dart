import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:diziarsivi/apis/api.dart';
import 'package:diziarsivi/models/article.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dizi Arşivi',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Son Eklenenler Diziler'),
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  List<Article> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: const Text('Son Eklenenler Diziler', style: TextStyle(
    color: Colors.white
  )),
        backgroundColor: Colors.black, // Status bar color
        
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, position) {
          return ListTile(title: Text(list[position].bunny!));
        },
      ),
    );
  }

  getArticles() {
    Api.getArticles().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.list = list.map((model) => Article.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getArticles();
  }

}
