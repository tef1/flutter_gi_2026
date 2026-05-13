void main(List<String> args) {
  List<String> a = ["morocco", "egypte"];
  // var b = a;
  // print("identical a et b ${identical(a, b)}");
  print("before add list has ${identityHashCode(a)}");
  // a.add("Tunisia");
  a = [...a, "tunisia"];
  print("after add list has ${identityHashCode(a)}");
}
