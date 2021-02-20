/*
苹果官方的介绍

defer语句在代码块（方法、闭包等，可以理解为大括号包装起来的代码）作用域退出之前，也就是代码块中其他应该执行的代码都执行完了，才执行defer中的代码
一个代码块允许多个defer，多个defer执行的顺序从后到前
*/

// defer 搭配 guard 使用
func loadCityList(_ finish: ((Error?, [String]?) -> ())?) {
    DispatchQueue.global().async { // 模拟网络请求
        var error: Error? = nil
        var citys: [String]? = nil
        defer {
            DispatchQueue.main.async {
                finish?(error, citys)
            }
        }
        
        let data: AnyObject? // 模拟服务器返回的数据
        guard let dict = data as? [String: AnyObject] else {
            error = ...
            return
        }
        guard let code = dict["code"] as? Int, code == 200 else {
            error = ...
            return
        }
        guard let tempCitys = dict["data"] as? [String]? else {
            error = ...
            return
        }
        citys = tempCitys
    }
}