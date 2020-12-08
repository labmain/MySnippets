// removeWhere
// 只移除满足条件的元素，与retainWhere相反。

//list: [x, d]
main(List<String> args) {
  List list = ['x', 'd'];
  list.removeWhere((e) => "x" == e);
  print(list);
}
//[d]
