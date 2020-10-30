//
//  fourth.swift
//  VCTest2
//
//  Created by Levi on 2020/10/30.
//

import UIKit

class FourthVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "4VC"
        print("4VC did load")
    }
    
    // view life cycle
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            print("4VC will appear")
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            print("4VC did appear")
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            print("4VC will disappear")
        }
        
        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            print("4VC did disappear")
        }
        
        deinit {
            print("4VC deinit")
        }
}
