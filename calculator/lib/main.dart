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
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String display = "";
  double first = 0;
  String op = "";

  void onTap(String value) {
    setState(() {
      if (value == "C") {
        display = "";
        first = 0;
        op = "";
      } else if (value == "+" || value == "-" || value == "×" || value == "÷") {
        first = double.parse(display);
        op = value;
        display = "";
      } else if (value == "=") {
        double second = double.parse(display);
        double result = 0;

        if (op == "+") result = first + second;
        if (op == "-") result = first - second;
        if (op == "×") result = first * second;
        if (op == "÷") result = first / second;

        display = result.toString();
      } else {
        display += value;
      }
    });
  }

  Widget calcButton(String text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20),
            backgroundColor: Colors.green,
          ),
          onPressed: () => onTap(text),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("MyApp"),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(20),
            child: Text(
              display,
              style: const TextStyle(fontSize: 40),
            ),
          ),

          Row(children: [
            calcButton("7"),
            calcButton("8"),
            calcButton("9"),
            calcButton("÷"),
          ]),
          Row(children: [
            calcButton("4"),
            calcButton("5"),
            calcButton("6"),
            calcButton("×"),
          ]),
          Row(children: [
            calcButton("1"),
            calcButton("2"),
            calcButton("3"),
            calcButton("-"),
          ]),
          Row(children: [
            calcButton("C"),
            calcButton("0"),
            calcButton("="),
            calcButton("+"),
          ]),
        ],
      ),
    );
  }
}