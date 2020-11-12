//
//  WriteVC.swift
//  CRUDTest
//
//  Created by 서주희 on 2020/11/08.
//

import UIKit
import Alamofire

class WriteVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var writeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Write"
        
        let writeCellNib = UINib(nibName: String.init(describing: WriteCell.self), bundle: nil)
        writeTableView.register(writeCellNib, forCellReuseIdentifier: String.init(describing: WriteCell.self))
        print(writeCellNib)
    }
    
//    MARK: - tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String.init(describing: WriteCell.self)) as! WriteCell

        return cell
    }
  
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
