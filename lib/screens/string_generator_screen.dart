import 'package:flutter/material.dart';

import './/functions/generate_string.dart';
import '../functions/benchmark_string.dart';
import '../functions/reverse_string.dart';

class StringGeneratorScreen extends StatefulWidget {
  const StringGeneratorScreen({super.key});

  @override
  _StringGeneratorScreenState createState() => _StringGeneratorScreenState();
}

class _StringGeneratorScreenState extends State<StringGeneratorScreen> {
  int stringLength = 0;
  String generatedString = "";
  int numOfRuns = 0;
  String results = "";

  void handleGenerate() {
    setState(() {
      generatedString = generateString(stringLength);
    });
  }

  void handleBenchmark() {
    final benchmarkResults =
        runBenchmarkString(reverseString, generatedString, numOfRuns);
    setState(() {
      results = benchmarkResults["results"];
      generatedString = benchmarkResults["sortedData"];
    });
  }

  void clearString() {
    setState(() {
      stringLength = 0;
      generatedString = "";
      results = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("String Generator"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    stringLength = int.parse(value);
                  });
                },
                decoration: const InputDecoration(
                  hintText: "Enter string length",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    numOfRuns = int.parse(value);
                  });
                },
                decoration: const InputDecoration(
                  hintText: "Enter number of runs for test",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: handleGenerate,
                child: const Text("Generate String"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: handleBenchmark,
                child: const Text("Reverse String"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: clearString,
                child: const Text("Clear"),
              ),
              const SizedBox(height: 10),
              Text(results, style: const TextStyle(fontSize: 20)),
              Text(generatedString, style: const TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
