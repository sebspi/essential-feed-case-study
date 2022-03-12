//
//  FeedLoader.swift
//  Essential Feed
//
//  Created by Sebastian Spies on 19.02.22.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedImage])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping(LoadFeedResult) -> Void)
}
