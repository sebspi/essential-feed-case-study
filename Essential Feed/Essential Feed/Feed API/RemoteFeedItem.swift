//
//  RemoteFeedItem.swift
//  Essential Feed
//
//  Created by Sebastian Spies on 12.03.22.
//

import Foundation

internal struct RemoteFeedItem: Decodable {
    internal let id: UUID
    internal let description: String?
    internal let location: String?
    internal let image: URL
}
