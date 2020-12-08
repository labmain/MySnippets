// 返回list的[start, end)部分。

// list方法中所有涉及到start、end参数的，都是[start, end)左闭右开的。

main(List<String> args) {
  List list = [3, 4, 'c', 'd', 'e'];
  print(list.sublist(0, 2));
}

//[3, 4]