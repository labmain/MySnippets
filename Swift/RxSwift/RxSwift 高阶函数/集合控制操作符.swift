/// 将一个可观察序列转换为一个数组，将该数组作为一个新的单元素可观察序列发出，然后终止。
toArray() 
/// 从一个设置的初始化值开始，然后对一个可观察序列发出的所有元素应用累计器闭包，并以单个元素可观察序列的形式返回聚合结果。（类似于scan）
reduce() 
/// 以顺序方式连接来自一个可观察序列的内部可观察序列的元素，在从下一个序列发出元素之前，等待每个序列成功 终止。（用来控制顺序）
concat() 