// try 方式
do {
    let player = try AVAudioPlayer(contentsOf: url)
} catch error {
    print(error)
}

// try? 方式
guard let player = try? AVAudioPlayer(contentsOf: url) else {
    return
}

// try! 方式
let player = try! AVAudioPlayer(contentsOf: url)

// try!方式 一旦有异常，程序直接奔溃

