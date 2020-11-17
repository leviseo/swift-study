//
//  WriteVC.swift
//  CRUDTest
//
//  Created by 서주희 on 2020/11/08.
//

import UIKit
import Alamofire

class WriteVC: UIViewController, UITextViewDelegate {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var imgField: UITextField!
    @IBOutlet weak var songField: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.submitBtn.isEnabled = false
    }
    
    @IBAction func editChanged(_ sender: UITextField) {
        if (nameField.text != "" && imgField.text != "" && songField.text != "") {
            self.submitBtn.isEnabled = true
        } else {
            self.submitBtn.isEnabled = false
        }
    }
   
    @IBAction func submit(_ sender: Any) {
        let name: String = nameField.text!
        let img: String = imgField.text!
        let song: String = songField.text!
        
        createSong(name: name, img: img, song: song)
    }
    
//    MARK: - 새 음악 등록
    func createSong(name: String, img: String, song: String) {
        let parameters: [String : String] = [
            "name": name,
            "img": img,
            "song": song
        ]
        
        //    MARK: - API
        let url = "http://172.25.101.206:3002/api/v1/singers"
//        let url = "http://192.168.0.22:3002/api/v1/singers"
        
        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default)
            .validate(statusCode: 200..<300)
            .response { response in
                print(response)
            }
    }
    
}
// MARK: - view life cycle
extension WriteVC {
    override func viewWillAppear(_ animated: Bool) {
        print("WriteVC viewWillAppear")
//        처음 진입 시 이름 입력에 포커스
        self.nameField.becomeFirstResponder()
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
