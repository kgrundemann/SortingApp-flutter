import 'package:flutter/material.dart';


List<int> quickSort(List<int> data, int left, int right) {
  int pivot;
  int partitionIndex;

  if (left < right) {
    pivot = right;
    partitionIndex = partition(data, pivot, left, right);

    quickSort(data, left, partitionIndex - 1);
    quickSort(data, partitionIndex + 1, right);
  }
  return data;
}

int partition(List<int> data, int pivot, int left, int right) {
  int pivotValue = data[pivot];
  int partitionIndex = left;

  for (int i = left; i < right; i++) {
    if (data[i] < pivotValue) {
      swap(data, i, partitionIndex);
      partitionIndex++;
    }
  }
  swap(data, right, partitionIndex);
  return partitionIndex;
}

void swap(List<int> data, int a, int b) {
  int temp = data[a];
  data[a] = data[b];
  data[b] = temp;
}
