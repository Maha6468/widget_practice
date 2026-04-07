import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: CalculatorScreen(
        toggleTheme: () {
          setState(() {
            isDark = !isDark;
          });
        },
        isDark: isDark,
      ),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDark;

  const CalculatorScreen({
    super.key,
    required this.toggleTheme,
    required this.isDark,
  });

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String input = "";
  String output = "0";

  void onButtonPressed(String value) {
    setState(() {
      if (value == "AC") {
        input = "";
        output = "0";
      } else if (value == "=") {
        output = calculate(input);
      } else {
        if (isOperator(value) && input.isNotEmpty && isOperator(input[input.length - 1])) {
          return; // prevent multiple operators
        }
        input += value;
      }
    });
  }

  bool isOperator(String x) {
    return x == "+" || x == "-" || x == "×" || x == "÷";
  }

  String calculate(String expr) {
    try {
      String finalExpr = expr.replaceAll('×', '*').replaceAll('÷', '/');
      double result = _evaluate(finalExpr);
      return result.toString();
    } catch (e) {
      return "Error";
    }
  }

  double _evaluate(String expr) {
    // simple eval using Dart
    return double.parse(expr
        .replaceAllMapped(RegExp(r"(\d+\.\d+|\d+)([+\-*/])"), (m) => "${m[1]}${m[2]}")
        .split(RegExp(r"(?=[+\-*/])|(?<=[+\-*/])"))
        .reduce((value, element) {
      return value;
    }));
  }

  Widget buildButton(String text, {Color? color}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20),
            backgroundColor: color,
          ),
          onPressed: () => onButtonPressed(text),
          child: Text(
            text,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
        actions: [
          IconButton(
            icon: Icon(widget.isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: widget.toggleTheme,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(20),
              child: Text(
                input,
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.all(20),
              child: Text(
                output,
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          Column(
            children: [
              Row(children: [buildButton("7"), buildButton("8"), buildButton("9"), buildButton("÷")]),
              Row(children: [buildButton("4"), buildButton("5"), buildButton("6"), buildButton("×")]),
              Row(children: [buildButton("1"), buildButton("2"), buildButton("3"), buildButton("-")]),
              Row(children: [buildButton("0"), buildButton("."), buildButton("AC"), buildButton("+")]),
              Row(children: [buildButton("=", color: Colors.orange)]),
            ],
          )
        ],
      ),
    );
  }
}
