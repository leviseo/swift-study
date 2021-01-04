//
//  DetailVC.swift
//  CRUDTest
//
//  Created by Levi on 2020/12/01.
//

import UIKit
import Alamofire
import YoutubePlayer_in_WKWebView

class DetailVC: UIViewController {
    
    var detailSong: Song?
    
    @IBOutlet weak var playerView: WKYTPlayerView!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var thumbNail: UIImageView!
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var nameSong: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.largeTitleDisplayMode = .never
        self.errorLabel.isHidden = true
        self.getVideoId()
        
        self.songLabel.text = detailSong?.song
        self.nameLabel.text = detailSong?.name
        
        let thumbnail: String = detailSong!.img
        
        let url = URL(string: String(thumbnail))
        
        do {
            let data = try Data(contentsOf: url!)
            self.thumbNail.image = UIImage(data: data)
        } catch {
        }
        
//        let naviEditItem = UIBarButtonItem(title: "Edit", style: UIBarButtonItem.Style.plain, target: self, action: #selector(goToEditVC))
//        self.navigationItem.rightBarButtonItem = naviEditItem
    }
    
//    MARK: - edit으로 이동
    @objc func goToEditVC() {
        let editVC = EditVC()
        editVC.editSong = self.detailSong
        self.navigationController?.pushViewController(editVC, animated: true)
    }
    
//    MARK: - youtube API
    let videoUrl = "https://www.googleapis.com/youtube/v3/search"
    
    func getVideoId() {
        nameSong = String(self.detailSong!.name) + "+" + String(self.detailSong!.song)
        let parameters = [
            "key" : "AIzaSyBonXwu5yBAk0W0Mclq2cGOg5uazniXFP0",
            "q": nameSong
        ]
        
        print(parameters)
        
        AF.request(videoUrl, method: .get, parameters: parameters)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .response { [weak self] data in
                switch data.result {
                case .success(let data):
                    print("유튜브 Validation Successful")
                    
                    guard let self = self else { return }
                    
                    do {
                        let videoID = try JSONDecoder().decode(VideoID.self, from: data!)
                        
                        if videoID.items.isEmpty {
                            print("item 이 비어있음")
                            self.errorLabel.isHidden = false
                            self.errorLabel.text = "youtube video 목록 받아오기 실패"
                        }
                        else {
                            let resultVideoId: String = videoID.items[0].id.videoID
                            self.playerView.load(withVideoId: resultVideoId)
                            print("받아온 결과 video ID : \(resultVideoId)")
                        }
                    }
                    catch {
                        print("decoding Error: \(error)")
                        self.errorLabel.isHidden = false
                        self.errorLabel.text = "youtube video ID 받아오기 실패"
                    }
                case .failure(_):
                    print("유튜브 통신 실패")
                    self?.errorLabel.isHidden = false
                    self?.errorLabel.text = "youtube API 통신 실패"
                }
            }
    }
    
    deinit {
        print("DetailVC deinit")
    }
}

// MARK: - view life cycle
extension DetailVC {
    override func viewWillAppear(_ animated: Bool) {
        print("DetailVC viewWillAppear")
    }

    override func viewDidAppear(_ animated: Bool) {
        print("DetailVC viewDidAppear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        print("DetailVC viewWillDisappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        print("DetailVC viewDidDisappear")
    }
}
