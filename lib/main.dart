import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "ようこそ",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Container(
            width: 300,
            height: 150,
            color: Colors.greenAccent,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 4.0),
                ),
                labelText: 'テキストを入力',
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
