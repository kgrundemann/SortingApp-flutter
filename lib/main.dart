import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BinarySort',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BinarySort(),
    );
  }
}

class BinarySort extends StatefulWidget {
  @override
  _BinarySortState createState() => _BinarySortState();
}

class _BinarySortState extends State<BinarySort> {
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

  void handleSort() {
    List<int> sortedData = [...data];
    for (int i = 1; i < sortedData.length; i++) {
      int key = sortedData[i];
      int j = i - 1;
      while (j >= 0 && sortedData[j] > key) {
        sortedData[j + 1] = sortedData[j];
        j = j - 1;
      }
      sortedData[j + 1] = key;
    }
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
              child: Text('Generate'),
            ),
            ElevatedButton(
              onPressed: handleSort,
              child: Text('Sort'),
            ),
            ElevatedButton(
              onPressed: handleClear,
              child: Text('Clear'),
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
    padding: EdgeInsets.all(10),
      child: Text(
        '$item',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
          width: 2,
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
