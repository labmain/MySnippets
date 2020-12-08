// fold
// 设置头initialValue, 将头与列表元素逐个联合。

main(List<String> args) {
  List list = ["a", "b", "c", "d", "e"];
  var result = list.fold("start:", (e1, e2) => "$e1 $e2");
  print(result);
}
//start: a b c d
