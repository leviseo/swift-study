//
//  ListVC.swift
//  CRUDTest
//
//  Created by 서주희 on 2020/11/07.
//

import UIKit
import Alamofire

class ListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var ListTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ListTableView.dequeueReusableCell(withIdentifier: String.init(describing: ListCell.self)) as! ListCell
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "List"
        
        let cellNib = UINib(nibName: String.init(describing: ListCell.self), bundle: nil)
        ListTableView.register(cellNib, forCellReuseIdentifier: String.init(describing: ListCell.self))
        
    }

}
