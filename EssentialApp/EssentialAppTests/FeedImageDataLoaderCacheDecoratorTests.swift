//
//  FeedImageDataLoaderCacheDecoratorTests.swift
//  EssentialAppTests
//
//  Created by Zeljko Lucic on 25.1.23..
//

import XCTest
import EssentialFeed

class FeedImageDataLoaderCacheDecorator: FeedImageDataLoader {
    private let decoratee: FeedImageDataLoader
    
    init(decoratee: FeedImageDataLoader) {
        self.decoratee = decoratee
    }
    
    private struct Task: FeedImageDataLoaderTask {
        func cancel() {
            
        }
    }
    
    func loadImageData(from url: URL, completion: @escaping (FeedImageDataLoader.Result) -> Void) -> FeedImageDataLoaderTask {
        return decoratee.loadImageData(from: url, completion: completion)
    }
}

class FeedImageDataLoaderCacheDecoratorTests: XCTestCase {
    
    func test_init_doesNotLoadImageData() {
        let (_, loader) = makeSUT()
        
        XCTAssertTrue(loader.loadedURLs.isEmpty, "Expected no loaded URLs")
    }
    
    func test_loadImageData_loadsFromLoader() {
        let url = anyURL()
        let (sut, loader) = makeSUT()
        
        _ = sut.loadImageData(from: url) { _ in }
        
        XCTAssertEqual(loader.loadedURLs, [url])
    }
    
    func test_cancelLoadImageData_cancelsLoaderTask() {
        let url = anyURL()
        let (sut, loader) = makeSUT()
        
        let task = sut.loadImageData(from: url) { _ in }
        task.cancel()
        
        XCTAssertEqual(loader.cancelledURLs, [url], "Expected to cancel URL loading from loader")
    }
    
    // MARK: - Helpers
    
    private func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> (sut: FeedImageDataLoaderCacheDecorator, loader: FeedImageDataLoaderSpy) {
        let loader = FeedImageDataLoaderSpy()
        let sut = FeedImageDataLoaderCacheDecorator(decoratee: loader)
        trackForMemoryLeaks(loader)
        trackForMemoryLeaks(sut)
        return (sut, loader)
    }
    
    private class FeedImageDataLoaderSpy: FeedImageDataLoader {
        private var messages = [(url: URL, completion: (FeedImageDataLoader.Result) -> Void)]()
        
        private(set) var cancelledURLs = [URL]()
        
        var loadedURLs: [URL] {
            return messages.map { $0.url }
        }
        
        private struct Task: FeedImageDataLoaderTask {
            let callback: () -> Void
            func cancel() { callback() }
        }
        
        func loadImageData(from url: URL, completion: @escaping (FeedImageDataLoader.Result) -> Void) -> FeedImageDataLoaderTask {
            messages.append((url, completion))
            return Task { [weak self] in
                self?.cancelledURLs.append(url)
            }
        }
    }
    
}
