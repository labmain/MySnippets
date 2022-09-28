# 1. 使用 AppBar
```dart
appBar: AppBar(
          title: Text('appbar', style: TextStyle(color: Colors.black),),
          brightness: Brightness.light,
          backgroundColor: Colors.white,
        ),
```
# 2. 使用 AnnotatedRegion
```dart
return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          body: Column(),
        ));
```

# 3. 通过 SystemChrome.setSystemUIOverlayStyle 设置
```dart
@override
Widget build(BuildContext context) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  return const Placeholder();
}
```