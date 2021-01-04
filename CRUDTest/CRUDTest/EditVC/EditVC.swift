//
//  EditVC.swift
//  CRUDTest
//
//  Created by Levi on 2020/11/27.
//

import UIKit
import Alamofire

enum CellType {
    case thumbNail
    case song
    case name
}

struct EditItem {
    let cellType: CellType
    let title: String
    let textfield: String
}

class EditVC: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    
    var editSong: Song?
    var editList: [EditItem] = []
    
    @IBOutlet weak var editTable: UITableView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableView()
        
        // navigation
        let naviSaveBtn = UIBarButtonItem(title: "save", style: UIBarButtonItem.Style.done, target: self, action: #selector(edit))
        let naviCancelBtn = UIBarButtonItem(title: "cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(dismissVC))
        
        self.navigationItem.leftBarButtonItem = naviCancelBtn
        self.navigationItem.rightBarButtonItem = naviSaveBtn
        self.navigationItem.title = "Edit"
        self.navigationItem.largeTitleDisplayMode = .never
       
        // Edit List
        let thumb = EditItem(cellType: .thumbNail, title: "", textfield: editSong?.img ?? "http://via.placeholder.com/60")
        let song = EditItem(cellType: .song, title: "노래제목", textfield: editSong?.song ?? "")
        let name = EditItem(cellType: .name, title: "가수이름", textfield: editSong?.name ?? "")
        
        self.editList.append(thumb)
        self.editList.append(song)
        self.editList.append(name)
    }
    
    @IBAction func clickConfirmBtn(_ sender: Any) {
        self.edit()
    }
    
    // MARK: - 닫기
    @objc func dismissVC() {
        self.navigationController?.popViewController(animated: true)
    }

    // MARK: - 키보드 return 입력 시
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        self.songField.resignFirstResponder()
        self.edit()
        return true
    }
    
    // MARK: - song 수정
    @objc func edit() {
//        let name: String = nameField.text!
//        let song: String = songField.text!
//        let img: String = imgField.text!.isEmpty ? "http://via.placeholder.com/60" : imgField.text!
//        
//        self.updateSong(name: name, img: img, song: song)
        let detailVC = DetailVC()
        detailVC.detailSong = self.editSong
        self.dismissVC()
    }
    
    // MARK: - song 수정 통신
    func updateSong(name: String, img: String, song: String) {
        let parameters: [String : String] = [
            "name": name,
            "img": img,
            "song": song
        ]
        
        let songID:String = String(editSong!.id)
        AF.request(url + "/" + songID, method: .patch, parameters: parameters, encoder: JSONParameterEncoder.default)
            .validate(statusCode: 200..<300)
            .response { response in
                print(parameters)
            }
    }
    
    func changeThumbnail(_ imgUrl: String) {
        <#function body#>
    }
    
//    MARK: - deinit
    deinit {
        print("EditVC deinit")
    }
}

// MARK: - table 추가
extension EditVC: UITableViewDelegate, UITableViewDataSource {
    func setTableView() {
        self.editTable.delegate = self
        self.editTable.dataSource = self
        
        self.registerCell()
    }
    
    // Nib 등록
    func registerCell() {
        let thumbnailNib = UINib(nibName: String.init(describing: ThumbnailCell.self), bundle: nil)
        self.editTable.register(thumbnailNib, forCellReuseIdentifier: String.init(describing: ThumbnailCell.self))
        
        let textfieldNib = UINib(nibName: String.init(describing: TextfieldCell.self), bundle: nil)
        self.editTable.register(textfieldNib, forCellReuseIdentifier: String.init(describing: TextfieldCell.self))
    }
    
    // number of row
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return editList.count
    }
    
    // img alert
    @objc func imgUrlAddAlert () {
        // Alert
        let alertUrlAdd = UIAlertController(title: "앨범 이미지 url을 입력해주세요.", message: nil, preferredStyle: UIAlertController.Style.alert)
        let addCancelAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.cancel, handler: nil)
        let urlAddAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: { (changedImg) in
            
            print(changedImg)
        })
        
        alertUrlAdd.addAction(urlAddAction)
        alertUrlAdd.addAction(addCancelAction)
        alertUrlAdd.addTextField(configurationHandler: { (textField) in
            textField.text = self.editSong?.img
        })
        
        present(alertUrlAdd, animated: true, completion: nil)
    }
    
    // cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = editList[indexPath.row]
        
        switch item.cellType {
        
        case .thumbNail:
            let thumbCell = editTable.dequeueReusableCell(withIdentifier: String.init(describing: ThumbnailCell.self)) as! ThumbnailCell
            
            let thumbnail: String = editSong!.img
            
            let url = URL(string: String(thumbnail))
            
            do {
                let data = try Data(contentsOf: url!)
                thumbCell.thumbNail.image = UIImage(data: data)
            } catch {
            }
            
            thumbCell.songImg = editSong?.img
            
            thumbCell.urlBtn.addTarget(Any?.self, action: #selector(imgUrlAddAlert), for: UIControl.Event.touchUpInside)
            
            return thumbCell
            
        case .name:
            let nameCell = editTable.dequeueReusableCell(withIdentifier: String.init(describing: TextfieldCell.self)) as! TextfieldCell
            nameCell.label.text = "가수이름"
            nameCell.textfield.text = self.editSong?.name
            
            return nameCell
        
        case .song:
            let songCell = editTable.dequeueReusableCell(withIdentifier: String.init(describing: TextfieldCell.self)) as! TextfieldCell
            songCell.label.text = "노래제목"
            songCell.textfield.text = self.editSong?.song
            
            return songCell
        }
    }
}

// MARK: - view life cycle
extension EditVC {
    override func viewWillAppear(_ animated: Bool) {
        print("EditVC viewWillAppear")
    }

    override func viewDidAppear(_ animated: Bool) {
        print("EditVC viewDidAppear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        print("EditVC viewWillDisappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        print("EditVC viewDidDisappear")
    }
}
