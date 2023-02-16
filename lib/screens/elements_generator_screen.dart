import 'package:flutter/material.dart';

import '../functions/benchmark_elements.dart';

class ElementsGeneratorScreen extends StatefulWidget {
  const ElementsGeneratorScreen({super.key});

  @override
  _ElementsGeneratorScreenState createState() =>
      _ElementsGeneratorScreenState();
}

class _ElementsGeneratorScreenState extends State<ElementsGeneratorScreen> {
  int quantity = 0;
  String selectedOption = "buttons";
  bool shouldGenerate = false;
  int numOfRuns = 0;
  String results = "";

  void handleClear() {
    setState(() {
      shouldGenerate = false;
      quantity = 0;
      results = "";
      selectedOption = "buttons";
    });
  }

  void handleBenchmark() async {
    String result = runBenchmarkElements(setShouldGenerate, true, numOfRuns);
    setState(() {
      results = result;
    });
  }

  void setShouldGenerate(bool value) {
    setState(() {
      shouldGenerate = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Elements Generator"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  quantity = int.parse(value);
                });
              },
              decoration: const InputDecoration(
                hintText: 'Enter the number of items',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
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
            const SizedBox(height: 16),
            RadioListTile(
              title: const Text("buttons"),
              value: "buttons",
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("rows"),
              value: "rows",
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("table"),
              value: "table",
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value.toString();
                });
              },
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: handleBenchmark,
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
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Text(results),
            ),
            const SizedBox(height: 32),
            if (shouldGenerate)
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(quantity, (index) {
                    switch (selectedOption) {
                      case "buttons":
                        return ElevatedButton(
                          key: Key('$index'),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text('Button ${index + 1}'),
                        );
                      case "rows":
                        return Container(
                          key: Key('$index'),
                          margin: const EdgeInsets.only(right: 16),
                          padding: const EdgeInsets.all(8),
                          color: Colors.grey[300],
                          child: Text('Row ${index + 1}'),
                        );
                      case "table":
                        return Container(
                          key: Key('$index'),
                          margin: const EdgeInsets.only(right: 16),
                          padding: const EdgeInsets.all(8),
                          color: Colors.grey[300],
                          child: Text('Table Row ${index + 1}'),
                        );
                      default:
                        return Container();
                    }
                  }),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
