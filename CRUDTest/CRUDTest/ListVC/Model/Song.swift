//
//  Song.swift
//  CRUDTest
//
//  Created by 서주희 on 2020/11/09.
//

import Foundation

struct Song: Codable {
    let name: String
    let img: String
    let song: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case img = "img"
        case song = "song"
    }
}
