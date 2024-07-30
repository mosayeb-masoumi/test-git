
import 'dart:convert';
// import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:testtt/third_screen.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.redAccent,
        
        child: Column(
          children: [

            // TextField(
            //   controller: _controller,
            //   keyboardType: TextInputType.number,
            //   inputFormatters: [
            //     FilteringTextInputFormatter.digitsOnly,
            //     PersianDateFormatter(),
            //   ],
            //   decoration: InputDecoration(
            //     labelText: 'Enter Persian Date (YYYY/MM/DD)',
            //   ),
            // ),
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
