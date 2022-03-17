//
//  FeedCachePolicy.swift
//  Essential Feed
//
//  Created by Sebastian Spies on 17.03.22.
//

import Foundation

final class FeedCachePolicy {
    
    private init() {}
    
    private static let maxAgeDays = 7
    
    private static let calendar = Calendar(identifier: .gregorian)
    
    static func validate(_ timestamp: Date, against date: Date) -> Bool {
        guard let maxCacheAge = calendar.date(byAdding: .day, value: maxAgeDays, to: timestamp) else {
            return false
        }
        return date < maxCacheAge
    }
}
