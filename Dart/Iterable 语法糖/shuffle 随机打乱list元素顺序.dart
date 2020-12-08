// shuffle
// 随机打乱list元素顺序。

//list: ["a", "b", "c", "d", "e"]
main(List<String> args) {
  List list = ["a", "b", "c", "d", "e"];
  list.shuffle();
  print(list);
}
//[d, a, e, c, b]
