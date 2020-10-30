//
//  ViewController.swift
//  VCTest2
//
//  Created by Levi on 2020/10/29.
//

import UIKit

class FirstVC: UIViewController {
    
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var btn2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        1은 파란배경, 2는 
//        view.backgroundColor = .blue
        
        print("FirstVC did load")
    }
    
    @IBAction func btnClick(_ sender: Any) {
        RouterManager.shared.moveToThirdVC()
    }
    @IBAction func btn2Click(_ sender: Any) {
        RouterManager.shared.moveToSecondVC()
    }
    
// view life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("FirstVC will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("FirstVC did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("FirstVC will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("FirstVC did disappear")
    }
    
    deinit {
        print("FirstVC deinit")
    }
}

