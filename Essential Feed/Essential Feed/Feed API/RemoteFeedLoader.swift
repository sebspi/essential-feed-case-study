import Foundation

public protocol HttpClient {
    func get(from url: URL, completion: @escaping (Error) -> Void)
}

public final class RemoteFeedLoader {
    
    private let url: URL
    private let client: HttpClient
    
    public enum Error: Swift.Error {
        case connectivity
    }
    
    public init(url: URL, client: HttpClient) {
        self.url = url
        self.client = client
    }
    
    public func load(completion: @escaping (Error) -> Void = { _ in } ) {
        client.get(from: url, completion: { error in
            completion(.connectivity)
        })
    }
}
