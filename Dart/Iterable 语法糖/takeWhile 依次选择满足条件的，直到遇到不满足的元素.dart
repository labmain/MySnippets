// takeWhile
// 依次选择满足条件的元素，直到遇到第一个不满足的元素x，并停止选择。返回从0开始并截止到x前一个元素的所有元素，是一个lazy Iterable。
main(List<String> args) {
  List list = ["a", "b", "c", "d", "e"];
  var tempList =
      list.takeWhile((e) => e.compareTo("c") < 0 || e.compareTo("d") > 0);
  print(tempList);
}

//(c, d, e)
