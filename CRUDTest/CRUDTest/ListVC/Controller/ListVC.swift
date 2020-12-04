//
//  ListVC.swift
//  CRUDTest
//
//  Created by 서주희 on 2020/11/07.
//

import UIKit
import SafariServices
import Alamofire

class ListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var ListTableView: UITableView!
    
    var songs: [Song] = []
    
    var isFirstCall: Bool = true
    var indexPathOfEditRow: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "List"
        let navigationRightBtn: UIBarButtonItem = UIBarButtonItem(image: UIImage.init(systemName: "plus"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.moveToWrite))
        let navigationLeftBtn: UIBarButtonItem = UIBarButtonItem(image: UIImage.init(systemName: "trash"), style: UIBarButtonItem.Style.plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = navigationRightBtn
        self.navigationItem.leftBarButtonItem = navigationLeftBtn
        
        let cellNib = UINib(nibName: String.init(describing: ListCell.self), bundle: nil)
        ListTableView.register(cellNib, forCellReuseIdentifier: String.init(describing: ListCell.self))
    }
    
    @objc func moveToWrite() {
        let writeVC = WriteVC()
        self.navigationController?.pushViewController(writeVC, animated: true)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let youtubeUrl : String = "https://www.youtube.com/results?search_query=" + String(songs[indexPath.row].name) + "+" + String(songs[indexPath.row].song)
        print(youtubeUrl)
        
        self.navigationController?.pushViewController(DetailVC(), animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title:  "delete", handler: { [weak self] (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            // Call delete action
            guard let self = self else { return }
            let songID = self.songs[indexPath.row].id
            AF.request(url + "/" + songID, method: .delete)
                .validate(statusCode: 200..<300)
                .response { response in
                    print(response)
                }
    
            self.getSongArray()
            // Reset state
            success(true)
        })
        
        let editAction = UIContextualAction(style: .normal, title:  "edit", handler: { [weak self] (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            guard let self = self else { return }
            // Call edit action
            let editVC = EditVC()
            editVC.editSong = self.songs[indexPath.row]
            self.indexPathOfEditRow = indexPath
            editVC.modalPresentationStyle = .fullScreen
            self.navigationController?.present(editVC, animated: true)
            // Reset state
            success(true)
        })
        
        return UISwipeActionsConfiguration(actions:[deleteAction, editAction])
    }
    
    //    MARK: - AF get
    func getSongArray() {
        AF.request(url)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .response { [weak self] data in
                switch data.result {
                case .success(let data):
                    print("Validation Successful")
                    
                    guard let self = self else { return }
                    
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
                            let addedSongIndex = serverData.diffIndies(self.songs)
                            print("added index : ", addedSongIndex)
                            
                            let deletedSongIndex = self.songs.diffIndies(serverData)
                            print("deleted index : ", deletedSongIndex)
                            
                            
                            if self.songs.count == serverData.count {
                                
                                if self.songs.elementsEqual(serverData) {
                                    return
                                }
                                
                                DispatchQueue.main.async {
                                    self.songs = serverData
                                    
                                    guard let indexPath = self.indexPathOfEditRow else {
                                        return
                                    }
                                                                        
                                    self.ListTableView.beginUpdates()
                                    self.ListTableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.none)
                                    self.ListTableView.endUpdates()
                                    
                                    self.indexPathOfEditRow = nil
                                }
                            }
                            else if self.songs.count > serverData.count { // row delete 했을 때
                                DispatchQueue.main.async {
                                    
//                                    let arrayIndexPath: [IndexPath] = [indexPath!]
                                    let deleteIndexPath = IndexPath(row: deletedSongIndex[0], section: 0)
                                    let arrayIndexPath: [IndexPath] = [deleteIndexPath]
                                    self.songs = serverData
                                    
                                    self.ListTableView.beginUpdates()
                                    self.ListTableView.deleteRows(at: arrayIndexPath, with: UITableView.RowAnimation.left)
                                    self.ListTableView.endUpdates()
                                }
                                
                            }
                            else { // write 에서 추가 했을 때
                                
                                DispatchQueue.main.async {
                                    
//                                    let insertIndexPath = IndexPath(row: self.songs.count, section: 0)
                                    let insertIndexPath = IndexPath(row: addedSongIndex[0], section: 0)
                                    let arrayIndexPath: [IndexPath] = [insertIndexPath]
                                    self.songs = serverData
                                    self.ListTableView.beginUpdates()
                                    self.ListTableView.insertRows(at: arrayIndexPath, with: UITableView.RowAnimation.left)
                                    self.ListTableView.endUpdates()
                                    
                                    self.ListTableView.scrollToRow(at: arrayIndexPath.last!, at: UITableView.ScrollPosition.bottom, animated: true)
                                }
                                
                            }
                        }
                        
//                        print(self.songs)
                        
                    } catch {
                        print("decoding Error: \(error)")
                    }
                   
                case let .failure(error):
                    print(error)
                }
            }
    }
    
    
    deinit {
        print("ListVC deinit")
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
