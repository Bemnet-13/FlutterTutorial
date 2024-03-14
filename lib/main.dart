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
            image: NetworkImage('https://cdn.shopify.com/s/files/1/1045/2442/products/Iamverypoor_shopify01_1024x1024.jpg?v=1593527267'),
          ),
        ),
      ),
    ),);
}