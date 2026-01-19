import 'package:flutter/material.dart';

void main() {
  runApp(const CalApp());
}

// Main App
class CalApp extends StatelessWidget {
  const CalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalScreen(),
    );
  }
}

// Calculator Screen
class CalScreen extends StatefulWidget {
  const CalScreen({super.key});

  @override
  State<CalScreen> createState() => _CalScreenState();
}

// State Class
class _CalScreenState extends State<CalScreen> {
  String display = "";     // what user sees
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  void buttonPressed(String text) {
    setState(() {
      // Clear
      if (text == "C") {
        display = "";
        num1 = 0;
        num2 = 0;
        operand = "";
      }

      // Operators
      else if (text == "+" || text == "-" || text == "x" || text == "÷") {
        num1 = double.parse(display);
        operand = text;
        display = "$display $text ";
      }

      // Equal
      else if (text == "=") {
        List<String> parts = display.split(" ");
        num2 = double.parse(parts[2]);

        double result = 0;
        if (operand == "+") result = num1 + num2;
        if (operand == "-") result = num1 - num2;
        if (operand == "x") result = num1 * num2;
        if (operand == "÷") result = num1 / num2;

        display = result.toString();
      }

      // Numbers
      else {
        display += text;
      }
    });
  }

  Widget buildButton(String text) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(6),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey,
            padding: const EdgeInsets.all(22),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () => buttonPressed(text),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
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
        title: const Text(
          "Calculator",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Display
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(24),
            child: Text(
              display.isEmpty ? "0" : display,
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),

          // Buttons (4 per row)
          Row(children: [
            buildButton("7"),
            buildButton("8"),
            buildButton("9"),
            buildButton("÷"),
          ]),
          Row(children: [
            buildButton("4"),
            buildButton("5"),
            buildButton("6"),
            buildButton("x"),
          ]),
          Row(children: [
            buildButton("1"),
            buildButton("2"),
            buildButton("3"),
            buildButton("-"),
          ]),
          Row(children: [
            buildButton("C"),
            buildButton("0"),
            buildButton("="),
            buildButton("+"),
          ]),
        ],
      ),
    );
  }
}


