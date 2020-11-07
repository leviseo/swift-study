//
//  testVC.swift
//  VCTest2
//
//  Created by Levi on 2020/10/29.
//

import UIKit

class ThirdVC: UIViewController {
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "3VC"
        print("3VC did load")
    }
    
    @IBAction func btn1Click(_ sender: Any) {
        RouterManager.shared.moveToFirstVC()
    }
    @IBAction func btn2Click(_ sender: Any) {
        RouterManager.shared.moveToSecondVC()
    }
    
    // view life cycle
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            print("3VC will appear")
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            print("3VC did appear")
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            print("3VC will disappear")
        }
        
        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            print("3VC did disappear")
        }
        
        deinit {
            print("3VC deinit")
        }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
