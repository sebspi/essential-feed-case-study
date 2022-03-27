//
//  LocalFeedLoader.swift
//  Essential Feed
//
//  Created by Sebastian Spies on 12.03.22.
//

import Foundation

public final class LocalFeedLoader: FeedLoader {
    
    private let store: FeedStore
    private let currentDate: () -> Date

    public typealias SaveResult = Error?
    public typealias LoadResult = FeedLoader.Result
    
    public init(store: FeedStore, currentDate: @escaping () -> Date) {
        self.store = store
        self.currentDate = currentDate
    }
    
    public func save(_ feed: [FeedImage], completion: @escaping (SaveResult) -> Void) {
        store.deleteCachedFeed { [weak self] error in
            guard let self = self else { return }
            if let cacheDeletionError = error {
                completion(cacheDeletionError)
            } else {
                self.cache(feed, with: completion)
            }
        }
    }
    
    public func load(completion: @escaping (LoadResult) -> Void) {
        store.retrieve { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case let .failure(error):
                completion(.failure(error))
                
            case let .found(feed, timestamp) where FeedCachePolicy.validate(timestamp, against: self.currentDate()):
                completion(.success(feed.toModels()))
                
            case .found, .empty:
                completion(.success([]))
            }
        }
    }
    
    private func cache(_ feed: [FeedImage], with completion: @escaping (SaveResult) -> Void) {
        store.insert(feed.toLocal(), timestamp: currentDate(), completion: { [weak self] error in
            guard self != nil else { return }
            completion(error)
        })
    }
    
    public func validateCache() {
        store.retrieve { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .failure:
                self.store.deleteCachedFeed(completion: { _ in})
            case let .found(_, timestamp) where !FeedCachePolicy.validate(timestamp, against: self.currentDate()):
                self.store.deleteCachedFeed(completion: { _ in })
            default: break
            }
        }
    }
}

private extension Array where Element == FeedImage {
    func toLocal() -> [LocalFeedImage] {
        return map { LocalFeedImage(id: $0.id, description: $0.description, location: $0.location, url: $0.url)}
    }
}

private extension Array where Element == LocalFeedImage {
    func toModels() -> [FeedImage] {
        return map { FeedImage(id: $0.id, description: $0.description, location: $0.location, url: $0.url)}
    }
}
