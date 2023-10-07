void main() {
  String text = "deny";
  //  alex        bukan palindrome
  // xela

  //hannah
  //hannah

  List values = text.split("");
  String reversedWord = values.reversed.toList().join("");

  print("text: ${text}");
  print("reversedWord: ${reversedWord}");

  if (text == reversedWord) {
    print("$text itu Palindrome");
  } else {
    print("$text itu bukan Palindrome");
  }
}
