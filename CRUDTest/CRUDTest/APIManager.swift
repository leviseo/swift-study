//
//  APIManager.swift
//  CRUDTest
//
//  Created by Levi on 2020/11/12.
//

import UIKit
//import Alamofire

// local url
let url = "http://172.25.101.206:3002/api/v1/singers"
//let url = "http://192.168.0.3:3002/api/v1/singers"
//
//class APIManager {
//    static let shared = APIManager()
//
//    let url = "http://172.25.101.206:3002/api/v1/singers"
////        let url = "http://192.168.0.22:3002/api/v1/singers"
//
//}

//extension APIManager {
//    //    MARK: - AF get
//        func getSongArray() {
//            AF.request(url)
//                .validate(statusCode: 200..<300)
//                .validate(contentType: ["application/json"])
//                .response { data in
//                    switch data.result {
//                    case .success(let data):
//                        print("Validation Successful")
//
//    //                    print("type", type(of: data))
//
//                        do {
//                            let songArray = try JSONDecoder().decode([Song].self, from: data!)
//                            Songs.init(list: songArray)
//                            print(songs)
//
//                        } catch {
//                            print("decoding Error: \(error)")
//                        }
//
//                    case let .failure(error):
//                        print(error)
//                    }
//                }
//        }
//}
