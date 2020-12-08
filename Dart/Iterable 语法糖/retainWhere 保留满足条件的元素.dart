// retainWhere
// 只保留满足条件的元素。
main(List<String> args) {
  List list = ['a', 'b', 'c', 'd', 'e'];
  list.retainWhere((e) => e.compareTo("b") > 0 && e.compareTo("e") < 0);
  print(list);
  //[c, d]
}
