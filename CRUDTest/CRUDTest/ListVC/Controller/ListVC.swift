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
    
    var songs: [Song] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "List"
        
        let cellNib = UINib(nibName: String.init(describing: ListCell.self), bundle: nil)
        ListTableView.register(cellNib, forCellReuseIdentifier: String.init(describing: ListCell.self))
        
//        get List
        getSongArray()
    }

    //    MARK: - tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ListTableView.dequeueReusableCell(withIdentifier: String.init(describing: ListCell.self)) as!  ListCell
        
        cell.nameLabel.text = songs[indexPath.row].name
        cell.songLabel.text = songs[indexPath.row].song
        
        let thumbnail = songs[indexPath.row].img
        
        let url = URL(string: String(thumbnail))
        do {
            let data = try Data(contentsOf: url!)
            cell.thumbView.image = UIImage(data: data)
        } catch {
        }
        
        return cell
    }
    
    //    MARK: - AF get
    func getSongArray() {
        let url = "http://172.25.101.206:3002/api/v1/singers"
    //        let url = "http://192.168.0.22:3002/api/v1/singers"
        
        AF.request(url)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .response { data in
                switch data.result {
                case .success(let data):
                    print("Validation Successful")
                    
                    do {
                        let data = try JSONDecoder().decode([Song].self, from: data!)
                        self.songs = data
                        print(type(of: self.songs))
                        
                        DispatchQueue.main.async {
                            self.ListTableView.reloadData()
                        }
                        
                    } catch {
                        print("decoding Error: \(error)")
                    }
                   
                case let .failure(error):
                    print(error)
                }
            }
    }
}

//// MARK: -
//extension ListVC {
//    override func viewWillAppear(_ animated: Bool) {
//        print("List viewWillAppear")
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        print("List viewDidAppear")
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        print("List viewWillDisappear")
//    }
//
//    override func viewDidDisappear(_ animated: Bool) {
//        print("List viewDidDisappear")
//    }
//}

