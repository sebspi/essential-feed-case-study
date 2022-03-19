//
//  LocalFeedItem.swift
//  Essential Feed
//
//  Created by Sebastian Spies on 12.03.22.
//

import Foundation

public struct LocalFeedImage: Equatable, Codable {
    let id: UUID
    let description: String?
    let location: String?
    let url: URL
    
    public init(id: UUID,
                description: String? = nil,
                location: String? = nil,
                url: URL) {
        self.id = id
        self.description = description
        self.location = location
        self.url = url
    }
}
