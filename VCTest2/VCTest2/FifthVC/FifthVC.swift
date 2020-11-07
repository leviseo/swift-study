//
//  FifthVC.swift
//  VCTest2
//
//  Created by Levi on 2020/10/30.
//

import UIKit

class FifthVC: UIViewController {
    @IBOutlet weak var popBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("5VC did load")
    }
    
    @IBAction func popBtnClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // view life cycle
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            print("5VC will appear")
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            print("5VC did appear")
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            print("5VC will disappear")
        }
        
        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            print("5VC did disappear")
        }
        
        deinit {
            print("5VC deinit")
        }
}
