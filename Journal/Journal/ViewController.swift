//
//  ViewController.swift
//  Journal
//
//  Created by seojuhee on 2020/08/12.
//  Copyright © 2020 seojuhee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var journalList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        journalList.delegate = self
        journalList.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = journalList.dequeueReusableCell(withIdentifier: "journalItem", for:  indexPath)
        item.textLabel?.text = "\(indexPath.row)"
        return item
    }
    
    // click
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("click" + "\(indexPath.row)")
    }

}

