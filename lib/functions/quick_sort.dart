List<int> quickSort(List<int> data) {
  List<int> sortedData = List.from(data);
  _quickSort(sortedData, 0, sortedData.length - 1);
  return sortedData;
}

void _quickSort(List<int> arr, int start, int end) {
  if (start < end) {
    int pivotIndex = _partition(arr, start, end);
    _quickSort(arr, start, pivotIndex - 1);
    _quickSort(arr, pivotIndex + 1, end);
  }
}

int _partition(List<int> arr, int start, int end) {
  int pivot = arr[end];
  int i = start - 1;
  for (int j = start; j <= end - 1; j++) {
    if (arr[j] <= pivot) {
      i++;
      int temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
    }
  }
  int temp = arr[i + 1];
  arr[i + 1] = arr[end];
  arr[end] = temp;
  return i + 1;
}
