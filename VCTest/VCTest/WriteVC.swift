//
//  PresentVC.swift
//  VCTest
//
//  Created by Levi on 2020/09/10.
//  Copyright © 2020 levi. All rights reserved.
//

import UIKit

class WriteVC: UIViewController {
    
    var data:[String]?
    
//    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sendBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Write viewDidLoad")
        // Do any additional setup after loading the view.
    }
   
//    @IBAction func clickSendBtn(_ sender: Any) {
//        data?.append("row")
//    }
    
    // view life cycle
    override func viewWillAppear(_ animated: Bool) {
        print("Push viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("Push viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("Push viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("Push viewDidDisappear")
    }
    deinit {
        print("Push deinit")
    }
}
