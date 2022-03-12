//
//  LocalFeedItem.swift
//  Essential Feed
//
//  Created by Sebastian Spies on 12.03.22.
//

import Foundation

public struct LocalFeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
    
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
