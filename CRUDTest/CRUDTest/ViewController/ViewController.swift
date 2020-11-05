//
//  ViewController.swift
//  CRUDTest
//
//  Created by Levi on 2020/11/02.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var btnTable: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("ViewController viewDidLoad")
    }
    
    @IBAction func clickBtn(_ sender: Any) {
        pushView()
    }
    
    @IBAction func clickBtnTable(_ sender: Any) {
        pushTableView()
    }
    
    func pushView() {
        let vc = CollectionViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func pushTableView() {
        let vc = TableVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
//    view life cycle
    override func viewWillAppear(_ animated: Bool) {
        print("ViewController viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("ViewController viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("ViewController viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("ViewController viewDidDisappear")
    }
    
    deinit {
        print("ViewController deinit")
    }
    

}

