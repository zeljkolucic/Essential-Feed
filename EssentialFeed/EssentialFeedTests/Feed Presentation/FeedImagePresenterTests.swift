//
//  FeedImagePresenterTests.swift
//  EssentialFeedTests
//
//  Created by Zeljko Lucic on 23.1.23..
//

import XCTest

class FeedImagePresenter {
    
}

class FeedImagePresenterTests: XCTestCase {
    
    func test_init_doesNotSendMessagesToView() {
        let (_, view) = makeSUT()
        
        XCTAssertTrue(view.messages.isEmpty, "Expected no view messages.")
    }
    
    // MARK: - Helpers
    
    private func makeSUT(file: StaticString = #file, line: UInt = #line) -> (sut: FeedImagePresenter, view: ViewSpy) {
        let sut = FeedImagePresenter()
        let view = ViewSpy()
        trackForMemoryLeaks(view, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, view)
    }
    
    private class ViewSpy {
        var messages = [Any]()
    }
    
}
