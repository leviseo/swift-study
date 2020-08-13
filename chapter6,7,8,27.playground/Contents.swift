import UIKit


// 흐름제어
let integerValue: Int = 5

switch integerValue {
case 0:
    print("Value == zero")
case 1...10:
    print("Value == 1 ~ 10")
    fallthrough
case Int.min..<0, 101..<Int.max:
    print("Value < 0 or Value > 100")
    break
default:
    print("10 < Vlaue <= 100")
}



let doubleValue: Double = 3.0
switch doubleValue {
case 0:
    print("Value == zero")
case 1.5...10.5:
    print("1.5 <= Value <= 10.5")
default:
    print("Value == \(doubleValue)")
}


typealias NameAge = (name: String, age: Int)

let tupleValue: NameAge = ("levi", 32)

switch tupleValue {
case ("levi", 32):
    print("정확히 맞췄습니다!")
case ("levi", let age):
    print("이름만 맞췄습니다 나이는 \(age) 입니다")
case (let name, 32):
    print("나이만 맞췄습니다 이름은 \(name) 입니다")
default:
    print("누굴 찾나요?")
}





typealias VoidVoidClosure = () -> Void

func functionWithNoescapeClosure(closure: VoidVoidClosure) {
    closure()
}

func functionWithEscapingClousure(completionHandler: @escaping VoidVoidClosure) -> VoidVoidClosure {
    return completionHandler
}

class SomeClass {
    var x = 10

    func runNoescapeclosure() {
        functionWithNoescapeClosure { x = 200 }
    }

    func runEscapingClosure() -> VoidVoidClosure {
        return functionWithEscapingClousure { [weak self] in
            guard let self = self else {
                return
            }

            self.x = 100
        }
    }
}


let instance: SomeClass = SomeClass()
instance.runNoescapeclosure()
print(instance.x)

let returnedClosure: VoidVoidClosure = instance.runEscapingClosure()
returnedClosure()
print(instance.x)



func sumFunction(a: Int, b: Int) -> Int {
    return a + b
}

var sum: (Int, Int) -> Int = {(a: Int, b: Int) -> Int in
    return a + b
}

print(sumFunction(a: 2, b: 3))
var sumResult = sum(3, 4)
print(sumResult)
