//
//  VideoId.swift
//  CRUDTest
//
//  Created by Levi on 2020/12/04.
//

import Foundation

// MARK: - VideoID
struct VideoID: Codable {
    let items: [Item]
    enum CodingKeys: String, CodingKey {
        case items = "items"
    }
}

// MARK: - Item
struct Item: Codable {
    let id: ID
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
    }
}

// MARK: - ID
struct ID: Codable {
    let videoID: String

    enum CodingKeys: String, CodingKey {
        case videoID = "videoId"
    }
}
