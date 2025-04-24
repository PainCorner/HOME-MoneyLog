import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World App',
      home: Scaffold(
        appBar: AppBar(title: const Text('ボタン'),
          backgroundColor: Colors.blue,

        ),
        body: Center(
          child: ElevatedButton(
            onPressed: (){
              print("ボタンが押されました");
            },
            child: const Text("押してみて？"),
          ),
        ),
      ),
    );
  }
}
