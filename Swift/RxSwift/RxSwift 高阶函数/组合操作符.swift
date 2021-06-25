// ******** 函数 ******** // 

/// 在开始从可观测源发出元素之前，发出知道的元素序列
startWith() 
/// 将员可观测序列中的元素组合成一个新的可观测序列，并将像每个源可观测序列发出元素一样发出每个元素。
merge() 
/// 将多达8个源可观测序列组合成一个新的可观测序列，并将从组合的可观测序列中发射出对应索引处每个源可 观测序列的元素。
zip() 
/// 将8个源可观测序列组合成一个新的可观测序列，并将开始发出联合可观测序列的每个源的最新元素可观测序列一旦所有排放源序列至少有一个 元素，
/// 并且当源可观测序列发出的任何一个新元素。
combineLatest() 
/// 将可观测序列发出的元素转换为可观察序列，并返回转换后的新可观察序列。
switchLatest() 

// ******** 实例 ******** // 
startWith()
// 在开始从可观测源发出元素之前，发出知道的元素序列

// 实例:
// *** startWith : 在开始从可观察源发出元素之前，发出指定的元素序列
func test_startWith()  {
        print("*****startWith*****")
        Observable.of("1", "2", "3", "4")
            .startWith("A")
            .startWith("B")
            .startWith("C", "a", "b")
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        //效果: CabBA1234
 }

merge()
// 将员可观测序列中的元素组合成一个新的可观测序列，并将像每个源可观测序列发出元素一样发出每个元素。
// 实例:
// **** merge : 将源可观察序列中的元素组合成一个新的可观察序列，并将像每个源可观察序列发出元素一样发出每个元素
func test_merge()  {
    print("*****merge*****")
    let subject1 = PublishSubject<String>()
    let subject2 = PublishSubject<String>()
    // merge
    Observable.of(subject1,subject2)
        .merge()
        .subscribe(onNext: { print($0)})
        .disposed(by: disposeBag)
    
    //- 下面任何一个响应都会勾起新序列响应
    subject1.onNext("K")
    subject1.onNext("o")
    subject2.onNext("n")
    subject2.onNext("g")
    subject1.onNext("Y")
    subject2.onNext("u")
    subject1.onNext("L")
    subject2.onNext("u")
}

zip()
// 将多达8个源可观测序列组合成一个新的可观测序列，并将从组合的可观测序列中发射出对应索引处每个源可 观测序列的元素。
// 实例：
//  *** zip: 将多达8个源可观测序列组合成一个新的可观测序列，
//  并将从组合的可观测序列中发射出对应索引处每个源可观测序列的元素
func test_zip()  {
    print("*****zip*****")
    let stringSubject = PublishSubject<String>()
    let intSubject = PublishSubject<Int>()
    
    Observable.zip(stringSubject, intSubject) { stringElement , intElement in
        "\(stringElement) \(intElement)"
    }
        .subscribe(onNext: {print($0)})
        .disposed(by: disposeBag)
    
    stringSubject.onNext("K")
    stringSubject.onNext("o") //到这里存储了K o 但是不好响应，除非有另一个响应
    
    intSubject.onNext(1) //勾出一个
    intSubject.onNext(2) //勾出另一个
    stringSubject.onNext("o") //再存一个
    intSubject.onNext(3) //勾出一个
    
    //总结： 只有两个序列同时有值的 时候才会响应，否则只会存值。
    
}

combineLatest()
// 将8个源可观测序列组合成一个新的可观测序列，并将开始发出联合可观测序列的每个源的最新元素可观测序列一旦所有排放源序列至少有一个 元素，
// 并且当源可观测序列发出的任何一个新元素。
// 实例:
/// combineLatest:将8源可观测序列组合成一个新的观测序列,
    ///并将开始发出联合观测序列的每个源的最新元素可观测序列一旦所有排放源序列至少有一个元素,
    ///并且当源可观测序列发出的任何一个新元素
func test_combineLatest()  {
    print("*****combineLatest*****")
    let stringSub =  PublishSubject<String>()
    let intSub = PublishSubject<Int>()
    //合并序列
    Observable.combineLatest(stringSub, intSub) { strE, intE in
        "\(strE) \(intE)"
    }
    .subscribe(onNext: {print($0)})
    .disposed(by: disposeBag)
    
    stringSub.onNext("K") //存一个K
    stringSub.onNext("Y") //存了一个覆盖 - 和zip不一样
    intSub.onNext(1) //发现strOB 观察者存在值 Y(上面的Y覆盖了K) 则 响应 Y 1
    intSub.onNext(2) //覆盖1 -> 2, 发现strOB有值YK 响应 Y 2
    stringSub.onNext("Kongyulu") // 覆盖Y -> Kongyulu 发现intOB有值 2 响应：Kongyulu 2
    
    //总结：1. combineLatest 比较zip 会覆盖
    // 2. 应用非常频繁: 比如账户和密码同时满足->才能登陆. 不关系账户密码怎么变化的只要查看最后有值就可以 loginEnable
}

switchLatest()
// 将可观测序列发出的元素转换为可观察序列，并返回转换后的新可观察序列。
// 实例 20：
// 将可观察序列发出的元素转换为可观察序列，并从最近的内部可观察序列发出元素
func test_switchLatest()  {
    // switchLatest : 将可观察序列发出的元素转换为可观察序列，并从最近的内部可观察序列发出元素
    print("*****switchLatest*****")
    let switchLatestSub1 = BehaviorSubject(value: "K")
    let switchLatestSub2 = BehaviorSubject(value: "1")
    //注意下面这句代码：这里选择了switchLatestSub1就不会再监听switchLatestSub2
    let switchLatestSub = BehaviorSubject(value: switchLatestSub1)
    
    switchLatestSub.asObservable()
    .switchLatest()
    .subscribe(onNext: {print($0)})
    .disposed(by: disposeBag)
    
    switchLatestSub1.onNext("Y")
    switchLatestSub1.onNext("_")
    switchLatestSub2.onNext("2")
    switchLatestSub2.onNext("3") // 2,3都不会监听，但是默认保存有2 覆盖1  3覆盖2
    
}