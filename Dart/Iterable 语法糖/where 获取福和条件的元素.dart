// where
// where与retainWhere不同在于： 它不返回真实列表数据，而是满足条件的计算表达式。真正使用时才逐个计算出值。因此它可以多次使用，相互不受影响。

main(List<String> args) {
  List list = ["a", "b", "c", "d", "e"];
  var tempList =
      list.where((e) => e.compareTo("b") > 0 && e.compareTo("e") < 0);
  tempList.forEach(print);
}

//c
//d
