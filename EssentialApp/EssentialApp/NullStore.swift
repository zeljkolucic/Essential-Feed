//
//  NullStore.swift
//  EssentialApp
//
//  Created by Zeljko Lucic on 13.2.23..
//

import Foundation
import EssentialFeed

class NullStore: FeedStore {
    func deleteCachedFeed(completion: @escaping DeletionCompletion) {
        completion(.success(()))
    }
    
    func insert(_ feed: [EssentialFeed.LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
        completion(.success(()))
    }
    
    func retrieve(completion: @escaping RetrievalCompletion) {
        completion(.success(.none))
    }
}
    
extension NullStore: FeedImageDataStore {
    func insert(_ data: Data, for url: URL) throws {}
    
    func retrieve(dataForURL url: URL) throws -> Data? {
        return .none
    }
}
