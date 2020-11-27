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
    
    var isFirstCall: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib = UINib(nibName: String.init(describing: ListCell.self), bundle: nil)
        ListTableView.register(cellNib, forCellReuseIdentifier: String.init(describing: ListCell.self))
        
//        initRefresh() full to refresh
    }
    
    deinit {
        print("ListVC deinit")
    }

    //    MARK: - tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ListTableView.dequeueReusableCell(withIdentifier: String.init(describing: ListCell.self)) as!  ListCell

        cell.nameLabel.text = songs[indexPath.row].name
        cell.songLabel.text = songs[indexPath.row].song
    
        let thumbnail: String = songs[indexPath.row].img
        
        let url = URL(string: String(thumbnail))
        
        do {
            let data = try Data(contentsOf: url!)
            cell.thumbView.image = UIImage(data: data)
        } catch {
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title:  "delete", handler: { [self] (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            // Call edit action
            let songID = songs[indexPath.row].id
            AF.request(url + "/" + songID, method: .delete)
                .validate(statusCode: 200..<300)
                .response { response in
                    print(response)
                }
    
            getSongArray(indexPath)
            // Reset state
            success(true)
        })
        let editAction = UIContextualAction(style: .normal, title:  "edit", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            // Call edit action
            // Reset state
            success(true)
        })
        
        return UISwipeActionsConfiguration(actions:[deleteAction, editAction])
    }
    
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        return .delete
//    }
//
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        print("삭제됨")
//
//        print("\(indexPath.row)")
//
//        let songID = songs[indexPath.row].id
//        AF.request(url + "/" + songID, method: .delete)
//            .validate(statusCode: 200..<300)
//            .response { response in
//                print(response)
//            }
//
//        getSongArray(indexPath)
//
//    }

// MARK: - full to refresh
//    func initRefresh() {
//        let refresh = UIRefreshControl()
//        refresh.addTarget(self, action: #selector(updateUI(refresh:)), for: .valueChanged)
//        refresh.attributedTitle = NSAttributedString(string: "새로고침")
//
//        if #available(iOS 10.0, *) {
//            ListTableView.refreshControl = refresh
//        } else {
//            ListTableView.addSubview(refresh)
//        }
//    }
//
//    @objc func updateUI(refresh:UIRefreshControl) {
//        refresh.endRefreshing()
//        ListTableView.reloadData()
//        getSongArray()
//        print("new : \(songs)")
//    }

   
    //    MARK: - AF get
    func getSongArray(_ indexPath: IndexPath? = nil) {
        AF.request(url)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .response { [weak self] data in
                switch data.result {
                case .success(let data):
                    print("Validation Successful")
                    
                    guard let self = self else {
                        return
                    }
                    
                    do {
                        let serverData = try JSONDecoder().decode([Song].self, from: data!)
                        
                        if self.isFirstCall { // 처음 불러왔을 때
                            DispatchQueue.main.async {
                                self.ListTableView.reloadData()
                            }
                            self.isFirstCall = false
                            self.songs = serverData
                        }
                        else {
                            
                            // 2개 배열 비교 달라진 인덱스 배열을 가져옴.
                            
                            if self.songs.count == serverData.count {
                                return
                            }
                            else if self.songs.count > serverData.count { // row delete 했을 때
                                DispatchQueue.main.async {
                                    
                                    let arrayIndexPath: [IndexPath] = [indexPath!]
                                    self.songs = serverData
                                    
                                    self.ListTableView.beginUpdates()
                                    self.ListTableView.deleteRows(at: arrayIndexPath, with: UITableView.RowAnimation.left)
                                    self.ListTableView.endUpdates()
                                }
                                
                            }
                            else { // write 에서 추가 했을 때
                                
                                DispatchQueue.main.async {
                                    
                                    let insertIndexPath = IndexPath(row: self.songs.count, section: 0)
                                    let arrayIndexPath: [IndexPath] = [insertIndexPath]
                                    self.songs = serverData
                                    self.ListTableView.beginUpdates()
                                    self.ListTableView.insertRows(at: arrayIndexPath, with: UITableView.RowAnimation.left)
                                    self.ListTableView.endUpdates()
                                    
                                    self.ListTableView.scrollToRow(at: arrayIndexPath.last!, at: UITableView.ScrollPosition.bottom, animated: true)
                                }
                                
                            }
                        }
                        
                        
                        
                        print(self.songs)
                        
                        
                        
                    } catch {
                        print("decoding Error: \(error)")
                    }
                   
                case let .failure(error):
                    print(error)
                }
            }
    }
}

// MARK: - view life cycle
extension ListVC {
    override func viewWillAppear(_ animated: Bool) {
        print("ListVC viewWillAppear")
        getSongArray()
    }

    override func viewDidAppear(_ animated: Bool) {
        print("ListVC viewDidAppear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        print("ListVC viewWillDisappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        print("ListVC viewDidDisappear")
    }
}
