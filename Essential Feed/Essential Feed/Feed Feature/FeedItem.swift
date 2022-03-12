//
//  FeedItem.swift
//  Essential Feed
//
//  Created by Sebastian Spies on 19.02.22.
//

import Foundation

public struct FeedItem: Equatable {
    public let id: UUID
    public let description: String?
    public let location: String?
    public let imageURL: URL
    
    public init(id: UUID,
                description: String? = nil,
                location: String? = nil,
                imageURL: URL) {
        self.id = id
        self.description = description
        self.location = location
        self.imageURL = imageURL
    }
}
