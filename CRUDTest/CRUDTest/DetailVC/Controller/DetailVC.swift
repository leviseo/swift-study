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
    @IBOutlet weak var playerView: WKYTPlayerView!
    
    var nameSong: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getVideoId()
    }
    
    
//    MARK: - youtube API
    let videoUrl = "https://www.googleapis.com/youtube/v3/search"
    
    func getVideoId() {
        let parameters = [
            "key" : "",
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
                        }
                        else {
                            let resultVideoId: String = videoID.items[0].id.videoID
                            self.playerView.load(withVideoId: resultVideoId)
                        }
                    }
                    catch {
                        print("decoding Error: \(error)")
                    }
                case .failure(_):
                    print("유튜브 통신 실패")
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
