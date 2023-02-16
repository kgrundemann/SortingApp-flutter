String reverseString(String str) {
  String reversedString = "";
  for (int i = str.length - 1; i >= 0; i--) {
    reversedString += str[i];
  }
  return reversedString;
}
