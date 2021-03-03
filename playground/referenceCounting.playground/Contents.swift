import UIKit

class Test {
    var str: String? = nil
}

let test: Test?
test = Test()

CFGetRetainCount(test)
