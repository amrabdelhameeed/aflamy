extension StringExtentions on String {
  String underScollToCamelCase() {
    final str = split("");
    str[0] = str[0].toUpperCase();
    int index = 1;
    while (index < length) {
      if (str[index] == "_") {
        str[index] = "";
        str[index + 1] = str[index + 1].toUpperCase();
        index++;
      }
      index++;
    }
    return str.join("");
  }
}
