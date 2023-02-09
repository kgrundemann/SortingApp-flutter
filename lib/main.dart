import 'dart:math';

import 'package:flutter/material.dart';

import 'bubbleSort.dart';
import 'insertionSort.dart';
import 'quickSort.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sort',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Sort(),
    );
  }
}

class Sort extends StatefulWidget {
  @override
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

  void handleAdd() {
    List<int> newData = [];
    for (int i = 0; i < numElements; i++) {
      newData.add(Random().nextInt(100) + 1);
    }
    setState(() {
      data = newData;
    });
  }

  void handleQuickSort() {
    int high = data.length - 1;
    int low = 0;
    List<int> sortedData = quickSort(data, low, high);
    setState(() {
      data = sortedData;
    });
  }

  void handleBubbleSort() {
    List<int> sortedData = bubbleSort(data);
    setState(() {
      data = sortedData;
    });
  }

  void handleInsertionSort() {
    List<int> sortedData = insertionSort(data);
    setState(() {
      data = sortedData;
    });
  }

  void runBenchmark(Function testFunction) {
    List<double> runtimes = [];
    for (int i = 0; i < numOfRuns; i++) {
      int start = DateTime.now().millisecondsSinceEpoch;
      setState(() {
        data = testFunction(data);
      });
      int end = DateTime.now().millisecondsSinceEpoch;
      double total = (end - start) as double;
      runtimes.add(total);
    }
    results = "Results for $numOfRuns runs:\n";
    results += "Max: ${runtimes.reduce(max)}";
    results += "Min: ${runtimes.reduce(min)}";
    results += "Average: ${runtimes.reduce((a, b) => a + b) / numOfRuns}\n";
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
            Container(
              child: Column(
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
                    onPressed: handleQuickSort,
                    child: const Text('Quick Sort'),
                  ),
                  ElevatedButton(
                    onPressed: handleBubbleSort,
                    child: const Text('Bubble Sort'),
                  ),
                  ElevatedButton(
                    onPressed: handleInsertionSort,
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
