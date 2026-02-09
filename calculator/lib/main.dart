import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}


class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator Application',
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String output = "0";
String _output = "0";
double num1 = 0;
double num2 = 0;
String operand = "";

void buttonPressed(String buttonText) {
  setState(() {
    if (buttonText == "c") {
      _output = "0";
      output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } 
    else if (buttonText == "+" || buttonText == "-" || buttonText == "*" || buttonText == "/") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } 
    else if (buttonText == ".") {
      if (!_output.contains(".")) {
        _output += ".";
      }
    } 
    else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "*") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      operand = "";
    } 
    else {
      _output += buttonText;
    }

    // Remove leading zeros
    output = double.parse(_output).toString();
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Calculator Application',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          // Output display
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            child: Text(
              output,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          const Divider(color: Colors.grey),

          // Buttons Area
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    buildButton("7", Colors.grey[800]!),
                    buildButton("8", Colors.grey[800]!),
                    buildButton("9", Colors.grey[800]!),
                    buildButton("/", Colors.grey[800]!),
                  ],
                ),
                Row(
                  children: [
                    buildButton("4", Colors.grey[800]!),
                    buildButton("5", Colors.grey[800]!),
                    buildButton("6", Colors.grey[800]!),
                    buildButton("*", Colors.grey[800]!),
                   
                  ],
                ),
                Row(
                  children: [
                    buildButton("1", Colors.grey[800]!),
                    buildButton("2", Colors.grey[800]!),
                    buildButton("3", Colors.grey[800]!),
                    buildButton("-", Colors.grey[800]!),
                   
                  ],
                ),
                
                Row(
                  children: [
                    buildButton(".", Colors.grey[800]!),
                    buildButton("0", Colors.grey[800]!),
                    buildButton("c", Colors.grey[800]!),
                    buildButton("+", Colors.grey[800]!),
                   
                  ],
                ),
                
                Row(
                  children: [
                    buildButton("=", Colors.green),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );

    
  }

  Widget buildButton(String text, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(6),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.all(18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: ()=> buttonPressed(text),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  
  }
}