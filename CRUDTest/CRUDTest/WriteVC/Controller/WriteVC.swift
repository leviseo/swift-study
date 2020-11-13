//
//  WriteVC.swift
//  CRUDTest
//
//  Created by 서주희 on 2020/11/08.
//

import UIKit
import Alamofire

class WriteVC: UIViewController {
    
//    @IBOutlet var writeTableView: UITableView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var imgField: UITextField!
    @IBOutlet weak var songField: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Write"
        submitBtn.isEnabled = false
        
//        let writeCellNib = UINib(nibName: String.init(describing: WriteCell.self), bundle: nil)
//        writeTableView.register(writeCellNib, forCellReuseIdentifier: String.init(describing: WriteCell.self))
//        print(writeCellNib)
    }
    @IBAction func editChanged(_ sender: Any) {
        if nameField.text != nil && imgField.text != nil {
            submitBtn.isEnabled = true
        }
    }
    
    @IBAction func submit(_ sender: Any) {
       
    }
    
////    MARK: - tableView
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: String.init(describing: WriteCell.self)) as! WriteCell
//        return cell
//    }
    
    
    //    MARK: - API
        let url = "http://172.25.101.206:3002/api/v1/singers"
    //        let url = "http://192.168.0.22:3002/api/v1/singers"
    // MARK: - AF POST
    func write() {}
  
}
// MARK: -
extension WriteVC {
    override func viewWillAppear(_ animated: Bool) {
        print("WriteVC viewWillAppear")
    }

    override func viewDidAppear(_ animated: Bool) {
        print("WriteVC viewDidAppear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        print("WriteVC viewWillDisappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        print("WriteVC viewDidDisappear")
    }
}
