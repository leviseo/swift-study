//
//  Song.swift
//  CRUDTest
//
//  Created by 서주희 on 2020/11/09.
//

import Foundation

struct Song: Codable, Equatable {
    var id: String
    var img: String
    var song: String
    var name: String
    var youtube: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case img = "img"
        case song = "song"
        case name = "name"
        case youtube = "youtube"
    }
    
    static func ==(lhs: Song, rhs: Song) -> Bool {
        return lhs.id == rhs.id
            && lhs.img == rhs.img
            && lhs.name == rhs.name
            && lhs.song == rhs.song
    }
}

extension Collection where Element == Song {
    func diffIndies(_ items: [Song]) -> [Index] {
        return self.indices.filter{!items.contains(self[$0])}
    }
}



//typealias Songs = [Song]

//var songs: [Song] = []

