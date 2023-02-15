//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Zeljko Lucic on 25.1.23..
//

import Foundation

public protocol FeedCache {
    func save(_ feed: [FeedImage]) throws
}
