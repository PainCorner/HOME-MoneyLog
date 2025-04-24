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
        appBar: AppBar(
          title: const Text('HOME-MoneyLog'),
          backgroundColor: Colors.blue,

        ),
        body: const Center(
          child: Text(
            '支出管理',
            style: TextStyle(fontSize: 40,color: Colors.blue),
          ),
        ),
        bottomNavigationBar: ,
      ),
    );
  }
}
