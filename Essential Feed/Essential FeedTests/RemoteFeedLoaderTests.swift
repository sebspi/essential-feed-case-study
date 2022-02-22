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

class HttpClientSpy: HttpClient {
    
    var requestedURL: URL?
    
    func get(from url: URL) {
        requestedURL = url
    }
}

class RemoteFeedLoaderTest: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let url = URL(string: "https://any.url")!
        let client = HttpClientSpy()
        _ = RemoteFeedLoader(url: url, client: client)
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        let url = URL(string: "https://any.url/given")!
        let client = HttpClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        sut.load()
        XCTAssertEqual(client.requestedURL, url)
    }
}
