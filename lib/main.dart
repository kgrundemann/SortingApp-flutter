import 'package:flutter/material.dart';

import 'screens/elements_generator_screen.dart';
import 'screens/fibonacci_screen.dart';
import 'screens/home_screen.dart';
import 'screens/prime_numbers_screen.dart';
import 'screens/sorting_screen.dart';
import 'screens/string_generator_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/sorting': (context) => const SortingScreen(),
        '/fibonacci': (context) => const FibonacciScreen(),
        '/prime': (context) => const PrimeNumbersScreen(),
        '/elements': (context) => const ElementsGeneratorScreen(),
        '/string': (context) => const StringGeneratorScreen()
      },
    );
  }
}
