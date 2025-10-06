import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:testtt/home_page.dart';
import 'package:testtt/map_screen.dart';
import 'package:testtt/test_screen.dart';
import 'package:testtt/third_screen.dart';

void main() {
  // FlutterError.onError = (FlutterErrorDetails details) {
  //   FlutterError.dumpErrorToConsole(details);
  //   runApp(ErrorWidgetClass(details));
  // };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: MapScreen(),
        // home: TestScreen(),
        home: ThirdScreen(),
      ),
    );
  }
}

class ErrorWidgetClass extends StatefulWidget {
  final FlutterErrorDetails errorDetails;

  const ErrorWidgetClass(this.errorDetails, {super.key});

  @override
  State<ErrorWidgetClass> createState() => _ErrorWidgetClassState();
}

class _ErrorWidgetClassState extends State<ErrorWidgetClass> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
        // color: Colors.lightBlueAccent,
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomPaint(
                size: Size(1, 100),
                // Width of 1 for a vertical line and height of 100
                painter: DashedLinePainter(),
              )
            ],
          ),
        ),
      )),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black // Color of the dashed line
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2; // Width of the dashed line

    // Parameters for drawing dashes
    final dashLength = 5.0; // Length of each dash
    final dashSpace = 3.0; // Space between dashes
    final totalHeight = size.height;

    // Draw the dashes
    double startY = 0;
    while (startY < totalHeight) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY + dashLength),
        paint,
      );
      startY += dashLength + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // No need to repaint in this case
  }
}
