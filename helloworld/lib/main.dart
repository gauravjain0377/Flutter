import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) { // context = location
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyApp',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'MyApp',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
              fontSize: 25,
            ),
          ),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            color: Colors.green,
            child: Text(
              'Hello World',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 40,
              ),
            ),
          ),
        ),
      ),
    );
  }
}