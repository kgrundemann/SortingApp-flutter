import 'dart:math';

import 'package:flutter/material.dart';

import 'bubble_sort.dart';
import 'insertion_sort.dart';
import 'quick_sort.dart';

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
      title: 'Sort',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Sort(),
    );
  }
}

class Sort extends StatefulWidget {
  const Sort({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SortState createState() => _SortState();
}

class _SortState extends State<Sort> {
  List<int> data = [];
  int numElements = 0;
  int numOfRuns = 0;
  String results = "";

  void handleNumElements(String text) {
    setState(() {
      numElements = int.parse(text);
    });
  }

  void setNumOfRuns(String value) {
    setState(() {
      numOfRuns = int.parse(value);
    });
  }

  void handleAdd() {
    List<int> newData = [];
    for (int i = 0; i < numElements; i++) {
      newData.add(Random().nextInt(100) + 1);
    }
    setState(() {
      data = newData;
    });
  }

  void runBenchmark(Function testFunction) {
    List<double> runtimes = [];
    for (int i = 0; i < numOfRuns; i++) {
      int start = DateTime.now().millisecondsSinceEpoch;
      setState(() {
        data = testFunction(data);
      });
      var end = DateTime.now().millisecondsSinceEpoch;
      var total = end - start;
      runtimes.add(total.toDouble());
    }
    setState(() {
      results = "Results for $numOfRuns runs:\n";
      results += "Max: ${runtimes.reduce(max)}";
      results += "Min: ${runtimes.reduce(min)}";
      results += "Average: ${runtimes.reduce((a, b) => a + b) / numOfRuns}\n";
    });
  }

  void handleClear() {
    setState(() {
      data = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                TextField(
                  onChanged: handleNumElements,
                  decoration: const InputDecoration(
                    hintText: "Enter number of elements",
                  ),
                  keyboardType: TextInputType.number,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextField(
                    onChanged: (text) {
                      setState(() {
                        numOfRuns = int.parse(text);
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: "Enter number of runs for test",
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: handleAdd,
                    child: const Text('Generate'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                    ),
                    onPressed: handleClear,
                    child: const Text('Clear'),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => runBenchmark(quickSort),
                    child: const Text('Quick Sort'),
                  ),
                  ElevatedButton(
                    onPressed: () => runBenchmark(bubbleSort),
                    child: const Text('Bubble Sort'),
                  ),
                  ElevatedButton(
                    onPressed: () => runBenchmark(insertionSort),
                    child: const Text('Insertion Sort'),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: data
                    .map(
                      (item) => Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          item.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
