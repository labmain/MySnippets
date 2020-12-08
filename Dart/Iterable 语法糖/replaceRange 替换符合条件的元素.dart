// replaceRange
// 将list的[start, end)部分元素替换成replacement的元素。

//[a, b, c, d, e]
main(List<String> args) {
  List list = [3, 4, 'c', 'd', 'e'];
  list.replaceRange(0, 2, ["a", "b"]);
  print(list);
  //[a, b, c, d, e]
}
