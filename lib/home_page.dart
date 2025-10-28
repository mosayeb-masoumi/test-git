
import 'dart:convert';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  double _sheetPosition = 0.5;
  final double _dragSensitivity = 600;

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

            ElevatedButton(onPressed: (){}, child: Text("btn f1")),
            ElevatedButton(onPressed: (){}, child: Text("btn f1")),

            ElevatedButton(onPressed: (){}, child: Text("btn from feature1")),

          ],

        ),
      ),
    );

  }


}




