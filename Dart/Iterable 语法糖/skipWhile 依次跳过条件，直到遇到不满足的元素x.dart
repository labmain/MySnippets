// skipWhile
// 依次跳过满足条件的元素，直到遇到第一个不满足的元素x，并停止筛选。返回从x开始的所有元素。跟where返回一样，是一个lazy Iterable。

main(List<String> args) {
  List list = ["a", "b", "c", "d", "e"];
  var tempList =
      list.skipWhile((e) => e.compareTo("c") < 0 || e.compareTo("d") > 0);
  print(tempList);
}

//(c, d, e)
