import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle numberButtonStyle = ElevatedButton.styleFrom(
        fixedSize: const Size(200, 100),
        shape: const RoundedRectangleBorder(
          // Defines the shape of the button
          borderRadius: BorderRadius
              .zero, // Makes the edges sharp, maintaining a square shape
        ));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloom Math'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/additions');
              },
              style: numberButtonStyle,
              child: const Text('Addition'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/subtractions');
              },
              style: numberButtonStyle,
              child: const Text('Subtraction'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/multiplications');
              },
              style: numberButtonStyle,
              child: const Text('Multiplication'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/divisions');
              },
              style: numberButtonStyle,
              child: const Text('Division'),
            ),
          ],
        ),
      ),
    );
  }
}
