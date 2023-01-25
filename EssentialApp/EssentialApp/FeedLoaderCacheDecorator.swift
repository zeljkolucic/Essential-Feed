//
//  FeedLoaderCacheDecorator.swift
//  EssentialApp
//
//  Created by Zeljko Lucic on 25.1.23..
//

import Foundation
import EssentialFeed

public class FeedLoaderCacheDecorator: FeedLoader {
    private let decoratee: FeedLoader
    private let cache: FeedCache
    
    public init(decoratee: FeedLoader, cache: FeedCache) {
        self.decoratee = decoratee
        self.cache = cache
    }
    
    public func load(completion: @escaping (FeedLoader.Result) -> Void) {
        decoratee.load { [weak self] result in
            switch result {
            case let .success(feed):
                self?.cache.save(feed) { _ in }
                completion(.success(feed))
                
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
