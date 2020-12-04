//
//  VideoId.swift
//  CRUDTest
//
//  Created by Levi on 2020/12/04.
//

import Foundation

// MARK: - VideoID
struct VideoID: Codable {
    let pageInfo: PageInfo
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let kind, etag: String
    let id: ID
}

// MARK: - ID
struct ID: Codable {
    let kind, videoID: String

    enum CodingKeys: String, CodingKey {
        case kind
        case videoID = "videoId"
    }
}

// MARK: - PageInfo
struct PageInfo: Codable {
    let totalResults, resultsPerPage: Int
}

