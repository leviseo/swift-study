//
//  RouterManager.swift
//  VCTest2
//
//  Created by Levi on 2020/10/29.
//

import Foundation
import UIKit

class RouterManager {

    var window = UIApplication.shared.windows.first { $0.isKeyWindow }
    
    func moveToSecondVC() {
        let vc = SecondVC()
        let nav = UINavigationController(rootViewController: vc)
        self.window!.rootViewController = nav
    }
}
