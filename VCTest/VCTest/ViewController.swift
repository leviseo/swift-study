//
//  ViewController.swift
//  VCTest
//
//  Created by Levi on 2020/09/10.
//  Copyright © 2020 levi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var data: [String] = ["row"]
    
    @IBOutlet weak var btnWrite: UIButton!
    @IBOutlet weak var btnPresent: UIButton!
    @IBOutlet weak var tableList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("VC viewDidLoad")
        tableList.delegate = self
        tableList.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = tableList.dequeueReusableCell(withIdentifier: "Item", for: indexPath) as! ItemVC
        item.itemLabel.text = data[indexPath.row]
        return item
    }
    
    @IBAction func clickPresentBtn(_ sender: Any) {
        guard let presentVC = self.storyboard?.instantiateViewController(withIdentifier: "PresentVC") else {
            return
        }
        
        presentVC.modalPresentationStyle = .fullScreen
//        presentVC.modalTransitionStyle = .flipHorizontal
        
        self.present(presentVC, animated: true)
    }
    
    @IBAction func clickWriteBtn(_ sender: Any) {
        guard let writeVC = self.storyboard?.instantiateViewController(withIdentifier: "WriteVC") else {
            return
        }
        self.navigationController?.pushViewController(writeVC, animated: true)
    }
    
    // view life cycle
    override func viewWillAppear(_ animated: Bool) {
        print("VC viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("VC viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("VC viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("VC viewDidDisappear")
    }
    deinit {
        print("VC deinit")
    }
}

