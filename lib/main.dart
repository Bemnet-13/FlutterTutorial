import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black26,
        appBar: AppBar(
          title: Text('I am Poor!'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/iamverypoor.webp'),
          ),
        ),
      ),
    ),);
}