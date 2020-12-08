class Point {
  num x;
  num y;
  num z = 0;

  // 在构造函数体执行前，
  // 语法糖已经设置了变量 x 和 y。
  Point(this.x, this.y);
  
  // 命名构造函数
  Point.origin() {
    x = 0;
    y = 0;
  }

  // 初始化列表
  // 在构造函数体执行之前，
  // 通过初始列表设置实例变量。
  Point.fromJson(Map<String, num> json)
      : x = json['x'],
        y = json['y'] {
    print('In Point.fromJson(): ($x, $y)');
  }

  // 重定向构造函数
  // 有时构造函数的唯一目的是重定向到同一个类中的另一个构造函数。 重定向构造函数的函数体为空， 构造函数的调用在冒号 (:) 之后。
  // 指向主构造函数
  Point.alongXAxis(num x) : this(x, 0);
}

main() {
  var p = Point.origin();
  Point(1, 2);
  print(p.x);
  var p1 = Point.fromJson({"x12": 123, "y34": 345});
  print(p1.x);
}
