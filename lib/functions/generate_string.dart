String generateString(int stringLength) {
  String string = "";
  String possibleLetters =
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
  for (int i = 0; i < stringLength; i++) {
    string += possibleLetters[i % possibleLetters.length];
  }
  return string;
}
