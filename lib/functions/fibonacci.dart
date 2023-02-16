String calculateFibonacci(int n) {
  BigInt a = BigInt.from(0), b = BigInt.from(1), temp;
  for (int i = 0; i < n; i++) {
    temp = a;
    a = b;
    b = temp + b;
  }
  return a.toString();
}
