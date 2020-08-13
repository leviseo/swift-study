import UIKit

let numbers = Array(1...9)
var testArray: [String] = []

testArray = numbers.map({ (number: Int) -> String in
    return String(number) + "개"
})

print(testArray)
print(numbers)

// 구구단 2단
var gugudan2: [String] = []

gugudan2 = numbers.map({(number: Int) -> String in
   return String("\(number) x 2 = \(number * 2)")
})

print(gugudan2)

// 구구단
var gugudan: [Any] = []

gugudan = numbers.map({ (number: Int) -> Any in
    return numbers.map({ (innerNumber: Int) -> Any in
        return "\(number) x \(innerNumber) = \(number * innerNumber)"
    })
})

print(gugudan)

// array 만드는 방법
let arr1: Array<Any> = Array()
let arr2 = Array<Any>()
let arr3: [Any] = []
let arr4 = [Any]()

let arr5 = [1,2,3]
let arr6 = Array(arrayLiteral: 1, 2, 3)


//
var levilevi:[String?]
levilevi = ["levi", "levi2"]

print(levilevi)
