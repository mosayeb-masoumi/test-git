import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert'; // for the utf8.encode method

class ThirdScreen extends StatelessWidget {
  ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    StringBuffer buffer = StringBuffer();

    // Append strings to the buffer
    buffer.writeln('This is line 1.');
    buffer.writeln('This is line 2.');
    buffer.writeln('This is line 3.');

    var a = buffer;
    // Convert the buffer to a string
    String result = buffer.toString();
    var dd = result;


    return Scaffold(
      appBar: AppBar(
        title: Text("Parent and Child Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(onPressed: (){
              var bytes = utf8.encode("foobar"); // data being hashed

              var digest = sha1.convert(bytes);

              print("Digest as bytes: ${digest.bytes}");
              print("Digest as hex string: $digest");


              var key = utf8.encode('p@ssw0rd');
              var bytess = utf8.encode("foobar");

              var hmacSha256 = Hmac(sha256, key); // HMAC-SHA256
              var digestt = hmacSha256.convert(bytess);

              print("HMAC digest as bytes: ${digestt.bytes}");
              print("HMAC digest as hex string: $digestt");


            }, child: Text("click"))

          ],
        ),
      ),
    );
  }
}
