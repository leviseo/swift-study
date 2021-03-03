import UIKit

// Int와 UInt
var integrer: Int = -100
let unsignedInterger: UInt = 40
// UInt 0도 됨

print("integer 값: \(integrer), unsignedInteger 값: \(unsignedInterger)")
print("Int 최대값: \(Int.max), Int 최소값: \(Int.min)")
print("UInt 최대값: \(UInt.max), UInt 최소값: \(UInt.min)")
let largeInteger: Int64 = Int64.max
let smallUnsignedInteger: UInt8 = UInt8.max
print("Int64 최대값: \(largeInteger), UInt8 최대값: \(smallUnsignedInteger)")

// String
let hello: String = "Hello"
let levi: String = "levi"
print(hello + levi)

// Boolean 을 활용한
var isSameString: Bool = false
isSameString = hello == "hello"
print("변수 " + hello + "와 \"hello\"는 같은가? \(isSameString)")

var hasPrefix: Bool = false
hasPrefix = hello.hasPrefix("He")
print("변수\(hello)는 \"He\"를 프리픽스로 가지나? \(hasPrefix)")

var isEmpty: Bool = false
isEmpty = hello.isEmpty
print("변수\(hello)는 비어 있나? \(isEmpty)")

print("변수\(hello)의 글자수를 세어보자 \(hello.count)개")

// 튜플 (Tuple)
var person: (name: String, age:Int, height:Double) = ("아이유", 27, 161.8)
print("이름 : \(person.name), 나이 : \(person.age), 키 : \(person.height)")

typealias personTuple = (name: String, age: Int, height: Double)
let lindaG: personTuple = ("이효리", 41, 164)
let UDoRagon: personTuple = ("유재석", 47, 178)
print("\(lindaG.name)은/는 나이 \(lindaG.age)세, 신장 \(lindaG.height)cm 입니다")
print("\(UDoRagon.name)은/는 나이 \(UDoRagon.age)세, 신장 \(UDoRagon.height)cm 입니다")



// 열거형
enum Numbers: Int {
    case zero
    case one
    case two
    case ten // 3
}

print("\(Numbers.zero.rawValue) \(Numbers.one.rawValue) \(Numbers.two.rawValue) \(Numbers.ten.rawValue)")

enum School: String {
    case primary = "유치원"
    case elementray = "초등학교"
}

enum TestFloat: Float {
    case first
    case second
}

print("\(TestFloat.first.rawValue) \(TestFloat.second.rawValue)")


print(6 % 4)


let tempArray = Array(Int8.min...Int8.max)
print("\(tempArray)")
