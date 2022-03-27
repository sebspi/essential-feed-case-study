//
//  ShareTestHelpers.swift
//  Essential FeedTests
//
//  Created by Sebastian Spies on 13.03.22.
//

import Foundation

func anyURL() -> URL {
    return URL(string: "http://any-url.com")!
}

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}
