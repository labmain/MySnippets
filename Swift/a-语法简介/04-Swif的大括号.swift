/**<
 “在Swift编程语言中，用于分隔语句的只能是换行符和分号，不能是其他符号，包括 } 符号也不属于语句分隔符”
 */

// 在同一行，我们可以用分号分隔多条语句
let a = 0; var b = a

// 这里在 } 之后不能再跟其他语句，除非用分号
let c = 1.5; if true { print("OK"); }

//在C语言中可以直接在 } 后面添加新的语句