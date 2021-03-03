import Foundation

// get, set 사용법
//1. 프로퍼티에 값이 할당 될 때 적절한 값인지 검증하기 위해
class Compay {
    var _members: Int = 5
    var members: Int {
        get {
            return _members
        }
        set (newVal) {
            if newVal < 1 {
                print("직원주는 한명보다 작을 수 없습니다.")
            } else {
                _members = newVal
            }
        }
    }
}

// 2. 다른 프로퍼티값에 의존적인 프로퍼티를 관리 할 때

class Compay2 {
    var _members: Int = 5
    var members: Int {
        get {
            return _members
        }
        set (newVal) {
            if (newVal < 1) {
                print("직원수는 한명보다 작을 수 없습니다.")
            } else {
                _members = newVal
        }
    }
}
    var teamDinnerCost: Int {
        get {
            return _members * 100000
        }
    }
}



//
var myProperty: Int = 10 {
    didSet(oldVal) {
//        myProperty의 값이 변경된 직후에 호출, oldVal은 변경 전 myProperty의 값
    }
    willSet(newVal) {
//        myProperty의 값이 변경되기 직전에 호출, newVal은 변경 될 새로운 값
    }
}
