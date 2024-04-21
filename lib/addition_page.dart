import 'dart:math';

import 'package:flutter/material.dart';

class AdditionPage extends StatefulWidget {
  const AdditionPage({super.key});

  @override
  State<AdditionPage> createState() => _AdditionPageState();
}

class _AdditionPageState extends State<AdditionPage> {
  String _userInput = '';
  late int _first;
  late int _second;
  late int _score;
  final Random _randomizer = Random();
  final ButtonStyle _numberButtonStyle = ElevatedButton.styleFrom(
      fixedSize: const Size(100, 70),
      shape: const RoundedRectangleBorder(
        // Defines the shape of the button
        borderRadius: BorderRadius
            .zero, // Makes the edges sharp, maintaining a square shape
      ));

  List<Widget> _createNumberButtons(List<int> numbers) {
    return numbers
        .map((number) => ElevatedButton(
      style: _numberButtonStyle,
      onPressed: () => _updateUserInput('$number'),
      child: Text('$number'),
    ))
        .toList();
  }

  _AdditionPageState() {
    _first = _randomizer.nextInt(10);
    _second = _randomizer.nextInt(10);
    _score = 0;
  }

  void _updateUserInput(String value) {
    setState(() {
      _userInput += value;
    });
  }

  void _deleteLastInput() {
    if (_userInput.isNotEmpty) {
      setState(() {
        _userInput = _userInput.substring(0, _userInput.length - 1);
      });
    }
  }

  void _checkAnswer() {
    // Check the user's answer. Here, for demonstration, we assume the answer to '23 * 5' is '115'
    if (_userInput == (_first + _second).toString()) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Correct!'),
        backgroundColor: Colors.green,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Incorrect! Try again.'),
        backgroundColor: Colors.red,
      ));
    }
    // Reset the user input after checking
    setState(() {
      _userInput = '';
      _first = _randomizer.nextInt(10);
      _second = _randomizer.nextInt(10);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Additions'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // Centers the row along the main axis
              children: <Widget>[
                Text(
                  '$_first', // First operand
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right, // Align text to the right
                ),
                const SizedBox(width: 8),
                // Adds a small space between the first operand and the multiplication sign
                Text(
                  '+', // Multiplication sign
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(width: 8),
                // Adds a small space between the multiplication sign and the second operand
                Text(
                  '$_second', // Second operand
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left, // Align text to the left
                ),
                const SizedBox(width: 8),
                Text(
                  '=', // Multiplication sign
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(width: 8),

                Text(
                  _userInput,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Wrap(
                spacing: 10,
                alignment: WrapAlignment.center,
                children: _createNumberButtons([1, 2, 3])),
            const SizedBox(height: 10),
            Wrap(
                spacing: 10,
                alignment: WrapAlignment.center,
                children: _createNumberButtons([4, 5, 6])),
            const SizedBox(height: 10),
            Wrap(
                spacing: 10,
                // Horizontal space between buttons
                alignment: WrapAlignment.center,
                // Center the buttons in the wrap
                children: _createNumberButtons([7, 8, 9])),
            const SizedBox(height: 10),
            Wrap(
                spacing: 10,
                alignment: WrapAlignment.center,
                children: List.of(List<Widget>.empty())
                  ..add(ElevatedButton(
                      style: _numberButtonStyle,
                      onPressed: () {
                        _deleteLastInput();
                      },
                      child: const Icon(Icons.backspace)))
                  ..add(ElevatedButton(
                      style: _numberButtonStyle,
                      onPressed: () {
                        _updateUserInput('0');
                      },
                      child: const Text('0')))
                  ..add(ElevatedButton(
                      style: _numberButtonStyle,
                      onPressed: _checkAnswer,
                      child: const Text('Check')))),
          ],
        ),
      ),
    );
  }
}
