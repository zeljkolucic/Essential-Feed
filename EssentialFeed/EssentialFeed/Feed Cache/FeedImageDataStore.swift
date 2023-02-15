//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Zeljko Lucic on 24.1.23..
//

import Foundation

public protocol FeedImageDataStore {
    func insert(_ data: Data, for url: URL) throws
    func retrieve(dataForURL url: URL) throws -> Data?
}
