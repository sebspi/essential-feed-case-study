import XCTest

class RemoteFeedLoader {
    
    let url: URL
    let client: HttpClient
    
    init(url: URL, client: HttpClient) {
        self.url = url
        self.client = client
    }
    
    func load() {
        client.get(from: url)
    }
}

protocol HttpClient {
    func get(from url: URL)
}

class RemoteFeedLoaderTest: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let (_, client) = makeSUT()
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        let url = URL(string: "https://any.url/given")!
        let (sut, client) = makeSUT(url: url)
        sut.load()
        XCTAssertEqual(client.requestedURL, url)
    }
    
    // MARK: - Helpers
    private func makeSUT(url: URL = URL(string: "https://any.url")!) -> (sut: RemoteFeedLoader, client: HttpClientSpy) {
        let client = HttpClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut, client)
    }
    
    class HttpClientSpy: HttpClient {
        var requestedURL: URL?
        
        func get(from url: URL) {
            requestedURL = url
        }
    }
}
