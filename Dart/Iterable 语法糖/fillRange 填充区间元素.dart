// fillRange
// 使用fillValue替换[start, end)范围的元素值。

//list: [c, d]
main(List<String> args) {
  List list = ['c', 'd'];
  list.fillRange(0, 1, "x");
  print(list);
}

//[x, d]
