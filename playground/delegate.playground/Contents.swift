import Foundation
import UIKit

protocol TapDelegate: class {
    func helloWorld()
}

class Receiver: TapDelegate { // 수신자
    let button = Delegate()
    init() {
        button.delegate = self
    }
    func helloWorld() {
        print("HelloWorld")
    }
}

class Delegate { // 위임자
    weak var delegate: TapDelegate?
    func didTapButton() {
        delegate?.helloWorld()
    }
}

// MARK: -
//class Receiver {
//    let button = Delegate()
//
//    init() {
//        button.delegate = self  //대리자에게 자신을 전달
//    }
//
//    func helloWorld() {
//        print("Hello World")
//    }
//}
//
//class Delegate {
//    weak var delegate: Sender?
//
//    func didTapButton() {
//        delegate?.helloWorld()
//    }
//}
