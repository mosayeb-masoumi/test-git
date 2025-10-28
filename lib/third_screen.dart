import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

import 'package:testtt/model/result.dart'; // for the utf8.encode method

class ThirdScreen extends StatefulWidget {

  final String? latestLink ;
  const ThirdScreen({Key? key, this.latestLink}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {

    var a = widget.latestLink;
    var d = a;

    Result<String>? _result;

    Future<void> _fetchData() async {
      setState(() {
        _result = null; // reset
      });

      await Future.delayed(const Duration(seconds: 1)); // simulate network delay

      // Randomly return success or error
      final isSuccess = DateTime.now().second % 2 == 0;
      if (isSuccess) {
        setState(() {
          _result = const Result.success('Data loaded successfully!');
        });
      } else {
        setState(() {
          _result = const Result.error('Failed to load data. Try again.');
        });
      }
    }


    return Scaffold(
      appBar: AppBar(
        title: Text("Parent and Child Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(widget.latestLink??"default")
          ],
        ),
      ),
    );
  }
}
