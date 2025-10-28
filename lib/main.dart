import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:testtt/home_page.dart';
import 'package:testtt/map_screen.dart';
import 'package:testtt/test_screen.dart';
import 'package:testtt/third_screen.dart';

import 'package:app_links/app_links.dart';

void main() {
  // FlutterError.onError = (FlutterErrorDetails details) {
  //   FlutterError.dumpErrorToConsole(details);
  //   runApp(ErrorWidgetClass(details));
  // };
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  // final AppLinks _appLinks = AppLinks();  // singleton
  // StreamSubscription<Uri?>? _sub;
  // Uri? _latestUri;

  late final AppLinks _appLinks;
  StreamSubscription<String>? _linkSubscription;
  String? _latestUri;

  List<String> list = ["ali","reza","mina"];

  @override
  void initState() {
    _initializeAppLinks();
    super.initState();

    completerMethod();
  }

  Future<void> completerMethod() async {
    // final completer = Completer<String>();
    final completer = Completer<List<String>>();

    for(int i= 0 ;i <list.length; i++){

      list[i]= "${list[i]}t";
      Future.delayed(Duration(seconds: 5),() {

        completer.complete(list);
      });

    }

    // Future.delayed(Duration(seconds: 10),() {
    //
    //   completer.complete("Task finished Succesfully");
    // });

    final result = await completer.future;


    var a = result ;

  }



  @override
  void dispose() {
    _linkSubscription?.cancel();
    super.dispose();
  }

  Future<void> _initializeAppLinks() async {
    _appLinks = AppLinks();
    _linkSubscription = _appLinks.allStringLinkStream.listen((url) {
      var d = _latestUri;
      setState(() {
        _latestUri = url;
      });

      // router.push(url); // with your GoRouter instance
    });
  }

  // void _initializeAppLinks() {
  //   // Listen to in-app links (when already running)
  //   _sub = _appLinks.uriLinkStream.listen((Uri? uri) {
  //     if (uri != null) {
  //       _handleIncomingLink(uri);
  //     }
  //   }, onError: (err) {
  //     debugPrint('app_links stream error: $err');
  //   });
  //
  //   // Also check initial (cold start) link
  //   _appLinks.getInitialAppLink().then((Uri? uri) {
  //     if (uri != null) {
  //       _handleIncomingLink(uri);
  //     }
  //   }).catchError((err) {
  //     debugPrint('Error in getInitialAppLink: $err');
  //   });
  //
  // }
  //
  // void _handleIncomingLink(Uri uri) {
  //   debugPrint('Received link: $uri');
  //   setState(() {
  //     _latestUri = uri;
  //   });
  //
  //   // Example: parse the URI and navigate
  //   if (uri.scheme == 'http' && uri.host == 'come.example.com') {
  //     // e.g. myapp://profile/123
  //     final segments = uri.pathSegments;
  //     if (segments.isNotEmpty) {
  //       final id = segments[0];
  //       var a = id;
  //     }
  //   }
  // }

  // @override
  // void dispose() {
  //   _sub?.cancel();
  //   super.dispose();
  // }


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
        home: ThirdScreen(latestLink: _latestUri),
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
