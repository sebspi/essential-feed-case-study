//
//  FeedItem.swift
//  Essential Feed
//
//  Created by Sebastian Spies on 19.02.22.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID
    let desription: String?
    let location: String?
    let imageURL: URL
}
