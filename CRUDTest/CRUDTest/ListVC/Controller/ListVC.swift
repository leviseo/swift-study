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
    
    @IBOutlet var listTableView: UITableView!
    
    var songs: [Song] = []
    
    var isFirstCall: Bool = true
    var indexPathOfEditRow: IndexPath?
    var indexPathOfMultiSelectedRows: [Int] = []
    
    lazy var naviAddBtn: UIBarButtonItem = UIBarButtonItem(image: UIImage.init(systemName: "plus"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(moveToWrite))
    
    lazy var naviCancelBtn: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.stop, target: self, action: #selector(multiSelectClose))
    
    lazy var naviDeleteBtn: UIBarButtonItem = UIBarButtonItem(image: UIImage.init(systemName: "trash"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(multiSelect))
    
    lazy var naviEditBtn: UIBarButtonItem = UIBarButtonItem(title: "Edit", style: UIBarButtonItem.Style.plain, target: self, action: #selector(multiSelect))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.navigationItem.title = "melon 최신곡"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.navigationItem.rightBarButtonItem = self.naviAddBtn
        self.navigationItem.leftBarButtonItem = self.naviEditBtn
        
        let cellNib = UINib(nibName: String.init(describing: ListCell.self), bundle: nil)
        listTableView.register(cellNib, forCellReuseIdentifier: String.init(describing: ListCell.self))
        
        self.listTableView.allowsMultipleSelectionDuringEditing = true
    }
    
    //    MARK: - 새로운 곡 추가로 이동
    @objc func moveToWrite() {
        let writeVC = WriteVC()
        self.listTableView.setEditing(false, animated: true)
        self.navigationController?.pushViewController(writeVC, animated: true)
    }
    
    //    MARK: - 다중선택
    @objc func multiSelect() {
        self.listTableView.setEditing(true, animated: true)
        self.naviDeleteBtn.action = #selector(multiDelete)
        self.navigationItem.leftBarButtonItem = self.naviDeleteBtn
        self.navigationItem.leftBarButtonItem?.isEnabled = false
        self.navigationItem.rightBarButtonItem = self.naviCancelBtn
    }

    //    MARK: - 다중선택 시 닫기
    @objc func multiSelectClose() {
        self.listTableView.setEditing(false, animated: true)
        self.naviDeleteBtn.action = #selector(multiSelect)
        self.navigationItem.leftBarButtonItem = self.naviEditBtn
        self.navigationItem.leftBarButtonItem?.isEnabled = true
        self.navigationItem.rightBarButtonItem = self.naviAddBtn
    }
    
    //    MARK: - 다중선택 삭제
    @objc func multiDelete() {
        
        let alertDelete = UIAlertController(title: "삭제하시겠습니까?", message: "삭제 시 복구 불가. 재등록 가능", preferredStyle: UIAlertController.Style.alert)
        let deleteCacnel = UIAlertAction(title: "취소", style: UIAlertAction.Style.cancel, handler: nil)
        let deleteAlertAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default) { (UIAlertAction) in
            for item in self.indexPathOfMultiSelectedRows {
                
                let songID = self.songs[item].id
        
                AF.request(url + "/" + songID, method: .delete)
                    .validate(statusCode: 200..<300)
                    .response { response in
                        print(response)
                    }
            }
            
            self.getSongArray()
            self.multiSelectClose()
        }
        alertDelete.addAction(deleteCacnel)
        alertDelete.addAction(deleteAlertAction)
        
        present(alertDelete, animated: true, completion: nil)
    }

    //    MARK: - tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }

    //   MARK: - tableViewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTableView.dequeueReusableCell(withIdentifier: String.init(describing: ListCell.self)) as!  ListCell

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

    //    MARK: - 테이블 행 선택 해제 시
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if self.listTableView.isEditing {
            // multi select
            let selectedRows = self.listTableView.indexPathsForSelectedRows?.compactMap{$0.last}
            
            if selectedRows == nil {
                self.navigationItem.leftBarButtonItem?.isEnabled = false
            }
            else {
                self.navigationItem.leftBarButtonItem?.isEnabled = true
                self.indexPathOfMultiSelectedRows = selectedRows!
            }
        }
        else {
            // single select
            return
        }
    }

    //    MARK: - 테이블 행 선택 시
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.listTableView.isEditing {
            // multi select
            let selectedRows = self.listTableView.indexPathsForSelectedRows?.compactMap{$0.last}
            
            if selectedRows == nil {
                self.navigationItem.leftBarButtonItem?.isEnabled = false
            }
            else {
                self.navigationItem.leftBarButtonItem?.isEnabled = true
                self.indexPathOfMultiSelectedRows = selectedRows!
                print("selectedRows :  \(String(describing: selectedRows))")
            }
        }
        else {
            // single select
            let detailVC = DetailVC()
            detailVC.detailSong = self.songs[indexPath.row]
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }

    //    MARK: - 행 스와이프 시 수정, 삭제
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
    
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
//            let editNavi = UINavigationController(rootViewController: editVC)
            self.navigationController?.pushViewController(editVC, animated: true)
//            self.navigationController?.present(editNavi, animated: true)
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
                                self.listTableView.reloadData()
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
                                                                        
                                    self.listTableView.beginUpdates()
                                    self.listTableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.none)
                                    self.listTableView.endUpdates()
                                    
                                    self.indexPathOfEditRow = nil
                                }
                            }
                            else if self.songs.count > serverData.count {
                                // row delete 했을 때
                                DispatchQueue.main.async {
//                                    let arrayIndexPath: [IndexPath] = [indexPath!]
//                                    let deleteIndexPath = IndexPath(row: deletedSongIndex[0], section: 0)
//                                    let arrayIndexPath: [IndexPath] = [deleteIndexPath]
                                    
                                    var arrayIndexPath: [IndexPath] = []
                                    
                                    for i in 0...deletedSongIndex.count - 1 {
                                        let insertIndexPath = IndexPath(row: deletedSongIndex[i], section: 0)
                                        arrayIndexPath.append(insertIndexPath)
                                        print(arrayIndexPath)
                                    }
                                    
                                    self.songs = serverData
                                    
                                    self.listTableView.beginUpdates()
                                    self.listTableView.deleteRows(at: arrayIndexPath, with: UITableView.RowAnimation.left)
                                    self.listTableView.endUpdates()
                                }
                                
                            }
                            else {
                                // write 에서 추가 했을 때
                                DispatchQueue.main.async {
//                                    let insertIndexPath = IndexPath(row: self.songs.count, section: 0)
//                                    let arrayIndexPath: [IndexPath] = [insertIndexPath]
                                    
                                    var arrayIndexPath: [IndexPath] = []
                                    
                                    for i in 0...addedSongIndex.count - 1 {
                                        let insertIndexPath = IndexPath(row: addedSongIndex[i], section: 0)
                                        arrayIndexPath.append(insertIndexPath)
                                        print(arrayIndexPath)
                                    }

                                    self.songs = serverData
                                    self.listTableView.beginUpdates()
                                    self.listTableView.insertRows(at: arrayIndexPath, with: UITableView.RowAnimation.left)
                                    self.listTableView.endUpdates()
                                    
                                    self.listTableView.scrollToRow(at: arrayIndexPath.last!, at: UITableView.ScrollPosition.bottom, animated: true)
                                }
                                
                            }
                        }
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
