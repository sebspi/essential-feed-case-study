//
//  HTTPClient.swift
//  Essential Feed
//
//  Created by Sebastian Spies on 26.02.22.
//

import Foundation

public protocol HTTPClient {
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>
    
    /// The completion handler can be invoked in any thread.
    /// Clients are responsible to dispatch to appropriate threads, if needed.
    func get(from url: URL, completion: @escaping (HTTPClient.Result) -> Void)
}
