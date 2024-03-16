
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:testtt/third_screen.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blueGrey,
        
        child: Column(
          children: [
            ElevatedButton(onPressed: (){}, child: Text("btn")),
            ElevatedButton(onPressed: (){}, child: Text("btn")),
            //space
            //space
          ],

        ),
      ),
    );
  }

  Future<Post> makeRequest() async {
    print("=====> start");

    await Future.delayed(Duration(seconds: 2));
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
    print("=====> finish");
    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      Post post = Post.fromJson(jsonDecode(response.body));
      print("=====> title ==>${post.title}  description==>${post.body}");
      return post ;
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception.
      print("=====> ERRORR");
      throw Exception('Failed to load post');
    }
  }
}

class Post {
  final int id;
  final String title;
  final String body;

  Post({required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
