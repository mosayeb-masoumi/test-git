import 'dart:async';

import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  StreamController<int> _controller = StreamController<int>();
  int _count = 0;
  bool _isCounting = false;

  void _startCounting() {
    _isCounting = true;
    _controller.add(_count); // Emit the initial count
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_isCounting) {
        _count++;
        _controller.add(_count); // Emit the updated count
      } else {
        timer.cancel(); // Stop the timer if counting is stopped
      }
    });
  }

  void _stopCounting() {
    _isCounting = false; // Set the flag to stop counting
    // _controller.close(); // Close the stream controller
  }
  // Stream<int> counterStream() async*{
  //   int count = 0;
  //   while(true) {
  //     await Future.delayed(Duration(seconds: 1));
  //     yield count ++ ;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    Size size2 = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [

            StreamBuilder(
                stream:_controller.stream,
                builder: (context, snapshot) {

                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Container();
                  }else if(snapshot.hasError){
                    return Text('Error: ${snapshot.error}');
                  }else {
                    return Text(
                      'Count: ${snapshot.data ?? 0}',
                      style: TextStyle(fontSize: 24),
                    );
                  }
                },
            ),


            ElevatedButton(
                onPressed: () async {
                  _startCounting();
                },
                child: const Text("Start counting")),

            ElevatedButton(
                onPressed: () async {
                  _stopCounting();
                },
                child: const Text("Stop counting")),
          ],
        ),
      ),
    );
  }

  void handleApiResponse(ApiResponse response) {
    switch(response) {
      case ApiSuccess success:
        print("Success: ${success.data}");
        break;
      case ApiError error:
        // TODO: Handle this case.
        throw UnimplementedError();
      case ApiLoading():
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }
}


sealed class ApiResponse {}

class ApiSuccess extends ApiResponse {
  final String data;
  ApiSuccess(this.data);
}

class ApiError extends ApiResponse {
  final String errorMessage;
  ApiError(this.errorMessage);
}

class ApiLoading extends ApiResponse {}












