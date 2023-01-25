//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Zeljko Lucic on 25.1.23..
//

import Foundation

public protocol FeedCache {
    typealias Result = Swift.Result<Void, Error>
    
    func save(_ feed: [FeedImage], completion: @escaping (Result) -> Void)
}
