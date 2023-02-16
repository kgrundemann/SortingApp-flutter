import 'package:flutter/material.dart';

import '../functions/benchmark_fibonacci.dart';
import '../functions/fibonacci.dart';

class FibonacciScreen extends StatefulWidget {
  const FibonacciScreen({super.key});

  @override
  _FibonacciScreenState createState() => _FibonacciScreenState();
}

class _FibonacciScreenState extends State<FibonacciScreen> {
  int input = 0;
  String result = '';
  int numOfRuns = 0;
  String results = '';

  void handleBenchmark() async {
    final benchmarkResult =
        runBenchmarkFibonacci(calculateFibonacci, input, numOfRuns);
    setState(() {
      results = benchmarkResult['results'];
      result = benchmarkResult['sortedData'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fibonacci Sequence"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  input = int.parse(value);
                });
              },
              decoration: const InputDecoration(
                hintText: 'Enter number',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  numOfRuns = int.parse(value);
                });
              },
              decoration: const InputDecoration(
                hintText: 'Enter number of runs',
              ),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: handleBenchmark,
              child: const Text('Calculate'),
            ),
            Text(
              results,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              'Result: $result',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
