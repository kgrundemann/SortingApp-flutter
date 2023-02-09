import 'package:flutter/material.dart';


List<int> bubbleSort(data) {
  List<int> sortedData = [...data];
  int n = sortedData.length;
  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      if (sortedData[j] > sortedData[j + 1]) {
        // Swap the elements
        int temp = sortedData[j];
        sortedData[j] = sortedData[j + 1];
        sortedData[j + 1] = temp;
      }
    }
  }
  return sortedData;
}
