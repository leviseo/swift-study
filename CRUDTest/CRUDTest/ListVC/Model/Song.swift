//
//  Song.swift
//  CRUDTest
//
//  Created by 서주희 on 2020/11/09.
//

import Foundation

struct Song: Codable {
    var name: String
    var img: String
    var song: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case img = "img"
        case song = "song"
    }
}


