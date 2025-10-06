
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
      body: Stack(
        children: [
          Center(
            child: Text('Content behind the sheet'),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.3, // Take 30% of screen height initially
            minChildSize: 0.1, // Minimum size to take 10% of screen height
            maxChildSize: 0.8, // Maximum size to take 80% of screen height
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                color: Colors.blue[100],
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 25,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text('Item $index'),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );

  }


}




