//
//  RouterManager.swift
//  VCTest2
//
//  Created by Levi on 2020/10/29.
//

import Foundation
import UIKit

class RouterManager {
    
    static let shared = RouterManager()

    var window = UIApplication.shared.windows.first { $0.isKeyWindow }
    
    func moveToFirstVC() {
        let vc = FirstVC()
        let nav = UINavigationController(rootViewController: vc)
        self.window!.rootViewController = nav
    }
    
    func moveToSecondVC() {
        let vc = SecondVC()
        let nav = UINavigationController(rootViewController: vc)
        self.window!.rootViewController = nav
    }
    
    func moveToThirdVC() {
        let vc = ThirdVC()
        let nav = UINavigationController(rootViewController: vc)
        self.window!.rootViewController = nav
    }
    
    func presentFourthVC() {
        let vc = FourthVC()
        self.window?.rootViewController?.present(vc, animated: true)
    }
    
    
    
}
