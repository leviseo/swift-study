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
    @IBOutlet weak var submitBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.songField.delegate = self
        self.submitBtn.isEnabled = false
        self.nameField.becomeFirstResponder() // 처음 진입 시 이름 입력에 포커스
    }
    
    deinit {
        print("WriteVC deinit")
    }
    
    @IBAction func editChanged(_ sender: UITextField) {
        if (nameField.text != "" && songField.text != "") {
            self.submitBtn.isEnabled = true
        } else {
            self.submitBtn.isEnabled = false
        }
    }
   
    @IBAction func submit(_ sender: Any) {
        write()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        songField.resignFirstResponder()
        write()
        return true
    }
//    MARK: - 새 음악 등록
    func write() {
        let name: String = nameField.text!
        let song: String = songField.text!
        let img: String = imgField.text!.isEmpty ? "http://via.placeholder.com/60" : imgField.text!
        
        createSong(name: name, img: img, song: song)
        
        nameField.text = ""
        songField.text = ""
        imgField.text = ""
    }
    
//    MARK: - 새 음악 등록 통신
    func createSong(name: String, img: String, song: String) {
        let parameters: [String : String] = [
            "name": name,
            "img": img,
            "song": song
        ]
        
        //    MARK: - API        
        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default)
            .validate(statusCode: 200..<300)
            .response { response in
                print(parameters)
            }
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
