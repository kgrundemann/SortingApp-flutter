import 'dart:math';

import 'package:flutter/material.dart';

import './/functions/quick_sort.dart';
import '../functions/benchmark_sorting.dart';
import '../functions/bubble_sort.dart';
import '../functions/insertion_sort.dart';

void main() => runApp(const SortingScreen());

class SortingScreen extends StatefulWidget {
  const SortingScreen({super.key});

  @override
  _SortingScreenState createState() => _SortingScreenState();
}

class _SortingScreenState extends State<SortingScreen> {
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

  void handleBenchmark(testFunction) async {
    final benchmarkResult = runBenchmark(testFunction, data, numOfRuns);
    setState(() {
      results = benchmarkResult['results'];
      data = benchmarkResult['sortedData'];
    });
    debugPrint('results: $results');
    debugPrint('data: $data');
  }

  void handleClear() {
    setState(() {
      data = [];
      results = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sorting Screen"),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
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
                        onPressed: () => handleBenchmark(quickSort),
                        child: const Text('Quick Sort'),
                      ),
                      ElevatedButton(
                        onPressed: () => handleBenchmark(bubbleSort),
                        child: const Text('Bubble Sort'),
                      ),
                      ElevatedButton(
                        onPressed: () => handleBenchmark(insertionSort),
                        child: const Text('Insertion Sort'),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(results),
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
