// every
// 列表中所有的元素是否都满足条件。

main(List<String> args) {
  List list = ["a", "b", "c", "d", "e"];

  var result = list.every((e) => e.compareTo("a") >= 0);
  print(result);
}

//true
