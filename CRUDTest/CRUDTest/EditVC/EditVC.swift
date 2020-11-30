//
//  EditVC.swift
//  CRUDTest
//
//  Created by Levi on 2020/11/27.
//

import UIKit
import Alamofire

class EditVC: UIViewController {
    
    var editSong: Song?
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var imgField: UITextField!
    @IBOutlet weak var songField: UITextField!
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var confirmBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nameField.text = editSong?.name
        imgField.text = editSong?.img
        songField.text = editSong?.song
    }
    
    
    @IBAction func clickCloselBtn(_ sender: Any) {
        dismissVC()
    }
    
    @IBAction func clickCancelBtn(_ sender: Any) {
        dismissVC()
    }
    
    @IBAction func clickConfirmBtn(_ sender: Any) {
        let name: String = nameField.text!
        let song: String = songField.text!
        let img: String = imgField.text!.isEmpty ? "http://via.placeholder.com/60" : imgField.text!
        
        updateSong(name: name, img: img, song: song)
        
        dismissVC()
    }
    
    func updateSong(name: String, img: String, song: String) {
        let parameters: [String : String] = [
            "name": name,
            "img": img,
            "song": song
        ]
        
        //    MARK: - API
        let songID:String = String(editSong!.id)
        AF.request(url + "/" + songID, method: .patch, parameters: parameters, encoder: JSONParameterEncoder.default)
            .validate(statusCode: 200..<300)
            .response { response in
                print(parameters)
            }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
//    MARK: - 닫기
    func dismissVC() {
        self.dismiss(animated: true)
    }

    
    
    
//    MARK: - deinit
    deinit {
        print("EditVC deinit")
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

