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
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "1VC"
        
        print("1VC did load")
    }
    
    @IBAction func btnClick(_ sender: Any) {
        RouterManager.shared.moveToThirdVC()
    }
    @IBAction func btn2Click(_ sender: Any) {
        RouterManager.shared.moveToSecondVC()
    }
    @IBAction func btn4Click(_ sender: Any) {
        RouterManager.shared.presentFourthVC()
    }
    @IBAction func btn5Click(_ sender: Any) {
        RouterManager.shared.pushVC(selfVC: self, pushVC: FifthVC())
    }
    
    
// view life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("1VC will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("1VC did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("1VC will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("1VC did disappear")
    }
    
    deinit {
        print("1VC deinit")
    }
}

