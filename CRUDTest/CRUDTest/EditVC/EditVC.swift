//
//  EditVC.swift
//  CRUDTest
//
//  Created by Levi on 2020/11/27.
//

import UIKit

class EditVC: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var imgField: UITextField!
    @IBOutlet weak var songField: UITextField!
    @IBOutlet weak var editBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    deinit {
        print("EditVC deinit")
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

// MARK: - view life cycle
extension EditVC {
    override func viewWillAppear(_ animated: Bool) {
        print("EditVC viewWillAppear")
    }

    override func viewDidAppear(_ animated: Bool) {
        print("EditVC viewDidAppear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        print("EditVC viewWillDisappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        print("EditVC viewDidDisappear")
    }
}

