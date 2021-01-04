//
//  WriteVC.swift
//  CRUDTest
//
//  Created by 서주희 on 2020/11/08.
//

import UIKit
import Alamofire

class WriteVC: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var imgField: UITextField!
    @IBOutlet weak var songField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.songField.delegate = self
        self.nameField.becomeFirstResponder() // 처음 진입 시 이름 입력에 포커스
        
        let saveBtn = UIBarButtonItem(title: "save", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.write))
        saveBtn.isEnabled = false
        self.navigationItem.rightBarButtonItem = saveBtn
        self.navigationItem.title = "새로운 곡 추가"
    }
    
    // MARK: - 첫 진입 시 텍스트 필드 커서 및 버튼 활성화 초기화
        func textFieldDefaultSetting() {
            self.nameField.text = ""
            self.songField.text = ""
            self.imgField.text = ""
            self.nameField.becomeFirstResponder()
            self.navigationItem.rightBarButtonItem?.isEnabled = false
        }
    
    // MARK: - 뒤로가기
    func goToBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - textField 입력 시 (save 버튼 활성/비활성 토글)
    @IBAction func editChanged(_ sender: UITextField) {
        if (nameField.text != "" && songField.text != "") {
            // nameField.text.count * songField.text.count != 0
            self.navigationItem.rightBarButtonItem?.isEnabled = true
        } else {
            self.navigationItem.rightBarButtonItem?.isEnabled = false
        }
    }
    
    // MARK: - 키보드 return (입력값 없을 시 알럿)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.write()
        self.songField.resignFirstResponder()
        return true
    }
    
    // MARK: - 밸리데이션 알럿
    func validationAlert(title: String) {
        let validationAlert = UIAlertController(title: title, message: nil, preferredStyle: UIAlertController.Style.alert)
        
        let validationAlertConfirm = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
        
        validationAlert.addAction(validationAlertConfirm)
        
        present(validationAlert, animated: true, completion: nil)
    }
    
    // MARK: - 추가 등록 알럿
    func alertMoreAddSong() {
        let alert = UIAlertController(title: "추가로 더 등록하시겠습니까?", message: "취소 선택 시 리스트로 돌아갑니다.", preferredStyle: UIAlertController.Style.alert)
        let defaultAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.cancel, handler: { action in
            self.goToBack()
        })
        let cancelAction = UIAlertAction(title: "추가등록", style: UIAlertAction.Style.default, handler: { action in
            self.textFieldDefaultSetting()
            
        })
        
        alert.addAction(defaultAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - 새 음악 등록
    @objc func write() {
        let name: String = self.nameField.text!
        let song: String = self.songField.text!
        let img: String = imgField.text!.isEmpty ? "http://via.placeholder.com/60" : imgField.text!
        
        if name.isEmpty {
            self.validationAlert(title: "이름을 입력해주세요.")
        }
        else if song.isEmpty {
            self.validationAlert(title: "제목을 입력해주세요.")
        }
        else {
            createSong(name: name, img: img, song: song)
            
            self.alertMoreAddSong()
            self.textFieldDefaultSetting()
        }
    }
    
    // MARK: - 새 음악 등록 통신
    func createSong(name: String, img: String, song: String) {
        let parameters: [String : String] = [
            "img": img,
            "song": song,
            "name": name
        ]
        
        // MARK: - API
        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default)
            .validate(statusCode: 200..<300)
            .response { response in
                print(parameters)
            }
    }
    
    deinit {
        print("WriteVC deinit")
    }
}
// MARK: - view life cycle
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
