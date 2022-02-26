//
//  HTTPClient.swift
//  Essential Feed
//
//  Created by Sebastian Spies on 26.02.22.
//

import Foundation

public enum HttpClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HttpClient {
    
    func get(from url: URL, completion: @escaping (HttpClientResult) -> Void)
}
