import 'dart:math';

double standardDeviation(List<double> array) {
  int n = array.length;
  double mean = array.reduce((a, b) => a + b) / n;
  return sqrt(array.map((x) => pow(x - mean, 2)).reduce((a, b) => a + b) / n);
}
