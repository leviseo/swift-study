//
//  SecoundVC.swift
//  VCTest2
//
//  Created by Levi on 2020/10/29.
//

import UIKit

class SecondVC: UIViewController {
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "2VC"
        
        print("2VC did load")
        
//        view.backgroundColor = .cyan
        
    }
    
    @IBAction func btn1Click(_ sender: Any) {
        RouterManager.shared.moveToFirstVC()
    }
    @IBAction func btn3Click(_ sender: Any) {
        RouterManager.shared.moveToThirdVC()
    }
    
    // view life cycle
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            print("2VC will appear")
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            print("2VC did appear")
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            print("2VC will disappear")
        }
        
        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            print("2VC did disappear")
        }
        
        deinit {
            print("2VC deinit")
        }
}
