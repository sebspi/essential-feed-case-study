//
//  FeedItem.swift
//  Essential Feed
//
//  Created by Sebastian Spies on 19.02.22.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}

extension FeedItem: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id
        case description
        case location
        case imageURL = "image"
    }
}
