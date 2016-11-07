enum MethodEnum {
    case request
    case something
}

class MethodExecutor {

    func execute(_ method: MethodEnum) {
        print(method)
    }
    
}
