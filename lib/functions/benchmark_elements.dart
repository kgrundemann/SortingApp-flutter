import 'dart:math';

import 'standard_deviation.dart';

String runBenchmarkElements(Function testFunction, bool data, int numOfRuns) {
  List<double> runtimes = [];
  for (int i = 0; i < numOfRuns; i++) {
    Stopwatch stopwatch = Stopwatch()..start();
    testFunction(data);
    stopwatch.stop();
    runtimes.add(stopwatch.elapsedMicroseconds.toDouble());
  }
  String result = "Results for $numOfRuns runs:\n";
  result += "Max: ${runtimes.reduce(max)}\n";
  result += "Min: ${runtimes.reduce(min)}\n";
  result +=
      "Average: ${runtimes.reduce((value, element) => value + element) / runtimes.length}\n";
  result += "StdDev: ${standardDeviation(runtimes)}\n";
  return result;
}
