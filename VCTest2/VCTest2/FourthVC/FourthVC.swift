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
        print("FourthVC did load")
    }
    
    // view life cycle
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            print("FourthVC will appear")
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            print("FourthVC did appear")
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            print("FourthVC will disappear")
        }
        
        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            print("FourthVC did disappear")
        }
        
        deinit {
            print("FourthVC deinit")
        }
}
