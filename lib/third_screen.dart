
import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.pinkAccent,
        
        child: Column(
          children: [
            Center(child: ElevatedButton(onPressed: (){}, child: Text("third screen button"))),
            ElevatedButton(onPressed: (){}, child: Text("btn")),
            ElevatedButton(onPressed: (){}, child: Text("btn2")),

          ],
        ),
      ),
    );
  }
}
