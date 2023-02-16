import 'dart:math';

List<int> calculatePrimeNumbers(int count) {
  List<int> primes = [];
  int num = 2;

  while (primes.length < count) {
    bool isPrime = true;
    for (int i = 2; i <= sqrt(num).toInt(); i++) {
      if (num % i == 0) {
        isPrime = false;
        break;
      }
    }
    if (isPrime) {
      primes.add(num);
    }
    num++;
  }
  return primes;
}
