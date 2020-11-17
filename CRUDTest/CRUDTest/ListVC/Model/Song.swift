//
//  Song.swift
//  CRUDTest
//
//  Created by 서주희 on 2020/11/09.
//

import Foundation

struct Song: Codable {
    var id: String
    var name: String
    var img: String
    var song: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case img = "img"
        case song = "song"
    }
}
