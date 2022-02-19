//
//  FeedLoader.swift
//  Essential Feed
//
//  Created by Sebastian Spies on 19.02.22.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func loadItems(completion: @escaping(LoadFeedResult) -> Void)
}
