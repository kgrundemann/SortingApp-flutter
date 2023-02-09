import 'package:flutter/material.dart';

List<int> insertionSort(data) {
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
  return sortedData;
}