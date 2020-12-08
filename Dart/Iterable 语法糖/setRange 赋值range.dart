// setRange
// 将iterable跳过skipCount之后的值，依次赋值到本list的[start,end)上。

main(List<String> args) {
  List<String> list = ["a", "b", "c", "d", "e"];
  List<String> list2 = ["1", "2", "3", "4", "5"];
  list.setRange(0, 2, list2, 2);
  print(list);
}

//[3, 4, c, d, e]
