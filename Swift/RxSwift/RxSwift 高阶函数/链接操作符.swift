/// 将源可观察序列转换为可连接序列，并通过指定的主题广播它的发射。
multicast()
/* 
将源可观察序列转换为可连接的序列，并将向每个新订阅服务器重放一起排放的缓存大小。
（首先拥有和publish一样的能力，共享Observable 和sequence,
其次使用replay还需要我们传入一个参数：buffer size 来缓存已经发送的事件，当有了新的订阅者订阅了，会把缓存的事件发送给新的订阅者）
*/
replay()
/* 
将源可观察序列转换为可连接序列。（共享一个Observable的实际序列，避免创建多个Observable 和sequence.注意：需要调用conect之后才会开始发送事件）
*/ 
push() 