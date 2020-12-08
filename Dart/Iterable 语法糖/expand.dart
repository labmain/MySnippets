// expand
// 等价于flatMap。

main(List<String> args) {
  List list = ["a", "b", "c", "d", "e"];
  var tempList = list.expand((e) => [e, e]);
  print(tempList);
}

//(a, a, b, b, c, c, d, d, e, e)
