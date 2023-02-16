import 'package:flutter/material.dart';

import '../functions/benchmark_prime.dart';
import '../functions/prime_numbers.dart';

class PrimeNumbersScreen extends StatefulWidget {
  const PrimeNumbersScreen({super.key});

  @override
  _PrimeNumbersScreenState createState() => _PrimeNumbersScreenState();
}

class _PrimeNumbersScreenState extends State<PrimeNumbersScreen> {
  int numElements = 0;
  List<int> result = [];
  String results = "";
  int numOfRuns = 0;

  handleBenchmark() {
    final Map<String, dynamic> benchmarkResult =
        runBenchmarkPrime(calculatePrimeNumbers, numElements, numOfRuns);
    setState(() {
      results = benchmarkResult['results'];
      result = benchmarkResult['sortedData'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prime Numbers"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      numElements = int.tryParse(value) ?? 0;
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter number of elements",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      numOfRuns = int.tryParse(value) ?? 0;
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter number of runs for test",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: handleBenchmark,
                child: const Text("Generate Prime Numbers"),
              ),
              Text(results),
              Text(result.join(", ")),
            ],
          ),
        ),
      ),
    );
  }
}
