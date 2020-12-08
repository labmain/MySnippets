/// 可选位置参数[]
int calMultiplication(int a, [int b]) {
  if (b != null) {
    return a * b;
  } else {
    return a * a;
  }
}

/// 可选命名参数{}
int calMultiplicationnnnnnnn(int a, {int b}) {
  if (b != null) {
    return a * b;
  } else {
    return a * a;
  }
}


main(List<String> args) {
  int m1 = calMultiplication(2, 4);
  int m2 = calMultiplicationnnnnnnn(123, b: 123);
  print(m1);
}