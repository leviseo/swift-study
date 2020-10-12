//
//  PushVC.swift
//  VCTest
//
//  Created by Levi on 2020/09/14.
//  Copyright © 2020 levi. All rights reserved.
//

import UIKit

class PresentVC: UIViewController {
    
    @IBOutlet weak var closeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func clickCloseBtn(_ sender: Any) {
       self.dismiss(animated: true)
   }
    
    
    // view life cycle
    override func viewWillAppear(_ animated: Bool) {
        print("Present viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("Present viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("Present viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("Present viewDidDisappear")
    }
    deinit {
        print("Present deinit")
    }
}
