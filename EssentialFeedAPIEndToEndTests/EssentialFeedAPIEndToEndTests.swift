//
//  EssentialFeedAPIEndToEndTests.swift
//  EssentialFeedAPIEndToEndTests
//
//  Created by Zeljko Lucic on 17.10.22..
//

import XCTest
import EssentialFeed

final class EssentialFeedAPIEndToEndTests: XCTestCase {

    func test_endToEndTestServerGETFeedResult_matchesFixedTestAccountData() {
        switch getFeedResult() {
        case let .success(items):
            XCTAssertEqual(items.count, 8, "Expected 8 items in the test account feed.")
        case let .failure(error):
            XCTFail("Expected successful feed result, got \(error) instead.")
        default:
            XCTFail("Expected successful feed result, got no result instead.")
        }
    }
    
    // MARK: - Helpers
    
    private func getFeedResult() -> Result<[FeedItem], RemoteFeedLoader.Error>? {
        let testServerURL = URL(string: "https://essentialdeveloper.com/feed-case-study/test-api/feed")!
        let client = URLSessionHTTPClient()
        let loader = RemoteFeedLoader(url: testServerURL, client: client)
        
        let expectation = expectation(description: "Wait for load completion...")
        
        var receivedResult: (Result<[FeedItem], RemoteFeedLoader.Error>)?
        loader.load { result in
            receivedResult = result
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
        return receivedResult
    }

}
