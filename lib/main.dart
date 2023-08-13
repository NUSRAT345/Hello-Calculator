import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = '';
  double _firstNumber = 0;
  double _secondNumber = 0;
  String _operation = '';

  void _handleButtonPressed(String value) {
    setState(() {
      if (value == '+' || value == '-' || value == '*' || value == '/') {
        _operation = value;
        _firstNumber = double.parse(_output);
        _output = '';
      } else if (value == '=') {
        _secondNumber = double.parse(_output);
        switch (_operation) {
          case '+':
            _output = (_firstNumber + _secondNumber).toString();
            break;
          case '-':
            _output = (_firstNumber - _secondNumber).toString();
            break;
          case '*':
            _output = (_firstNumber * _secondNumber).toString();
            break;
          case '/':
            if (_secondNumber != 0) {
              _output = (_firstNumber / _secondNumber).toString();
            } else {
              _output = 'Error';
            }
            break;
        }
        _operation = '';
      } else if (value == 'C') {
        _output = '';
        _operation = '';
        _firstNumber = 0;
        _secondNumber = 0;
      } else {
        _output += value;
      }
    });
  }

  Widget _buildButton(String text) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () => _handleButtonPressed(text),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _output,
                style: TextStyle(fontSize: 48),
              ),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.black,
          ),
          Row(
            children: [
              _buildButton('7'),
              _buildButton('8'),
              _buildButton('9'),
              _buildButton('/'),
            ],
          ),
          Row(
            children: [
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
              _buildButton('*'),
            ],
          ),
          Row(
            children: [
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
              _buildButton('-'),
            ],
          ),
          Row(
            children: [
              _buildButton('C'),
              _buildButton('0'),
              _buildButton('='),
              _buildButton('+'),
            ],
          ),
        ],
      ),
    );
  }
}
