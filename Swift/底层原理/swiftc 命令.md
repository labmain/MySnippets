## swiftc命令

swiftc是swift语言的编译工具，他可以把swift文件生成中间表示，也可以生成可执行文件，下面简单写下常用的命令:

生成可执行文件：
`swiftc -o main.out main.swift`

生成抽象语法树的命令(AST)：
`swiftc main.swift -dump-ast`

生成中间语言（SIL）：
`swiftc main.swift -emit-sil`

LLVM中间表示层（LLVM IR）：
`swiftc main.swift -emit -ir`

生成汇编语言：
`swiftc main.swift -emit-assembly`

其余的命令你可以通过`swiftc -h`获得帮助
