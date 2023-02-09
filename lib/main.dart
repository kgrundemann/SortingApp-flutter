import 'package:flutter/material.dart';
import 'dart:math';
import 'bubbleSort.dart';
import 'quickSort.dart';
import 'insertionSort.dart';



void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  _Sort createState() => _Sort();
}

class _Sort extends State<Sort> {
  List<int> data = [];
  int numElements = 0;

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
    List<int> sortedData =  quickSort(data,low,high);
    setState(() {
      data = sortedData;
    });
  }

  void handleBubbleSort() {
    List<int> sortedData =  bubbleSort(data);
    setState(() {
      data = sortedData;
    });
  }

  void handleInsertionSort() {
    List<int> sortedData =  insertionSort(data);
    setState(() {
      data = sortedData;
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
          padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
          child: Column(
              children: [
          Container(
          padding: EdgeInsets.only(bottom: 20),
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Enter number of elements',
            ),
            onChanged: handleNumElements,
          ),
        ),
                Row(
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
                Row(
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
        Container(
        padding: EdgeInsets.only(top: 20),
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
        '$item',
        style: TextStyle(
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
    );
  }
}
