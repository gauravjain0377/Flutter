import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
        body: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Colors.green,
                padding: EdgeInsets.all(15),
                child: Text(
                  'Hello',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                color: Colors.green,
                padding: EdgeInsets.all(15),
                child: Text(
                  'World',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                color: Colors.green,
                padding: EdgeInsets.all(15),
                child: Text(
                  'India',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                color: Colors.green,
                padding: EdgeInsets.all(15),
                child: Text(
                  'India',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              
              
            
            ],
          ),
        ),
      ),
    );
  }
}