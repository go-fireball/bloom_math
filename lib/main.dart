import 'package:bloom_math/subtraction_page.dart';
import 'package:flutter/material.dart';

import 'addition_page.dart';
import 'division_page.dart';
import 'home_page.dart';
import 'multiplication_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloom Multiply',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/additions': (context) => const AdditionPage(),
        '/subtractions': (context) => const SubtractionPage(),
        '/multiplications': (context) => const MultiplicationPage(),
        '/divisions': (context) => const DivisionPage(),
      },
    );
  }
}
