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
//        get List
        getSongArray()
        
    }
    
//    MARK: - AF get
    func getSongArray() {
        AF.request("http://192.168.0.22:3002/api/v1/singers")
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .response { data in
                switch data.result {
                case .success(let data):
                    print("Validation Successful")
//                    print("type", type(of: data))
                    
                    do {
                        let songArray = try JSONDecoder().decode([Song].self, from: data!)
                        print(songArray)
                        
                    } catch {
                        print("decoding Error: \(error)")
                    }
                   
                case let .failure(error):
                    print(error)
                }
                
            }
    }

}
