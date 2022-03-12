//
//  FeedStore.swift
//  Essential Feed
//
//  Created by Sebastian Spies on 12.03.22.
//

import Foundation

public protocol FeedStore {
    typealias DeletionCompletion = (Error?) -> Void
    typealias InsertionCompletion = (Error?) -> Void
    
    func deleteCachedFeed(completion: @escaping DeletionCompletion)
    func insert(_ items: [LocalFeedItem], timestamp: Date, completion: @escaping InsertionCompletion)
}

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
