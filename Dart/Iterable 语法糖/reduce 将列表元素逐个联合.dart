// reduce
// 将列表元素逐个联合。

main(List<String> args) {
  List list = ["a", "b", "c", "d", "e"];
  var result2 = list.reduce((e1, e2) => "$e1-$e2");
  print(result2);
}
//a-b-c-d-e
