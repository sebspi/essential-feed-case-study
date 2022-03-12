//
//  FeedItemsMapper.swift
//  Essential Feed
//
//  Created by Sebastian Spies on 26.02.22.
//

import Foundation

internal final class FeedItemsMapper {
    
    private struct Root: Decodable {
        let items: [RemoteFeedItem]
    }
    
    internal static func map(_ data: Data, from response: HTTPURLResponse) throws -> [RemoteFeedItem] {
        guard response.statusCode == 200,
              let root = try? JSONDecoder().decode(Root.self, from: data) else {
                  throw RemoteFeedLoader.Error.invalidData
        }
        return root.items
    }
}
